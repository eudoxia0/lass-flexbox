# lass-flexbox

[![Build Status](https://travis-ci.org/eudoxia0/lass-flexbox.svg?branch=master)](https://travis-ci.org/eudoxia0/lass-flexbox)

Flexbox for [Lass][lass]. Ported from [this library][lib] by Brian Franco.

# Overview

[Lass][lass] is a library for generating CSS from a Lisp-based DSL.

[Flexbox][flex] is a layout mode that [greatly simplifies][solved] the task of
arranging things in CSS.

The problem is it's not portable without vendor prefixes
[because it's experimental][so].

"But that's fine", you say, foolishly. "I'll just add a couple of webkits and
mozzes". Oh, gentle reader, what I would give to relive those days of innonence
and wild abandon.

This is the portable version of `display:flex` and `flex-direction: row`:

```css
display: -webkit-box;
display: -webkit-flex;
display: -moz-flex;
display: -ms-flexbox;
display: flex;
-webkit-box-direction: normal;
-webkit-box-orient: horizontal;
-webkit-flex-direction: row;
-moz-flex-direction: row;
-ms-flex-direction: row;
flex-direction: row;
```

See what I mean?

# Usage

Just load the library.

# Example

This:

```lisp
(.fun
  :flexbox
  :flex-direction "row"
  :justify-content "space-around"
  :align-items "center")
```

Gets compiled to this:

```css
.fun {
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-box-direction: normal;
    -webkit-box-orient: horizontal;
    -webkit-flex-direction: row;
    -moz-flex-direction: row;
    -ms-flex-direction: row;
    flex-direction: row;
    -ms-flex-pack: distribute;
    -webkit-justify-content: space-around;
    -moz-justify-content: space-around;
    justify-content: space-around;
    -webkit-box-align: center;
    -ms-flex-align: center;
    -webkit-align-items: center;
    -moz-align-items: center;
    align-items: center;
}
```

# License

Copyright (c) 2016 Fernando Borretti

Licensed under the MIT License.

[lass]: https://github.com/Shinmera/LASS
[lib]: https://github.com/mastastealth/sass-flex-mixin
[flex]: https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Flexible_Box_Layout/Using_CSS_flexible_boxes
[solved]: https://philipwalton.github.io/solved-by-flexbox/
[so]: http://stackoverflow.com/questions/8131846/why-do-browsers-create-vendor-prefixes-for-css-properties/8131879#8131879
