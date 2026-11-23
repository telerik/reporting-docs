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

new_case reference-destination-on-continuation-line
write links.md <<'MD'
[broken][target]

[target]:
  slug:missing
MD
check 1
contains "links.md:1: Unknown slug 'missing'"
contains '1 slug links; 1 error(s).'
done_case

new_case valid-reference-destination-continuations
write scripts/generated-slugs.txt <<'TXT'
viewer/methods
TXT
write target.md <<'MD'
---
slug: target
---
MD
write links.md <<'MD'
[full][target]
[target][]
[target]
[liquid][dynamic]
[angle][angle]

[target]:
  slug:target#anchor "A title"
[dynamic]:
    {%slug viewer/methods%}?query=1
[angle]:
  <slug:target>
MD
check 0
contains '5 slug links; 0 error(s).'
done_case

new_case reference-continuations-do-not-cross-blank-lines-or-code
write links.md <<'MD'
[undefined][target]
[undefined][fenced]
[undefined][commented]

[target]:

  slug:missing

~~~md
[fenced]:
  slug:code
~~~

<!--
[commented]:
  slug:comment
-->

[broken](slug:visible)
MD
check 1
contains "links.md:19: Unknown slug 'visible'"
contains '1 slug links; 1 error(s).'
done_case

new_case nested-links-in-literal-brackets
write links.md <<'MD'
[see [nested](slug:nested-missing)]
[outer
 with [nested]({%slug liquid-missing%})]
[see [nested][target]]

[target]: slug:reference-missing
MD
check 1
contains "links.md:1: Unknown slug 'nested-missing'"
contains "links.md:3: Unknown slug 'liquid-missing'"
contains "links.md:4: Unknown slug 'reference-missing'"
contains '3 slug links; 3 error(s).'
done_case

new_case nested-links-in-invalid-outer-links-and-images
write links.md <<'MD'
[see [nested](slug:invalid-outer)](not a valid destination)
![see [nested](slug:invalid-image)]
[see [nested](slug:undefined-reference)][undefined]
MD
check 1
contains "links.md:1: Unknown slug 'invalid-outer'"
contains "links.md:2: Unknown slug 'invalid-image'"
contains "links.md:3: Unknown slug 'undefined-reference'"
contains '3 slug links; 3 error(s).'
done_case

