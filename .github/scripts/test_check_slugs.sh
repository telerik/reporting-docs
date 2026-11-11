#!/usr/bin/env bash
set -euo pipefail

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
temporary=$(mktemp -d)
trap 'rm -rf -- "$temporary"' EXIT
passed=0

new_case() {
    name=$1
    test_actions=false
    case_root="$temporary/$name"
    mkdir -p -- "$case_root/scripts"
    : > "$case_root/scripts/generated-slugs.txt"
}

write() {
    mkdir -p -- "$(dirname -- "$case_root/$1")"
    cat > "$case_root/$1"
}

fail() {
    printf 'FAIL: %s: %s\n' "$name" "$1" >&2
    if [[ -f $case_root/result.log ]]; then
        sed -n '1,20p' "$case_root/result.log" >&2
    fi
    exit 1
}

check() {
    local expected=$1 status
    if GITHUB_ACTIONS=$test_actions bash "$script_dir/check_slugs.sh" --root "$case_root" \
        --output "$case_root/slugs.json" > "$case_root/result.log" 2>&1; then
        status=0
    else
        status=$?
    fi
    [[ $status == "$expected" ]] || fail "expected exit $expected, got $status"
    [[ -s $case_root/slugs.json ]] || fail "inventory was not written"
}

contains() {
    grep -Fq -- "$1" "$case_root/result.log" || fail "missing diagnostic: $1"
}

done_case() {
    passed=$((passed + 1))
    printf 'PASS: %s\n' "$name"
}

