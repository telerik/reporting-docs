BEGIN {
    FS = "\t"
    bom = sprintf("%c%c%c", 239, 187, 191)
    for (character = 1; character < 32; character++)
        controls[sprintf("%c", character)] = sprintf("\\u%04x", character)
}

function trim(value) {
    sub(/^[ \t\r\n]+/, "", value)
    sub(/[ \t\r\n]+$/, "", value)
    return value
}

function pack(value,    result, i, c) {
    result = ""
    for (i = 1; i <= length(value); i++) {
        c = substr(value, i, 1)
        if (c == "\\") result = result "\\\\"
        else if (c == "\t") result = result "\\t"
        else if (c == "\r") result = result "\\r"
        else if (c == "\n") result = result "\\n"
        else result = result c
    }
    return result
}

function unpack(value,    result, i, c) {
    result = ""
    for (i = 1; i <= length(value); i++) {
        c = substr(value, i, 1)
        if (c == "\\" && i < length(value)) {
            c = substr(value, ++i, 1)
            if (c == "t") c = "\t"
            else if (c == "r") c = "\r"
            else if (c == "n") c = "\n"
        }
        result = result c
    }
    return result
}

function record(kind, a, b, c) {
    print kind "\t" pack(a) "\t" pack(b) "\t" pack(c)
}

function problem(line, message) {
    record("E", relative, line, message)
}

function hexadecimal(value,    result, i, digit) {
    result = 0
    value = tolower(value)
    for (i = 1; i <= length(value); i++) {
        digit = index("0123456789abcdef", substr(value, i, 1)) - 1
        if (digit < 0) return -1
        result = result * 16 + digit
    }
    return result
}

function utf8(code) {
    if (code < 128) return sprintf("%c", code)
    if (code < 2048)
        return sprintf("%c%c", 192 + int(code / 64), 128 + code % 64)
    if (code < 65536)
        return sprintf("%c%c%c", 224 + int(code / 4096), 128 + int(code / 64) % 64, 128 + code % 64)
    return sprintf("%c%c%c%c", 240 + int(code / 262144), 128 + int(code / 4096) % 64,
                   128 + int(code / 64) % 64, 128 + code % 64)
}

