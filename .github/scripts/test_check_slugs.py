import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

from check_slugs import GENERATED_SLUGS, main, validate


class CheckSlugsTests(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory()
        self.addCleanup(self.directory.cleanup)
        self.root = Path(self.directory.name)
        self.write(GENERATED_SLUGS, "# No generated articles for this test.\n")

    def write(self, name, content):
        path = self.root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content, encoding="utf-8")

    def test_links_resolve_across_files_with_anchors_queries_and_encoding(self):
        self.write("target.MD", '---\nslug: "folder/hello!" # comment\n---\n')
        self.write("source.md", """---
slug: source
---
[inline](slug:folder/hello!#section)
[reference][target]
<slug:folder/hello!>
<a href='slug:folder/hello%21?view=full#section'>HTML</a>

[target]: slug:folder/hello!
""")
        index, problems, count, links = validate(self.root)
        self.assertEqual(problems, [])
        self.assertEqual(count, 2)
        self.assertEqual(links, 4)
        self.assertEqual(set(index), {"source", "folder/hello!"})

    def test_duplicate_slug_reports_every_article_even_when_unlinked(self):
        self.write("one.md", "---\nslug: same\n---\n")
        self.write("two.md", "---\nslug: 'same'\npublished: true\n---\n")
        index, problems, _, _ = validate(self.root)
        self.assertEqual(len(index["same"]), 2)
        self.assertEqual({p.location.file for p in problems}, {"one.md", "two.md"})
        self.assertTrue(all("Duplicate slug 'same'" in p.message for p in problems))

    def test_liquid_slug_links_resolve_in_markdown_references_and_html(self):
        self.write(GENERATED_SLUGS, "viewer/methods\n")
        self.write("target.md", "---\nslug: folder/hello!\n---\n")
        self.write("links.md", """[inline]({%slug folder/hello!%})
[spaced]({% slug folder/hello%21 %}?view=full#section "Title")
[reference][target]
<a href="{%slug viewer/methods%}#section">HTML</a>

[target]: {%slug viewer/methods%}
""")
        _, problems, _, links = validate(self.root)
        self.assertEqual(problems, [])
        self.assertEqual(links, 4)

    def test_unknown_liquid_slugs_preserve_source_lines(self):
        self.write("links.md", """---
slug: source
---
Paragraph introduction.
[first]({%slug missing%}) and [second]({% slug other %}#section).
[empty]({%slug %}).
`code
span` [last]({%slug last%}).
<a
 href="{%slug html-missing%}">HTML</a>
""")
        _, problems, _, links = validate(self.root)
        self.assertEqual(links, 5)
        self.assertEqual(
            [(p.message, p.location.file, p.location.line) for p in problems],
            [
                ("Unknown slug 'missing'", "links.md", 5),
                ("Unknown slug 'other'", "links.md", 5),
                ("Unknown slug ''", "links.md", 6),
                ("Unknown slug 'last'", "links.md", 8),
                ("Unknown slug 'html-missing'", "links.md", 9),
            ],
        )

    def test_liquid_slugs_in_code_comments_images_and_prose_are_not_links(self):
        self.write("links.md", """`[ignored]({%slug inline-code%})`

~~~md
[ignored]({%slug fenced-code%})
~~~

    [ignored]({%slug indented-code%})

<!-- [ignored]({%slug comment%})
<a href="{%slug comment-html%}">ignored</a> -->

![image]({%slug image%})
Plain Liquid tag: {%slug prose%}.
""")
        self.write(
            "draft.md",
            "---\npublished: False\n---\n[ignored]({%slug unpublished%})\n",
        )
        _, problems, _, links = validate(self.root)
        self.assertEqual(problems, [])
        self.assertEqual(links, 0)

    def test_unpublished_articles_do_not_contribute_slugs_or_link_errors(self):
        self.write("live.md", "---\nslug: same\npublished: True\n---\n")
        for number, value in enumerate(("false", "False", "FALSE")):
            self.write(
                f"draft-{number}.md",
                f"---\nslug: same\npublished: {value}\n---\n[bad](slug:missing)",
            )
        self.write("invalid-draft.md", "---\nslug:\npublished: False\n---\n")
        index, problems, _, links = validate(self.root)
        self.assertEqual(problems, [])
        self.assertEqual(links, 0)
        self.assertEqual([loc.file for loc in index["same"]], ["live.md"])

    def test_published_article_cannot_link_to_an_unpublished_slug(self):
        self.write("draft.md", "---\nslug: draft\npublished: False\n---\n")
        self.write("live.md", "---\nslug: live\n---\n[hidden](slug:draft)")
        index, problems, _, _ = validate(self.root)
        self.assertNotIn("draft", index)
        self.assertEqual([p.message for p in problems], ["Unknown slug 'draft'"])

    def test_explicit_generated_slugs_are_valid_without_a_legacy_article(self):
        self.write(GENERATED_SLUGS, "# Artifact inventory\nviewer/methods\nviewer/overview\n")
        self.write("links.md", "[section](slug:viewer/methods#details)\n[overview](slug:viewer/overview)")
        index, problems, _, links = validate(self.root)
        self.assertEqual(problems, [])
        self.assertEqual(links, 2)
        self.assertEqual(set(index), {"viewer/methods", "viewer/overview"})
        self.assertEqual(index["viewer/methods"][0].file, GENERATED_SLUGS)

    def test_generated_slugs_participate_in_duplicate_detection(self):
        self.write(GENERATED_SLUGS, "same\n")
        self.write("other.md", "---\nslug: same\n---\n")
        index, problems, _, _ = validate(self.root)
        self.assertEqual(len(index["same"]), 2)
        self.assertEqual(len(problems), 2)
        self.assertTrue(all("Duplicate slug 'same'" in p.message for p in problems))
        self.assertEqual(
            {p.location.file for p in problems}, {"other.md", GENERATED_SLUGS},
        )

    def test_duplicate_entries_in_generated_inventory_are_reported(self):
        self.write(GENERATED_SLUGS, "same\nsame\n")
        _, problems, _, _ = validate(self.root)
        self.assertEqual(len(problems), 2)
        self.assertTrue(all("Duplicate slug 'same'" in p.message for p in problems))

    def test_legacy_articles_no_longer_create_generated_slugs_or_aliases(self):
        self.write("legacy.md", "---\nslug: old-viewer/methods/member\npublished: False\n---\n")
        self.write("overview.md", "---\nslug: old-viewer/overview\npublish: False\n---\n")
        self.write(
            "links.md",
            "[member](slug:viewer/methods/member)\n[section](slug:viewer/methods)\n"
            "[overview](slug:viewer/overview)\n[parent](slug:viewer)",
        )
        index, problems, _, _ = validate(self.root)
        self.assertEqual(index, {})
        self.assertEqual(
            {p.message for p in problems},
            {"Unknown slug 'viewer/methods/member'", "Unknown slug 'viewer/methods'",
             "Unknown slug 'viewer/overview'", "Unknown slug 'viewer'"},
        )

    def test_generated_inventory_does_not_imply_member_or_overview_aliases(self):
        self.write(GENERATED_SLUGS, "viewer/methods\nviewer/overview\n")
        self.write("links.md", "[member](slug:viewer/methods/member)\n[parent](slug:viewer)")
        _, problems, _, _ = validate(self.root)
        self.assertEqual(
            {p.message for p in problems},
            {"Unknown slug 'viewer/methods/member'", "Unknown slug 'viewer'"},
        )

    def test_missing_or_malformed_generated_inventory_fails_explicitly(self):
        (self.root / GENERATED_SLUGS).unlink()
        self.write("live.md", "---\nslug: live\n---\n")
        _, problems, _, _ = validate(self.root)
        self.assertEqual(len(problems), 1)
        self.assertEqual(problems[0].location.file, GENERATED_SLUGS)
        for other in (
            "two slugs\n",
            "invalid\tslug\n",
        ):
            with self.subTest(other=other):
                self.write(GENERATED_SLUGS, other)
                _, problems, _, _ = validate(self.root)
                self.assertEqual(
                    [p.message for p in problems], ["Expected one generated slug per line"],
                )

    def test_unknown_links_include_markdown_references_and_multiline_html(self):
        self.write("source.md", """---
slug: source
---
[bad](slug:missing#anchor)
[reference][bad]

[bad]: slug:other

<a
 href="slug:html-missing">HTML</a>
""")
        _, problems, _, links = validate(self.root)
        self.assertEqual(links, 3)
        self.assertEqual(
            {p.message for p in problems},
            {"Unknown slug 'missing'", "Unknown slug 'other'", "Unknown slug 'html-missing'"},
        )
        self.assertTrue(all(p.location.line >= 4 for p in problems))

    def test_code_comments_plain_text_and_external_links_are_not_slug_links(self):
        self.write("source.md", """---
slug: source
---
`[example](slug:inline-code)`
````md
[example](slug:fenced-code)
````

    [example](slug:indented-code)

<!-- [example](slug:comment) <a href="slug:comment-html">comment</a> -->
Plain text slug:not-a-link.
[external](https://example.com/slug:external)
[anchor](#anchor)
[relative](other.md)
""")
        _, problems, _, links = validate(self.root)
        self.assertEqual(problems, [])
        self.assertEqual(links, 0)

    def test_invalid_front_matter_and_empty_slugs_fail_explicitly(self):
        for name, content in {
            "malformed.md": "---\nslug: [\n---\n",
            "empty.md": "---\nslug:\n---\n",
            "numeric.md": "---\nslug: 42\n---\n",
            "unterminated.md": "---\nslug: missing-end\n",
            "list.md": "---\n- not a mapping\n---\n",
        }.items():
            self.write(name, content)
        _, problems, _, _ = validate(self.root)
        self.assertEqual(len(problems), 5)

    def test_files_without_slugs_are_checked_but_hidden_and_generated_files_are_not(self):
        self.write("snippet.md", "[bad](slug:missing)")
        self.write(".git/hidden.md", "---\nslug: ignored\n---\n")
        self.write("node_modules/package/readme.md", "[bad](slug:ignored)")
        self.write("_site/generated.md", "[bad](slug:ignored)")
        _, problems, count, _ = validate(self.root)
        self.assertEqual(count, 1)
        self.assertEqual([p.message for p in problems], ["Unknown slug 'missing'"])

    def test_matching_is_case_sensitive_and_empty_targets_fail(self):
        self.write("one.md", "---\nslug: Real\n---\n[bad](slug:real)\n[empty](slug:)\n")
        _, problems, _, _ = validate(self.root)
        self.assertEqual(
            {p.message for p in problems}, {"Unknown slug 'real'", "Unknown slug ''"},
        )

    def test_cli_writes_inventory_even_when_validation_fails(self):
        self.write("one.md", "---\nslug: real\n---\n[bad](slug:missing)\n")
        output = self.root / "slugs.json"
        with patch("builtins.print"):
            status = main(["--root", str(self.root), "--output", str(output)])
        self.assertEqual(status, 1)
        self.assertEqual(
            json.loads(output.read_text(encoding="utf-8")),
            {"real": [{"file": "one.md", "line": 2}]},
        )

    def test_cli_succeeds_for_valid_repository_and_fails_for_empty_scan(self):
        output = self.root / "slugs.json"
        with patch("builtins.print"):
            self.assertEqual(main(["--root", str(self.root), "--output", str(output)]), 1)
            self.write("valid.md", "---\nslug: valid\n---\n[self](slug:valid)")
            self.assertEqual(main(["--root", str(self.root), "--output", str(output)]), 0)


if __name__ == "__main__":
    unittest.main()
