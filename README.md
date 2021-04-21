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

## html events

This doesn't work.

```html
<button #info onclick="console.log('test')">info</button>
```

Use this instead:

```html
document.$("#info").onclick = function () {
    console.log('test');
};

<button #info>info</button>
```