function scalar(value,    quote, result, i, c, escaped, digits, code, rest) {
    scalar_kind = "string"
    scalar_error = ""
    value = trim(value)
    quote = substr(value, 1, 1)
    if (quote == "'" || quote == "\"") {
        result = ""
        for (i = 2; i <= length(value); i++) {
            c = substr(value, i, 1)
            if (c == quote) {
                if (quote == "'" && substr(value, i + 1, 1) == "'") {
                    result = result "'"
                    i++
                    continue
                }
                rest = trim(substr(value, i + 1))
                if (rest != "" && substr(rest, 1, 1) != "#")
                    scalar_error = "Unexpected text after quoted metadata"
                return result
            }
            if (quote == "\"" && c == "\\") {
                escaped = substr(value, ++i, 1)
                if (escaped == "n") c = "\n"
                else if (escaped == "r") c = "\r"
                else if (escaped == "t") c = "\t"
                else if (escaped == "\"" || escaped == "\\" || escaped == "/") c = escaped
                else if (escaped == "x" || escaped == "u" || escaped == "U") {
                    digits = escaped == "x" ? 2 : (escaped == "u" ? 4 : 8)
                    rest = substr(value, i + 1, digits)
                    code = hexadecimal(rest)
                    if (length(rest) != digits || code < 0 || code > 1114111 ||
                        (code >= 55296 && code <= 57343)) {
                        scalar_error = "Invalid Unicode escape in metadata"
                        return ""
                    }
                    c = utf8(code)
                    i += digits
                } else {
                    scalar_error = "Unsupported escape in metadata"
                    return ""
                }
            }
            result = result c
        }
        scalar_error = "Unterminated quoted metadata"
        return ""
    }
    sub(/[ \t]+#.*/, "", value)
    if (value == "" || substr(value, 1, 1) == "#" || value ~ /^(null|Null|NULL|~)$/)
        scalar_kind = "null"
    else if (value ~ /^(false|False|FALSE|no|No|NO|off|Off|OFF)$/)
        scalar_kind = "false"
    else if (value ~ /^(true|True|TRUE|yes|Yes|YES|on|On|ON)$/ ||
             value ~ /^[+-]?([0-9][0-9_.]*([eE][+-]?[0-9]+)?|0[xX][0-9a-fA-F_]+)$/ ||
             value ~ /^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]($|[Tt ])/)
        scalar_kind = "other"
    else if (value ~ /^[\[{|>]/) {
        scalar_error = "Slug and publication metadata must use single-line scalar values"
    }
    return trim(value)
}

function blank(value) {
    gsub(/[^\n]/, " ", value)
    return value
}

function mask_special(text,    result, i, run, j, size, ending, start, offset,
                     line, line_end, raw, span, key) {
    result = ""
    block_fence = ""
    block_fence_size = 0
    block_html = 0
    block_persistent_html = ""
    block_list_depth = 0
    block_previous_blank = 1
    block_indented = 0
    for (key in block_list_markers) delete block_list_markers[key]
    for (key in block_list_columns) delete block_list_columns[key]
    line = 1
    i = 1
    while (i <= length(text)) {
        if (i == 1 || substr(text, i - 1, 1) == "\n") {
            offset = index(substr(text, i), "\n")
            line_end = offset ? i + offset - 2 : length(text)
            raw = substr(text, i, line_end - i + 1)
            if (block_line(raw, line)) {
                result = result blank(raw)
                i = line_end + 1
                if (offset) {
                    result = result "\n"
                    i++
                    line++
                }
                continue
            }
        }
        if (substr(text, i, 2) == "\\\\") {
            result = result substr(text, i, 2)
            i += 2
        } else if (substr(text, i, 2) == "\\`") {
            result = result "  "
            i += 2
        } else if (substr(text, i, 4) == "<!--") {
            offset = index(substr(text, i + 4), "-->")
            ending = offset ? i + 4 + offset + 1 : length(text)
            span = substr(text, i, ending - i + 1)
            result = result blank(span)
            line += gsub(/\n/, "\n", span)
            i = ending + 1
        } else if (substr(text, i, 1) == "`") {
            run = 1
            while (substr(text, i + run, 1) == "`") run++
            j = i + run
            ending = 0
            while (j <= length(text)) {
                offset = index(substr(text, j), "`")
                if (!offset) break
                start = j + offset - 1
                size = 1
                while (substr(text, start + size, 1) == "`") size++
                if (substr(text, i + run, start - i - run) ~ /\n[ \t>]*\n/) break
                if (size == run) {
                    ending = start + size - 1
                    break
                }
                j = start + size
            }
            if (ending) {
                # Inline code must not turn a paragraph or list label into indentation.
                span = substr(text, i, ending - i + 1)
                result = result "\001" substr(blank(span), 2)
                line += gsub(/\n/, "\n", span)
                i = ending + 1
            } else {
                result = result substr(text, i, run)
                i += run
            }
        } else {
            if (substr(text, i, 1) == "\n") line++
            result = result substr(text, i++, 1)
        }
    }
    return result
}

function entities(value,    result, i, offset, entity, decoded, code) {
    result = ""
    for (i = 1; i <= length(value); i++) {
        if (substr(value, i, 1) != "&") {
            result = result substr(value, i, 1)
            continue
        }
        offset = index(substr(value, i), ";")
        if (!offset || offset > 34) {
            result = result "&"
            continue
        }
        entity = substr(value, i + 1, offset - 2)
        decoded = ""
        if (entity == "amp") decoded = "&"
        else if (entity == "lt") decoded = "<"
        else if (entity == "gt") decoded = ">"
        else if (entity == "quot") decoded = "\""
        else if (entity == "apos") decoded = "'"
        else if (entity == "colon") decoded = ":"
        else if (entity == "sol") decoded = "/"
        else if (entity ~ /^#[0-9]+$/) decoded = utf8(substr(entity, 2) + 0)
        else if (entity ~ /^#[xX][0-9a-fA-F]+$/) decoded = utf8(hexadecimal(substr(entity, 3)))
        if (decoded != "") {
            result = result decoded
            i += offset - 1
        } else result = result "&"
    }
    return result
}

function markdown_unescape(value,    result, i, c, following) {
    result = ""
    for (i = 1; i <= length(value); i++) {
        c = substr(value, i, 1)
        following = substr(value, i + 1, 1)
        if (c == "\\" && following ~ /^[[:punct:]]$/) {
            c = following
            i++
        }
        result = result c
    }
    return entities(result)
}

function reference_label(value) {
    value = tolower(markdown_unescape(trim(value)))
    gsub(/[ \t\r\n]+/, " ", value)
    return value
}

function destination(text, start,    c, depth, i) {
    destination_value = ""
    destination_end = 0
    while (substr(text, start, 1) ~ /[ \t\r\n]/ && start <= length(text)) start++
    if (substr(text, start, 1) == "<") {
        for (i = start + 1; i <= length(text); i++) {
            c = substr(text, i, 1)
            if (c == "\\") {
                destination_value = destination_value c substr(text, ++i, 1)
            } else if (c == ">") {
                destination_end = i + 1
                return 1
            } else if (c == "\n" || c == "<") return 0
            else destination_value = destination_value c
        }
        return 0
    }
    depth = 0
    for (i = start; i <= length(text); i++) {
        c = substr(text, i, 1)
        if (c == "\\") {
            destination_value = destination_value c substr(text, ++i, 1)
            continue
        }
        if (c ~ /[ \t\r\n]/ || (c == ")" && depth == 0)) break
        if (c == "(") depth++
        if (c == ")") depth--
        destination_value = destination_value c
    }
    if (depth != 0) return 0
    destination_end = i
    return 1
}

function finish_link(text, start,    c, quote, depth) {
    while (substr(text, start, 1) ~ /[ \t\r\n]/ && start <= length(text)) start++
    c = substr(text, start, 1)
    if (c == "\"" || c == "'" || c == "(") {
        quote = c == "(" ? ")" : c
        start++
        depth = 1
        while (start <= length(text)) {
            c = substr(text, start, 1)
            if (c == "\\") start++
            else if (c == quote) {
                depth--
                if (!depth) break
            } else if (quote == ")" && c == "(") depth++
            start++
        }
        if (depth) return 0
        start++
        while (substr(text, start, 1) ~ /[ \t\r\n]/ && start <= length(text)) start++
    }
    return substr(text, start, 1) == ")" ? start : 0
}

function closing_bracket(text, start,    depth, i, c) {
    depth = 1
    for (i = start + 1; i <= length(text); i++) {
        c = substr(text, i, 1)
        if (c == "\\") i++
        else if (c == "[") depth++
        else if (c == "]") {
            depth--
            if (!depth) return i
        }
    }
    return 0
}

function add_link(href, line,    slug, result, i, hex) {
    href = entities(href)
    if (tolower(substr(href, 1, 5)) != "slug:") return
    slug = substr(href, 6)
    sub(/[?#].*$/, "", slug)
    result = ""
    for (i = 1; i <= length(slug); i++) {
        hex = substr(slug, i + 1, 2)
        if (substr(slug, i, 1) == "%" && length(hex) == 2 && hex ~ /^[0-9a-fA-F]+$/) {
            result = result sprintf("%c", hexadecimal(hex))
            i += 2
        } else result = result substr(slug, i, 1)
    }
    record("R", result, relative, line)
}

function html_link(tag, line,    rest, key, c, quote, value, i, j) {
    if (tolower(tag) !~ /^<a([ \t\r\n>]|$)/) return
    rest = substr(tag, 3)
    while (match(rest, /^[ \t\r\n]*[^ \t\r\n=\/>]+/)) {
        key = tolower(trim(substr(rest, RSTART, RLENGTH)))
        rest = substr(rest, RLENGTH + 1)
        sub(/^[ \t\r\n]*/, "", rest)
        if (substr(rest, 1, 1) != "=") continue
        rest = substr(rest, 2)
        sub(/^[ \t\r\n]*/, "", rest)
        quote = substr(rest, 1, 1)
        if (quote == "\"" || quote == "'") {
            i = index(substr(rest, 2), quote)
            if (!i) return
            value = substr(rest, 2, i - 1)
            rest = substr(rest, i + 2)
        } else {
            match(rest, /^[^ \t\r\n>]+/)
            value = substr(rest, RSTART, RLENGTH)
            rest = substr(rest, RLENGTH + 1)
        }
        if (key == "href") {
            add_link(value, line)
            return
        }
    }
}

function block_line(raw, line,    value, indent, marker, run) {
    value = raw
    gsub(/\t/, "    ", value)
    if (block_fence != "") {
        while (value ~ /^[ ]*>/) sub(/^[ ]*>[ ]?/, "", value)
        marker = trim(value)
        run = 0
        while (substr(marker, run + 1, 1) == block_fence) run++
        if (run >= block_fence_size && trim(substr(marker, run + 1)) == "") block_fence = ""
        block_previous_blank = 1
        return 1
    }
    while (value ~ /^[ ]{0,3}>/) sub(/^[ ]{0,3}>[ ]?/, "", value)
    match(value, /^[ ]*/)
    indent = RLENGTH
    if (match(value, /^[ ]*([-+*]|[0-9]+[.)])[ \t]+/)) {
        while (block_list_depth && indent < block_list_markers[block_list_depth]) block_list_depth--
        if (!block_list_depth || indent != block_list_markers[block_list_depth]) block_list_depth++
        block_list_markers[block_list_depth] = indent
        block_list_columns[block_list_depth] = RLENGTH
        value = substr(value, RLENGTH + 1)
    } else if (trim(value) != "") {
        while (block_list_depth && indent < block_list_columns[block_list_depth]) block_list_depth--
        if (block_list_depth) value = substr(value, block_list_columns[block_list_depth] + 1)
    }
    while (value ~ /^[ ]{0,3}>/) sub(/^[ ]{0,3}>[ ]?/, "", value)
    if (block_html) {
        html_lines[line] = 1
        if (block_persistent_html != "") {
            if (tolower(value) ~ "</" block_persistent_html "[ \t]*>") {
                block_html = 0
                block_persistent_html = ""
            }
        } else if (trim(value) == "") block_html = 0
        block_previous_blank = trim(value) == ""
        return 0
    }
    if (value ~ /^    / && (block_previous_blank || block_indented)) {
        block_indented = 1
        return 1
    } else if (trim(value) != "") block_indented = 0
    if (value ~ /^[ ]{0,3}(```+|~~~+)/) {
        marker = trim(value)
        block_fence = substr(marker, 1, 1)
        block_fence_size = 0
        while (substr(marker, block_fence_size + 1, 1) == block_fence) block_fence_size++
        return 1
    }
    if (tolower(value) ~ /^[ ]{0,3}<(address|article|aside|blockquote|div|dl|fieldset|figure|footer|form|h[1-6]|header|hr|iframe|main|nav|ol|p|pre|script|section|style|table|textarea|ul)([ \t>\/]|$)/) {
        block_html = 1
        html_lines[line] = 1
        if (tolower(value) ~ /^[ ]*<(pre|script|style|textarea)([ \t>]|$)/) {
            block_persistent_html = tolower(value)
            sub(/^[ ]*</, "", block_persistent_html)
            sub(/[ \t>].*$/, "", block_persistent_html)
            if (tolower(value) ~ "</" block_persistent_html "[ \t]*>") {
                block_html = 0
                block_persistent_html = ""
            }
        }
    }
    block_previous_blank = trim(value) == ""
    return 0
}

function scan_links(text, offset,    rows, n, i, value, start, ending, label, href,
                    position, line, current_line, c, j, quote, tag, image, nextchar) {
    text = mask_special(text)
    n = split(text, rows, "\n")
    for (i = 1; i <= n; i++) {
        value = rows[i]
        if (html_lines[i]) continue
        if (match(value, /^[ ]{0,3}\[/)) {
            start = RLENGTH
            ending = closing_bracket(value, start)
            if (ending && substr(value, ending + 1, 1) == ":") {
                label = reference_label(substr(value, start + 1, ending - start - 1))
                if (destination(value, ending + 2) && destination_value != "") {
                    if (!(label in reference_definitions))
                        reference_definitions[label] = markdown_unescape(destination_value)
                    rows[i] = blank(value)
                }
            }
        }
    }
    text = ""
    for (i = 1; i <= n; i++) text = text (i > 1 ? "\n" : "") rows[i]
    i = 1
    current_line = 1
    while (i <= length(text)) {
        c = substr(text, i, 1)
        if (c == "\n") {
            current_line++
            i++
            continue
        }
        line = offset + current_line
        if (c == "\\") {
            i += 2
            continue
        }
        if (c == "<") {
            quote = ""
            for (j = i + 1; j <= length(text); j++) {
                nextchar = substr(text, j, 1)
                if (quote != "") {
                    if (nextchar == quote) quote = ""
                } else if (nextchar == "\"" || nextchar == "'") quote = nextchar
                else if (nextchar == ">") break
            }
            if (j <= length(text)) {
                tag = substr(text, i, j - i + 1)
                if (tag ~ /^<[sS][lL][uU][gG]:[^ \t\r\n<>]*>$/)
                    add_link(substr(tag, 2, length(tag) - 2), line)
                else html_link(tag, line)
                value = substr(text, i, j - i + 1)
                current_line += gsub(/\n/, "\n", value)
                i = j + 1
                continue
            }
        }
        if (c != "[" || html_lines[current_line]) {
            i++
            continue
        }
        ending = closing_bracket(text, i)
        if (!ending) {
            i++
            continue
        }
        image = i > 1 && substr(text, i - 1, 1) == "!"
        label = reference_label(substr(text, i + 1, ending - i - 1))
        nextchar = substr(text, ending + 1, 1)
        j = ending
        href = ""
        if (nextchar == "(" && destination(text, ending + 2)) {
            href = markdown_unescape(destination_value)
            position = finish_link(text, destination_end)
            if (position) j = position
            else href = ""
        } else if (nextchar == "[") {
            position = closing_bracket(text, ending + 1)
            if (position) {
                value = substr(text, ending + 2, position - ending - 2)
                if (value != "") label = reference_label(value)
                if (label in reference_definitions) href = reference_definitions[label]
                j = position
            }
        } else if (label in reference_definitions) href = reference_definitions[label]
        if (!image && href != "") add_link(href, line)
        value = substr(text, i, j - i + 1)
        current_line += gsub(/\n/, "\n", value)
        i = j + 1
    }
}

function flush_article(    i, ending, text, key, raw, value, slug, slug_kind, has_slug,
                           published, publish, has_published, seen_mapping, body_start) {
    if (current_file == "") return
    relative = substr(current_file, length(root) + 2)
    body_start = 1
    if (trim(file_lines[1]) == "---") {
        ending = 0
        for (i = 2; i <= file_length; i++) {
            if (trim(file_lines[i]) == "---" || trim(file_lines[i]) == "...") {
                ending = i
                break
            }
        }
        if (!ending) {
            problem(1, "Unterminated YAML front matter")
            return
        }
        body_start = ending + 1
        for (i = 2; i < ending; i++) {
            raw = file_lines[i]
            if (raw ~ /^-([ \t]|$)/ && !seen_mapping) {
                problem(i, "YAML front matter must be a mapping")
                return
            }
            if (raw ~ /^[^ \t#][^:]*:/) seen_mapping = 1
            if (!match(raw, /^(slug|published|publish|'slug'|'published'|'publish'|"slug"|"published"|"publish")[ \t]*:/))
                continue
            key = substr(raw, 1, RLENGTH)
            value = substr(raw, RLENGTH + 1)
            sub(/[ \t]*:$/, "", key)
            gsub(/['"]/, "", key)
            value = scalar(value)
            if (scalar_error != "") {
                problem(i, scalar_error)
                return
            }
            if (key == "slug") {
                has_slug = 1
                slug = value
                slug_kind = scalar_kind
                slug_line = i
            } else if (key == "published") {
                has_published = 1
                published = scalar_kind
            } else publish = scalar_kind
        }
        if ((has_published ? published : publish) == "false") return
        if (has_slug) {
            if (slug_kind != "string" || trim(slug) == "" || slug ~ /[[:cntrl:]]/)
                problem(slug_line, "The slug must be a non-empty single-line string")
            else record("D", slug, relative, slug_line)
        }
    }
    for (key in reference_definitions) delete reference_definitions[key]
    for (key in html_lines) delete html_lines[key]
    text = ""
    for (i = body_start; i <= file_length; i++)
        text = text (i > body_start ? "\n" : "") file_lines[i]
    scan_links(text, body_start - 1)
}

function json(value,    result, i, c) {
    result = "\""
    for (i = 1; i <= length(value); i++) {
        c = substr(value, i, 1)
        if (c == "\"" || c == "\\") result = result "\\" c
        else if (c in controls) result = result controls[c]
        else result = result c
    }
    return result "\""
}

function annotation(value) {
    gsub(/%/, "%25", value)
    gsub(/\r/, "%0D", value)
    gsub(/\n/, "%0A", value)
    return value
}

function report(file, line, message,    name) {
    error_count++
    if (actions == "true") {
        name = annotation(file)
        gsub(/:/, "%3A", name)
        gsub(/,/, "%2C", name)
        print "::error file=" name ",line=" line "::" annotation(message)
    } else print file ":" line ": " message
}

phase == "scan" && FILENAME == root "/" manifest {
    value = $0
    sub(/\r$/, "", value)
    if (FNR == 1 && substr(value, 1, 3) == bom) value = substr(value, 4)
    value = trim(value)
    if (value == "" || substr(value, 1, 1) == "#") next
    if (value ~ /[ \t\r\n]/) record("E", manifest, FNR, "Expected one generated slug per line")
    else record("D", value, manifest, FNR)
    next
}

phase == "scan" {
    if (FILENAME != current_file) {
        flush_article()
        for (key in file_lines) delete file_lines[key]
        current_file = FILENAME
        file_length = 0
    }
    value = $0
    sub(/\r$/, "", value)
    if (FNR == 1 && substr(value, 1, 3) == bom) value = substr(value, 4)
    file_lines[++file_length] = value
    next
}

phase == "validate" {
    if ($1 == "D") {
        slug = unpack($2)
        if (!(slug in definition_count)) ordered_slugs[++slug_count] = slug
        item = ++definition_count[slug]
        definition_file[slug, item] = unpack($3)
        definition_line[slug, item] = unpack($4)
    } else if ($1 == "R") {
        reference_slug[++link_count] = unpack($2)
        reference_file[link_count] = unpack($3)
        reference_line[link_count] = unpack($4)
    } else if ($1 == "E") report(unpack($2), unpack($3), unpack($4))
}

END {
    if (phase == "scan") {
        flush_article()
    } else if (phase == "validate") {
        print "{" > output
        for (i = 1; i <= slug_count; i++) {
            slug = ordered_slugs[i]
            print "  " json(slug) ": [" > output
            articles = ""
            for (j = 1; j <= definition_count[slug]; j++) {
                file = definition_file[slug, j]
                line = definition_line[slug, j]
                articles = articles (j > 1 ? ", " : "") file ":" line
                print "    {" > output
                print "      \"file\": " json(file) "," > output
                print "      \"line\": " (line + 0) > output
                print "    }" (j < definition_count[slug] ? "," : "") > output
            }
            print "  ]" (i < slug_count ? "," : "") > output
            if (definition_count[slug] > 1) {
                for (j = 1; j <= definition_count[slug]; j++)
                    report(definition_file[slug, j], definition_line[slug, j],
                           "Duplicate slug '" slug "': " articles)
            }
        }
        print "}" > output
        if (close(output) != 0) {
            print "Failed to write inventory: " output > "/dev/stderr"
            exit 1
        }
        for (i = 1; i <= link_count; i++)
            if (!(reference_slug[i] in definition_count))
                report(reference_file[i], reference_line[i], "Unknown slug '" reference_slug[i] "'")
        if (!article_count) {
            print "No Markdown files found; refusing to pass an empty scan."
            error_count++
        }
        print "Checked " article_count " Markdown files, " (slug_count + 0) " unique slugs, and " \
              (link_count + 0) " slug links; " (error_count + 0) " error(s). Inventory: " output
        exit (error_count ? 1 : 0)
    }
}
