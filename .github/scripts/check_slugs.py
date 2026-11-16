"""Validate article slug links against published Markdown and the generated slug inventory."""

import argparse
from collections import defaultdict
from dataclasses import dataclass
from html.parser import HTMLParser
import json
import os
from pathlib import Path
import re
from urllib.parse import unquote

from markdown_it import MarkdownIt
from markdown_it.rules_inline import autolink, html_inline, link
import yaml


IGNORED_DIRECTORIES = {"node_modules", "vendor", "_site", "_build"}
GENERATED_SLUGS = "scripts/generated-slugs.txt"
MARKDOWN = MarkdownIt("commonmark")
LIQUID_SLUG = re.compile(r"{%[ \t]*slug[ \t]+([^ \t\r\n]*?)[ \t]*%}")


def with_source_line(rule):
    def parse(state, silent):
        start = state.pos
        token_index = len(state.tokens)
        matched = rule(state, silent)
        if matched and not silent:
            # The rule may flush pending text before emitting the link or HTML token.
            for token in state.tokens[token_index:]:
                if token.type in {"link_open", "html_inline"}:
                    token.meta["source_line"] = state.src.count("\n", 0, start)
                    break
        return matched

    return parse


for name, rule in (("link", link), ("autolink", autolink), ("html_inline", html_inline)):
    MARKDOWN.inline.ruler.at(name, with_source_line(rule))


@dataclass(frozen=True)
class Location:
    file: str
    line: int


@dataclass(frozen=True)
class Problem:
    location: Location
    message: str


class HTMLLinks(HTMLParser):
    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.links = []

    def handle_starttag(self, tag, attrs):
        if tag == "a":
            for name, value in attrs:
                if name == "href" and value is not None:
                    self.links.append((value, self.getpos()[0] - 1))


def markdown_files(root):
    for directory, directories, files in os.walk(root):
        directories[:] = sorted(
            name for name in directories
            if not name.startswith(".") and name not in IGNORED_DIRECTORIES
        )
        for name in sorted(files):
            if Path(name).suffix.lower() == ".md":
                yield Path(directory) / name


def read_article(path, root):
    """Return metadata, body, body line offset, and the slug's source location."""
    relative = path.relative_to(root).as_posix()
    lines = path.read_text(encoding="utf-8-sig").splitlines(keepends=True)
    if not lines or lines[0].strip() != "---":
        return {}, "".join(lines), 0, Location(relative, 1)

    end = next(
        (i for i in range(1, len(lines)) if lines[i].strip() in {"---", "..."}),
        None,
    )
    if end is None:
        raise ValueError("Unterminated YAML front matter")
    metadata = yaml.safe_load("".join(lines[1:end]))
    if metadata is None:
        metadata = {}
    if not isinstance(metadata, dict):
        raise ValueError("YAML front matter must be a mapping")
    slug_line = next(
        (i + 1 for i in range(1, end) if re.match(r"^(?:slug|'slug'|\"slug\")\s*:", lines[i])),
        1,
    )
    return metadata, "".join(lines[end + 1:]), end + 1, Location(relative, slug_line)


def article_links(body, offset):
    """Use Markdown tokens so code, comments, and ordinary text are not links."""
    body = LIQUID_SLUG.sub(r"slug:\1", body)
    for block in MARKDOWN.parse(body):
        line = offset + (block.map[0] if block.map else 0) + 1
        tokens = block.children if block.type == "inline" else [block]
        for token in tokens:
            token_line = line + token.meta.get("source_line", 0)
            if token.type == "link_open":
                yield token.attrGet("href"), token_line
            elif token.type in {"html_inline", "html_block"}:
                parser = HTMLLinks()
                parser.feed(token.content)
                parser.close()
                for href, relative_line in parser.links:
                    yield href, token_line + relative_line


def validate(root):
    index = defaultdict(list)
    references = []
    problems = []
    count = 0
    try:
        generated_lines = (root / GENERATED_SLUGS).read_text(encoding="utf-8-sig").splitlines()
    except (OSError, UnicodeError) as error:
        problems.append(Problem(Location(GENERATED_SLUGS, 1), str(error)))
    else:
        for line, value in enumerate(generated_lines, start=1):
            slug = value.strip()
            if not slug or slug.startswith("#"):
                continue
            location = Location(GENERATED_SLUGS, line)
            if any(character.isspace() for character in slug):
                problems.append(Problem(location, "Expected one generated slug per line"))
            else:
                index[slug].append(location)
    for path in markdown_files(root):
        count += 1
        relative = path.relative_to(root).as_posix()
        try:
            metadata, body, offset, location = read_article(path, root)
        except (OSError, UnicodeError, yaml.YAMLError, ValueError) as error:
            problems.append(Problem(Location(relative, 1), str(error)))
            continue
        if metadata.get("published", metadata.get("publish")) is False:
            continue
        if "slug" in metadata:
            slug = metadata["slug"]
            if not isinstance(slug, str) or not slug.strip():
                problems.append(Problem(location, "The slug must be a non-empty string"))
            else:
                index[slug].append(location)
        for href, line in article_links(body, offset):
            if href.lower().startswith("slug:"):
                slug = unquote(re.split(r"[?#]", href[5:], maxsplit=1)[0])
                references.append((slug, Location(relative, line)))

    for slug, locations in sorted(index.items()):
        if len(locations) > 1:
            articles = ", ".join(f"{loc.file}:{loc.line}" for loc in locations)
            for location in locations:
                problems.append(Problem(location, f"Duplicate slug '{slug}': {articles}"))
    for slug, location in references:
        if slug not in index:
            problems.append(Problem(location, f"Unknown slug '{slug}'"))
    return dict(sorted(index.items())), problems, count, len(references)


def report(problem):
    location = problem.location
    if os.environ.get("GITHUB_ACTIONS") == "true":
        def escape(value):
            return str(value).replace("%", "%25").replace("\r", "%0D").replace("\n", "%0A")

        file = escape(location.file).replace(":", "%3A").replace(",", "%2C")
        print(f"::error file={file},line={location.line}::{escape(problem.message)}")
    else:
        print(f"{location.file}:{location.line}: {problem.message}")


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--root", type=Path, default=Path(__file__).resolve().parents[2],
        help="Repository directory (defaults to this script's repository)",
    )
    parser.add_argument(
        "--output", type=Path, default=Path("slugs.json"),
        help="JSON slug-to-articles inventory (default: slugs.json)",
    )
    args = parser.parse_args(argv)
    root = args.root.resolve()
    if not root.is_dir():
        parser.error(f"Repository directory does not exist: {root}")
    index, problems, articles, links = validate(root)
    inventory = {
        slug: [{"file": loc.file, "line": loc.line} for loc in locations]
        for slug, locations in index.items()
    }
    args.output.write_text(json.dumps(inventory, indent=2) + "\n", encoding="utf-8")
    for problem in problems:
        report(problem)
    print(
        f"Checked {articles} Markdown files, {len(index)} unique slugs, "
        f"and {links} slug links; {len(problems)} error(s). "
        f"Inventory: {args.output}"
    )
    if articles == 0:
        print("No Markdown files found; refusing to pass an empty scan.")
        return 1
    return 1 if problems else 0


if __name__ == "__main__":
    raise SystemExit(main())
