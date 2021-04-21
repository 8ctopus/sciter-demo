# sciter demo

This is a [sciter](https://sciter.com/) js demo app built from multiple sciter samples.

It showcases some of the sciter features I find interesting, namely:
- components: buttons, checkboxes, ...
- javacript
- themes

# sciter examples used:
- sdk.js\samples\calc
- sdk.js\samples.sciter\themes

## get started

- git clone the repository
- run `install.bat` to download the sciter binaries and library
- run `scapp.exe`
- to debug the app, run `inspector.exe`

# sciter tips/caveats

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

## display flex

Sciter does not support `display: flex`, you need to use the custom css property `flow` instead.

    https://terrainformatica.com/w3/flex-layout/flex-vs-flexbox.htm

## html ids and classes

Consider this button:

``` html
<button id="info" class="blue">info</button>
```

There's is a shorter notation.

``` html
<button #info .blue>info</button>
```

## include html

Unlike vanila html, it's possible to include html inside another html document:

``` html
<include src="window.html" media="sciter" />
```

## html events

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

## css constants and variables

Unlike vanilla css, css constants and variables are supported

    https://sciter.com/developers/for-web-programmers/css-constants/
    https://sciter.com/css-variables-support/

