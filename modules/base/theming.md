# Theming

## themer.dev

Base16 method interpreted from [themer.dev](https://themer.dev)

### Shades

* `shade0` - background color
* `shade1` - UI
* `shade2` - UI, text selection
* `shade3` - UI, code comments
* `shade4` - UI
* `shade5` - UI
* `shade6` - foreground text
* `shade7` - foreground text

you can either manually set them or set the two endpoint `shade0` and `shade7` and compute a gradiant during application

### Accents

* `accent0` - error, vcs deletion, ANSI red
* `accent1` - syntax
* `accent2` - warning, vcs modification, ANSI yellow
* `accent3` - success, vcs addition, ANSI green
* `accent4` - syntax, ANSI cyan
* `accent5` - syntax, ANSI blue
* `accent6` - syntax, caret/cursor
* `accent7` - syntax, special, ANSI magenta

## base16

Base16 method interpreted from the original source
Mostly used for styling

### Shades

* `shade0` - Default Background
* `shade1` - Lighter Background (Used for status bars, line number and folding marks)
* `shade2` - Selection Background
* `shade3` - Comments, Invisibles, Line Highlighting
* `shade4` - Dark Foreground (Used for status bars)
* `shade5` - Default Foreground, Caret, Delimiters, Operators
* `shade6` - Light Foreground (Not often used)
* `shade7` - Light Background (Not often used)

### Accents

* `accent0` - Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
* `accent1` - Integers, Boolean, Constants, XML Attributes, Markup Link Url
* `accent2` - Classes, Markup Bold, Search Text Background
* `accent3` - Strings, Inherited Class, Markup Code, Diff Inserted
* `accent4` - Support, Regular Expressions, Escape Characters, Markup Quotes
* `accent5` - Functions, Methods, Attribute IDs, Headings
* `accent6` - Keywords, Storage, Selector, Markup Italic, Diff Changed
* `accent7` - Deprecated, Opening/Closing Embedded Language Tags, e.g. `<?php ?>`
