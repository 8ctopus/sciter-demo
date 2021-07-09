"use strict";

// add scapp refresh
document.on("keydown", function(event, element) {
    if (event.code !== "KeyF5")
        return;

    // reload app
    Window.this.load(location.href);
});

document.on("ready", function() {
    // bring window to front
    Window.this.isTopmost = true;
    Window.this.isTopmost = false;

/*
    // get screen dimensions
    const [sx, sy, sw, sh] = Window.this.screenBox("frame");

    //console.log(`${sx} ${sy} ${sw} ${sh}`)

    // get window dimensions with border
    const [wx, wy, ww, wh] = Window.this.box("rectw", "border");

    //console.log(`${wx} ${wy} ${ww} ${wh}`)

    // calculate position
    const left = (sw + 1 - ww) / 2;
    const top  = (sh + 1 - wh) / 2;

    // move window
    Window.this.move(left, top);
*/
    // set focus
    document.body.state.focus = true;
});