new_case recognized-links-and-images-still-skip-their-destinations
write target.md <<'MD'
---
slug: target
---
MD
write links.md <<'MD'
[label [literal brackets]](slug:target)
[external](https://example.com/[ignored](slug:external-destination))
![see [ignored](slug:image-label)](image.png)
![see [ignored](slug:empty-image-label)]()
MD
check 0
contains '1 slug links; 0 error(s).'
done_case

new_case liquid-slug-links
write scripts/generated-slugs.txt <<'TXT'
viewer/methods
TXT
write target.md <<'MD'
---
slug: folder/hello!
---
MD
write links.md <<'MD'
[inline]({%slug folder/hello!%})
[spaced]({% slug folder/hello%21 %}?view=full#section "Title")
[reference][target]
<a href="{%slug viewer/methods%}#section">HTML</a>

[target]: {%slug viewer/methods%}
MD
check 0
contains '2 unique slugs, and 4 slug links; 0 error(s).'
done_case

new_case unknown-liquid-slugs-preserve-source-lines
write links.md <<'MD'
---
slug: source
---
Paragraph introduction.
[first]({%slug missing%}) and [second]({% slug other %}#section).
[empty]({%slug %}).
`code
span` [last]({%slug last%}).
<a
 href="{%slug html-missing%}">HTML</a>
MD
check 1
contains "links.md:5: Unknown slug 'missing'"
contains "links.md:5: Unknown slug 'other'"
contains "links.md:6: Unknown slug ''"
contains "links.md:8: Unknown slug 'last'"
contains "links.md:9: Unknown slug 'html-missing'"
contains '5 slug links; 5 error(s).'
done_case

new_case ignored-liquid-slugs
write links.md <<'MD'
`[ignored]({%slug inline-code%})`

~~~md
[ignored]({%slug fenced-code%})
~~~

    [ignored]({%slug indented-code%})

<!-- [ignored]({%slug comment%})
<a href="{%slug comment-html%}">ignored</a> -->

![image]({%slug image%})
Plain Liquid tag: {%slug prose%}.
MD
write draft.md <<'MD'
---
published: False
---
[ignored]({%slug unpublished%})
MD
check 0
contains '0 slug links; 0 error(s).'
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

new_case literal-less-than-before-blockquote
write links.md <<'MD'
Values < 10: see [Link](slug:missing).

> Note
MD
check 1
contains "links.md:1: Unknown slug 'missing'"
contains '1 slug links; 1 error(s).'
done_case

new_case malformed-angle-spans-do-not-hide-links
write links.md <<'MD'
Values < 10: see [first](slug:first) > 5.
Invalid <123 [second](slug:second) >.
Invalid <span data== [third](slug:third) >.
Invalid </span extra [fourth](slug:fourth) >.
MD
check 1
contains "links.md:1: Unknown slug 'first'"
contains "links.md:2: Unknown slug 'second'"
contains "links.md:3: Unknown slug 'third'"
contains "links.md:4: Unknown slug 'fourth'"
contains '4 slug links; 4 error(s).'
done_case

new_case literal-less-than-before-html-link
write links.md <<'MD'
Values < 10: see
<a href="slug:html-missing">HTML</a> and [Link](slug:markdown-missing).
MD
check 1
contains "links.md:2: Unknown slug 'html-missing'"
contains "links.md:2: Unknown slug 'markdown-missing'"
contains '2 slug links; 2 error(s).'
done_case

new_case valid-html-and-autolink-spans
write links.md <<'MD'
Inline <span title="> [ignored](slug:attribute-code)">text</span>.
Inline <custom-tag
 data-example='[ignored](slug:multiline-attribute-code)' />.
External <https://example.com/[ignored](slug:url-code)>.
External <https://example.com/'[ignored](slug:quoted-url-code)>.
Email <someone@example.com>.
Inline <?instruction [ignored](slug:processing-instruction)?>.
Inline <![CDATA[ > [ignored](slug:cdata) ]]>.
Inline <!DOCTYPE example [ignored](slug:declaration)>.
<slug:missing> and <slug:missing-quote'>.
MD
check 1
contains "links.md:10: Unknown slug 'missing'"
contains "links.md:10: Unknown slug 'missing-quote''"
contains '2 slug links; 2 error(s).'
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

new_case unclosed-blockquote-fence
write links.md <<'MD'
> ~~~md
> [ignored](slug:quoted-code)

[broken](slug:missing)
MD
check 1
contains "links.md:4: Unknown slug 'missing'"
contains '1 slug links; 1 error(s).'
done_case

new_case unclosed-nested-blockquote-fence
write links.md <<'MD'
> > ```md
> > [ignored](slug:nested-code)
>
> [parent](slug:parent)

[outside](slug:outside)
MD
check 1
contains "links.md:4: Unknown slug 'parent'"
contains "links.md:6: Unknown slug 'outside'"
contains '2 slug links; 2 error(s).'
done_case

new_case unclosed-list-fence
write links.md <<'MD'
- ~~~md
  [ignored](slug:list-code)

  [still ignored](slug:list-code-after-blank)
- [sibling](slug:sibling)

[outside](slug:outside)
MD
check 1
contains "links.md:5: Unknown slug 'sibling'"
contains "links.md:7: Unknown slug 'outside'"
contains '2 slug links; 2 error(s).'
done_case

new_case unclosed-ordered-list-fence
write links.md <<'MD'
1. ```md
   [ignored](slug:ordered-code)
2. [sibling](slug:sibling)
MD
check 1
contains "links.md:3: Unknown slug 'sibling'"
contains '1 slug links; 1 error(s).'
done_case

new_case unclosed-nested-list-fence
write links.md <<'MD'
- Parent item.

  - ~~~md
    [ignored](slug:nested-list-code)

  [parent](slug:parent)

[outside](slug:outside)
MD
check 1
contains "links.md:6: Unknown slug 'parent'"
contains "links.md:8: Unknown slug 'outside'"
contains '2 slug links; 2 error(s).'
done_case

new_case unclosed-list-blockquote-fence
write links.md <<'MD'
1. Parent item.

    > ~~~md
    > [ignored](slug:quoted-list-code)

    [parent](slug:parent)
MD
check 1
contains "links.md:6: Unknown slug 'parent'"
contains '1 slug links; 1 error(s).'
done_case

new_case unclosed-quote-fence-in-unordered-list
write links.md <<'MD'
- Parent item.

  > ~~~md
  > [ignored](slug:quoted-list-code)

    [parent](slug:parent)
MD
check 1
contains "links.md:6: Unknown slug 'parent'"
contains '1 slug links; 1 error(s).'
done_case

new_case unclosed-quote-fence-in-quoted-list
write links.md <<'MD'
> - Parent item.
>
>   > ~~~md
>   > [ignored](slug:quoted-list-code)
>
>     [parent](slug:parent)
MD
check 1
contains "links.md:6: Unknown slug 'parent'"
contains '1 slug links; 1 error(s).'
done_case

new_case unclosed-blockquote-list-fence
write links.md <<'MD'
> - ~~~md
>   [ignored](slug:list-in-quote-code)

    [indented code](slug:ignored-indented)

[outside](slug:outside)
MD
check 1
contains "links.md:6: Unknown slug 'outside'"
contains '1 slug links; 1 error(s).'
done_case

new_case fence-closing-markers-must-match-container
write links.md <<'MD'
~~~md
> ~~~
[ignored](slug:root-code)
~~~

- ~~~md
  > ~~~
  [ignored](slug:list-code)
  ~~~

[outside](slug:outside)
MD
check 1
contains "links.md:11: Unknown slug 'outside'"
contains '1 slug links; 1 error(s).'
done_case

new_case html-block-after-unclosed-list-fence
write links.md <<'MD'
1. List item.

    ````xml
<configuration>
    <item />
````

[outside](slug:outside)
MD
check 1
contains "links.md:8: Unknown slug 'outside'"
contains '1 slug links; 1 error(s).'
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