new_case inline-reference-html-links
write target.MD <<'MD'
---
slug: "folder/hello!" # comment
---
MD
write source.md <<'MD'
---
slug: source
---
[inline](slug:folder/hello!#section)
[reference][target]
<slug:folder/hello!>
<a href='slug:folder/hello%21?view=full#section'>HTML</a>

[target]: slug:folder/hello!
MD
check 0
contains '2 unique slugs, and 4 slug links; 0 error(s).'
done_case

new_case duplicate-slugs
write one.md <<'MD'
---
slug: same
---
MD
write two.md <<'MD'
---
slug: 'same'
published: true
---
MD
check 1
[[ $(grep -c "Duplicate slug 'same'" "$case_root/result.log") == 2 ]] || fail 'duplicates not reported for both files'
done_case

new_case unpublished-articles
write live.md <<'MD'
---
slug: same
published: True
---
MD
number=0
for boolean in false False FALSE; do
    number=$((number + 1))
    write "draft-$number.md" <<MD
---
slug: same
published: $boolean
---
[ignored](slug:missing)
MD
done
write invalid-draft.md <<'MD'
---
slug:
publish: False
---
MD
check 0
contains '1 unique slugs, and 0 slug links; 0 error(s).'
done_case

new_case indentless-yaml-sequences
write target.md <<'MD'
---
slug: target
previous_url:
- /old-url
- /another-old-url
---
MD
write links.md <<'MD'
[target](slug:target)
MD
check 0
contains '1 unique slugs, and 1 slug links; 0 error(s).'
done_case

new_case unpublished-link-target
write draft.md <<'MD'
---
slug: draft
published: False
---
MD
write live.md <<'MD'
[hidden](slug:draft)
MD
check 1
contains "Unknown slug 'draft'"
done_case

new_case unknown-markdown-reference-and-html
write source.md <<'MD'
---
slug: source
---
[bad](slug:missing#anchor)
[reference][bad]

[bad]: slug:other

<a
 href="slug:html-missing">HTML</a>
MD
check 1
contains "Unknown slug 'missing'"
contains "Unknown slug 'other'"
contains "Unknown slug 'html-missing'"
contains '3 slug links; 3 error(s).'
done_case

new_case ignored-code-comments-and-external-links
write source.md <<'MD'
---
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
![image](slug:image)
MD
check 0
contains '0 slug links; 0 error(s).'
done_case

new_case invalid-front-matter
write malformed.md <<'MD'
---
slug: [
---
MD
write empty.md <<'MD'
---
slug:
---
MD
write numeric.md <<'MD'
---
slug: 42
---
MD
write unterminated.md <<'MD'
---
slug: missing-end
MD
write list.md <<'MD'
---
- not a mapping
---
MD
check 1
contains '5 error(s).'
done_case

new_case ignored-directories
write snippet.md <<'MD'
[bad](slug:missing)
MD
for directory in .git .github node_modules vendor _site _build; do
    write "$directory/ignored.md" <<'MD'
[ignored](slug:ignored)
MD
done
check 1
contains 'Checked 1 Markdown files'
contains "Unknown slug 'missing'"
done_case

new_case case-sensitive-and-empty-targets
write one.md <<'MD'
---
slug: Real
---
[bad](slug:real)
[empty](slug:)
MD
check 1
contains "Unknown slug 'real'"
contains "Unknown slug ''"
contains '2 error(s).'
done_case

new_case generated-slugs
write scripts/generated-slugs.txt <<'TXT'
viewer/methods
viewer/overview
TXT
write links.md <<'MD'
[section](slug:viewer/methods#details)
[overview](slug:viewer/overview)
MD
check 0
contains '2 unique slugs, and 2 slug links; 0 error(s).'
done_case

new_case generated-slug-collisions
write scripts/generated-slugs.txt <<'TXT'
same
TXT
write other.md <<'MD'
---
slug: same
---
MD
check 1
contains "scripts/generated-slugs.txt:1: Duplicate slug 'same'"
contains "other.md:2: Duplicate slug 'same'"
done_case

new_case duplicate-generated-inventory
write scripts/generated-slugs.txt <<'TXT'
same
same
TXT
write live.md <<'MD'
Article body.
MD
check 1
contains '2 error(s).'
done_case

new_case no-legacy-or-synthetic-aliases
write scripts/generated-slugs.txt <<'TXT'
viewer/methods
viewer/overview
TXT
write legacy.md <<'MD'
---
slug: old-viewer/methods/member
published: False
---
MD
write links.md <<'MD'
[member](slug:viewer/methods/member)
[parent](slug:viewer)
MD
check 1
contains "Unknown slug 'viewer/methods/member'"
contains "Unknown slug 'viewer'"
contains '2 error(s).'
done_case

new_case missing-and-malformed-inventory
write live.md <<'MD'
Article body.
MD
rm -- "$case_root/scripts/generated-slugs.txt"
check 1
contains 'Cannot read generated slug inventory'
write scripts/generated-slugs.txt <<'TXT'
two slugs
TXT
check 1
contains 'Expected one generated slug per line'
done_case

new_case exact-json-inventory
write one.md <<'MD'
---
slug: real
---
[bad](slug:missing)
MD
check 1
cat > "$case_root/expected.json" <<'JSON'
{
  "real": [
    {
      "file": "one.md",
      "line": 2
    }
  ]
}
JSON
diff -u "$case_root/expected.json" "$case_root/slugs.json" || fail 'inventory differs'
done_case

new_case empty-scan
check 1
contains 'No Markdown files found'
done_case

new_case nested-parentheses-and-reference-labels
write target.md <<'MD'
---
slug: folder/error(e,-args)
---
MD
write links.md <<'MD'
[inline](slug:folder/error(e,-args) "title")
[reference][Mixed Label]
[Mixed Label][]
[Mixed Label]

[mixed label]: <slug:folder/error(e,-args)>
MD
check 0
contains '4 slug links; 0 error(s).'
done_case

new_case html-entities-and-yaml-escapes
write target.md <<'MD'
---
slug: "folder/a&b\u0021"
---
MD
write links.md <<'MD'
[markdown](slug:folder/a&amp;b!)
<a href="slug:folder/a&#38;b%21">HTML</a>
MD
check 0
contains '2 slug links; 0 error(s).'
done_case

new_case quoted-publication-flag
write source.md <<'MD'
---
slug: published-string
published: "False"
---
[bad](slug:missing)
MD
check 1
contains "Unknown slug 'missing'"
done_case

new_case nested-fences-and-multiline-code
write source.md <<'MD'
> ~~~md
> [ignored](slug:quoted-fence)
> ~~~

- Item

  ~~~md
  [ignored](slug:list-fence)
  ~~~

`[ignored](slug:multiline
code)`

[bad](slug:visible)
MD
check 1
contains '1 slug links; 1 error(s).'
contains "Unknown slug 'visible'"
done_case

new_case tab-indented-nested-lists
write links.md <<'MD'
1. A list item.

	+ [nested](slug:missing)
MD
check 1
contains "Unknown slug 'missing'"
contains '1 slug links; 1 error(s).'
done_case

new_case parent-list-continuations
write links.md <<'MD'
1. Parent item.

	- Nested item.

	Back in the parent [paragraph](slug:missing).
MD
check 1
contains '1 slug links; 1 error(s).'
contains "Unknown slug 'missing'"
done_case

new_case indented-html-is-code
write source.md <<'MD'
HTML example:

	<table>
		<tr><td><a href="slug:ignored">example</a></td></tr>
	</table>

[bad](slug:visible)
MD
check 1
contains '1 slug links; 1 error(s).'
contains "Unknown slug 'visible'"
done_case

new_case leading-inline-code-does-not-create-indented-blocks
write links.md <<'MD'
`Code` starts a paragraph with a [link](slug:first).

* `A code-formatted list label`

	Continuation with [another link](slug:second).
MD
check 1
contains '2 slug links; 2 error(s).'
contains "Unknown slug 'first'"
contains "Unknown slug 'second'"
done_case

new_case blockquotes-inside-lists
write links.md <<'MD'
1. List item.

    >caption An image caption.

    ![image](image.png)

    A continued paragraph with a [link](slug:missing).
MD
check 1
contains '1 slug links; 1 error(s).'
contains "Unknown slug 'missing'"
done_case

new_case 'paths with spaces and escaped JSON'
write 'article name.md' <<'MD'
---
slug: 'folder/say"hi\there'
---
[self](slug:folder/say%22hi%5Cthere)
MD
check 0
cat > "$case_root/expected.json" <<'JSON'
{
  "folder/say\"hi\\there": [
    {
      "file": "article name.md",
      "line": 2
    }
  ]
}
JSON
diff -u "$case_root/expected.json" "$case_root/slugs.json" || fail 'JSON escaping differs'
done_case

new_case escaped-github-annotations
test_actions=true
write 'file,name%.md' <<'MD'
[bad](slug:missing%25x)
MD
check 1
contains "::error file=file%2Cname%25.md,line=1::Unknown slug 'missing%25x'"
done_case

new_case comment-markers-in-code-examples
write links.md <<'MD'
~~~html
<!-- An unclosed comment in a code example.
~~~

[first](slug:first)

    <!-- Another unclosed comment, in indented code.

[second](slug:second)

<!-- A real comment with a fake fence.
~~~
-->

[third](slug:third)
MD
check 1
contains '3 slug links; 3 error(s).'
contains "Unknown slug 'first'"
contains "Unknown slug 'second'"
contains "Unknown slug 'third'"
done_case

new_case inline-code-does-not-span-paragraphs
write links.md <<'MD'
An unmatched `backtick.

[bad](slug:missing)

Another `backtick.
MD
check 1
contains '1 slug links; 1 error(s).'
contains "Unknown slug 'missing'"
done_case

printf '%s Bash regression tests passed.\n' "$passed"
