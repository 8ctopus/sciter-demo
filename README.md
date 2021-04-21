# sciter demo

This is a [sciter](https://sciter.com/) js demo app built from multiple sciter samples.

It showcases some of the sciter features I find interesting, namely:
- components: buttons, checkboxes, ...
- javacript
- themes

# sciter examples uses:
- sdk.js\samples\calc
- sdk.js\samples.sciter\themes

## get started

- git clone the repository
- run `install.bat` to download the sciter binaries and library
- run `scapp.exe`
- to debug the app, run `inspector.exe`

# sciter caveats

## html ids and classes

Consider this button:

``` html
<button id="info" class="blue">info</button>
```

There's is a shorter notation.

``` html
<button #info .blue>info</button>
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
