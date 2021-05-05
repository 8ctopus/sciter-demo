# sciter demo

This is a [sciter.js](https://sciter.com/) demo app built from multiple sciter samples.

It showcases some of the sciter features I find interesting, namely:
- components: buttons, checkboxes, ...
- javascript
- themes

## sciter examples used:
- sdk.js\samples\calc
- sdk.js\samples.sciter\themes

## get started

- git clone the repository
- run `install.bat` to download the latest sciter binaries and library
- start `scapp.exe`
- to refresh the app after changes to the html/css click `F5`

# sciter tips/caveats

## debug app
- start `inspector.exe`
- inside the `scapp.exe` window click `CTRL + SHIFT + I` to connect to the inspector
- inside the `scapp.exe` window click `CTRL + SHIFT + left click` to inspect element in the inspector

## tutorials

    https://sciter.com/tutorials/

## sciter docs

    https://github.com/c-smile/sciter-js-sdk/tree/main/docs/md

## html

sciter supports all standard elements defined in the HTML5 specification with some additions:

    https://sciter.com/developers/for-web-programmers/input-elements-map/


### include

Unlike vanilla html, it's possible to include html inside another html document:

```html
<include src="window.html" media="sciter" />
```

or

```html
<include src="fragment.htm">
  fragment.htm is not available!
</include>
```

### [short notation](https://sciter.com/sciter-html-parsing-flavour/)

Consider this input:

```html
<input type="text" name="test" id="info" class="blue">info</input>
```

in sciter there's a shorter notation:

```html
<input|text(name) #info .blue>info</input>
```

### [unique elements](https://sciter.com/developers/for-web-programmers/input-elements-map/)

#### input

- `<input type="currency">`
- `<input type="decimal">`
- `<input type="integer">`
- `<input type="number">`
- `<input type="masked">` masked text input eg: phone, IP address, serial numbers
- `<input type="url">`
- `<input type="slider">` horizontal and vertical slider input
- `<input type="scrollbar">` horizontal and vertical standalone scrollbars
- `<input type="date">` date input
- `<input type="time">` time input
- `<input type="calendar">` month/year/decade/century input
- `<button type="checkbox">...</button>` checkbox combined with its label
- `<button type="radio">...</button>` radio button combined with its label
- `<button type="menu">...<menu></button>` button with popup menu
- `<button type="selector">...</button>` button with popup list of options defined in a separate popup element
- `<button type="menu">...<menu></button>` button with popup menu

#### select

Select elements support `multiple` and `multiple=checkmarks` attributes to allow multi-select list functionality

- `<select type="list">` standard select element
- `<select type="dropdown">` standard select element with dropdown list
- `<select type="tree">` select element with `<option>`s organized in hierarchical tree

#### popup menus
- `<popup>` popup element (preferred to be placed in `<head>`). You can show popup with Element.popupAt.
- `<menu .context>` context-menu styled element

#### text editors
- `<textarea>` standard plain text editor
- `<plaintext>` plain source code editor with line numbers and optional syntax highlighter, each line is a `<text>` element
- `<htmlarea>` ready to use WYSIWYG HTML editor

#### frames

- `<frameset>` child elements to be resizable window blocks

### unique attributes

- `selectable` assign behavior: selectable
- `spellcheck` true/false enable or disable spellcheck
- `novalue` synonym of `placeholder`

## [application window](https://sciter.com/html-window/) attributes

- `window-frame` values `default|standard|solid|solid-with-shadow|extended|transparent`

    `none` or attribute omitted as whole – standard OS desktop window frame (with caption and close/maximize) buttons.
    `solid` – frameless window with non-transparent background, just a rectangular box. Window chrome needs to be defined in markup (see below).
    `solid-with-shadow` same as above but with shadow if OS supports it.
    `extended` – window that allows to replace custom elements in window’s caption bar.
    `transparent` – layered window, it’s shape is determined by background image or border-radius. CSS shall define `html { background-color:transparent }` for it.

- `window-title` title
- `window-resizable`
- `window-width` initial width of the window
- `window-height` initial height of the window
- `window-icon`  image for window decoration and in taskbar
- `lang` define dictionary for spellcheck ISO 639-1
- `window-blurbehind` create windows with blur-behind effect 

    `auto` – default OS blur-behind effect;
    `ultra-dark`, `dark`, `light` and `ultra-light`

``` html
<html
    window-frame="default"
    window-title="sciter demo app"
    window-resizable="true"
    window-width="750dip"
    window-height="1024dip"
    window-icon="images/seastar.svg"
    window-blurbehind="light"
    theme="light"
>
```

## headless window

To create a headless window use `window-frame="extended"`, then define the header components.

- `role="window-caption"` move window by clicking the element
- `role=window-close` – close button
- `role=window-icon` – window icon button
- `role=window-minimize` – minimize button
- `role=window-maximize` – maximize/restore button
- `role=window-body` or `<body>` – area (four bands) between `<html>` and that body element is used for window resizing.

``` html
<head>
...
</head>
<!-- header before the body tag -->
<header>
    <picture src="images/seastar.svg" role="window-icon" />
    <window-caption role="window-caption">sciter demo app</window-caption>
    <window-buttons>
        <window-button role="window-minimize"></window-button>
        <window-button role="window-maximize"></window-button>
        <window-button role="window-close"></window-button>
    </window-buttons>
</header>
<body>
```

### events

This doesn't work.

```html
<button #info onclick="console.log('test')">info</button>
```

Use this instead:

```js
// option 1
document.$("#info").onclick = log;

// option 2
document.on("click", "button#info", log);

function log()
{
    console.log('test');
}

<button #info>info</button>
```


## css

sciter supports css level 2.1 in full and has some css 3 features

[https://sciter.com/developers/for-web-programmers/](https://sciter.com/developers/for-web-programmers/)

### unique features

- gradient backgrounds, see `background-color` attribute definition
- extended image fill, see `background-position` and `background-repeat` attribute definitions
- flex length units and `flow`
- foreground images
- `hit-margin`
- `@include "mime-type" url(...) [media types list]` inclusion of scripts from css
- `size` shortcut property for `width` and `height`. If only one length value is provided then both width and height get the value. If there are two values then first one will go to width and second to height.
- supports `//` comments
- [`@mixin`](https://sciter.com/mixin-feature-in-sciters-css/)
- `@set` A style set is a named block of style rules (see below)
- `morph` color transformation function (see below)
- css 3 `currentcolor` keyword refers to the value of the color property
- `foreground` property

### all supported properties

[https://sciter.com/docs/content/css/cssmap.html](https://sciter.com/docs/content/css/cssmap.html)

### display flex

sciter does not support `display: flex`, you need to use the custom css property `flow` instead.

[https://terrainformatica.com/w3/flex-layout/flex-vs-flexbox.htm](https://terrainformatica.com/w3/flex-layout/flex-vs-flexbox.htm)

### use `dip` not pixels

Density independent pixels is an abstract unit that is based on the physical density of the screen. These units are relative to a 160 dpi screen, so one dip is one pixel on a 160 dpi screen. The ratio of dip-to-pixel will change with the screen density, but not necessarily in direct proportion.

See [https://stackoverflow.com/questions/2025282/what-is-the-difference-between-px-dip-dp-and-sp](https://stackoverflow.com/questions/2025282/what-is-the-difference-between-px-dip-dp-and-sp)

### constants and variables

Unlike vanilla css, css constants and variables are supported.

[https://sciter.com/developers/for-web-programmers/css-constants/](https://sciter.com/developers/for-web-programmers/css-constants/)
[https://sciter.com/css-variables-support/](https://sciter.com/css-variables-support/)

### morph function

[`morph`](https://sciter.com/css-addons/) is color transformation function.

`color: morph(basecolor, transformation1:value1, transformation2:value2, ...)`

basecolor is either a constant or a variable or `currentColor`

example: `background-color: morph(currentColor, lighten:40%, opacity:50%)`

## javascript

sciter uses the [QuickJS++](https://github.com/c-smile/quickjspp) javascript engine. 

It adds [JSX](https://facebook.github.io/jsx/), [Mithril](https://mithril.js.org/) and [React](https://reactjs.org/) support:

    https://github.com/c-smile/quickjspp/blob/master/doc/jsx.md

In addition it contains storage in the form of a NoSQL MongoDB.

## javascript libraries support

General considerations about JS libraries and frameworks:

If library is pure JS one then it should work as it is in sciter. Example: RemarkableJS that does MD-to-HTML conversion works as it is.

If library relies on basic DOM features it may work as it is. Example: MithrilJS that works as it is in sciter.

If library relies on extended/obscure features then it will need either porting or an external porting layer. [*](https://sciter.com/forums/topic/supported-javascript-graph-library/#post-71280)

## animations

[Lottie](https://lottiefiles.com/) animations are supported.

## style sets

[https://terrainformatica.com/2007/04/20/css-extensions-in-h-smile-engine-part-i-style-sets/](https://terrainformatica.com/2007/04/20/css-extensions-in-h-smile-engine-part-i-style-sets/)
[https://sciter.com/style-sets-in-h-smile-core/](https://sciter.com/style-sets-in-h-smile-core/)

Rules within the styleset can only be overriden with `!important`.

## fontawesome

Download in respective directories `css` and `fonts`:

    https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.css
    https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/webfonts/fa-brands-400.ttf
    https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/webfonts/fa-regular-400.ttf
    https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/webfonts/fa-solid-900.ttf

In `all.css`

- remove unrecognized `@-webkit-keyframes` properties
- replace all `:before` by `::before`
- remove all `src` from `@font-face` except the ttf ones
- remove `format("truetype")` from `@font-face`
- add to the end of file

```css
// reset ux-master.css default vertical flow
button {
  flow: horizontal;
}

// reset master-base.css properties on first and last child
button > :first-child {
  margin-top: 0;
}

button > :last-child {
  margin-bottom: 0;
}

// fix icons vertical alignment in button
button > i {
  vertical-align: middle;
}

// improve icon position in button
button > i:first-child {
  margin-right: 0.5em;
  padding-left: -0.7em;
}

button > i:last-child {
  margin-left: 0.5em;
}
```
