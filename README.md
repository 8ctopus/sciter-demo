# sciter demo

This is a [sciter](https://sciter.com/) js demo app built from multiple sciter samples.

It showcases some of the sciter features I find interesting, namely:
- components: buttons, checkboxes, ...
- javacript
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

## javascript

sciter uses ECMAScript 2015 or ES6.

    https://www.javascripttutorial.net/es6/

## configure application window

``` html
<html
    window-frame="extended"
    window-resizable="true"
    window-width="750dip"
    window-height="1024dip"
    window-icon="images/seastar.svg"
    window-blurbehind="light"
    theme="light">
<head>
...
</head>
<!-- header before the body tag -->
<header>
    <picture src="images/seastar.svg" role="window-icon" />
    <window-caption role="window-caption">Sciter demo app</window-caption>
    <window-buttons>
        <window-button role="window-minimize"></window-button>
        <window-button role="window-maximize"></window-button>
        <window-button role="window-close"></window-button>
    </window-buttons>
</header>
<body>
```

## html

### ids and classes

Consider this button:

``` html
<button id="info" class="blue">info</button>
```

There's is a shorter notation.

``` html
<button #info .blue>info</button>
```

### include

Unlike vanila html, it's possible to include html inside another html document:

``` html
<include src="window.html" media="sciter" />
```

## events

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

### use dip not pixels

Density-independent Pixels - an abstract unit that is based on the physical density of the screen. These units are relative to a 160 dpi screen, so one dip is one pixel on a 160 dpi screen. The ratio of dip-to-pixel will change with the screen density, but not necessarily in direct proportion.

See https://stackoverflow.com/questions/2025282/what-is-the-difference-between-px-dip-dp-and-sp

### display flex

Sciter does not support `display: flex`, you need to use the custom css property `flow` instead.

    https://terrainformatica.com/w3/flex-layout/flex-vs-flexbox.htm

### constants and variables

Unlike vanilla css, css constants and variables are supported.

    https://sciter.com/developers/for-web-programmers/css-constants/
    https://sciter.com/css-variables-support/

## animations

Animations are supported using [Lottie](https://lottiefiles.com/).

## fontawesome

Download in respective directories `css` and `fonts`:

    https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.css
    https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/webfonts/fa-brands-400.ttf
    https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/webfonts/fa-regular-400.ttf
    https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/webfonts/fa-solid-900.ttf

In `all.css`

- remove unrecognized `@-webkit-keyframes`
- replace all `:before` by `:::before`
- remove all `src` from `@font-face` except the ttf ones
- remove `format("truetype")` from ``@font-face``
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
}

button > i:last-child {
  margin-left: 0.5em;
}