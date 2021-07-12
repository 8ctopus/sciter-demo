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

    // get screen dimensions
    const [sx, sy, sw, sh] = Window.this.screenBox("frame");

    //console.log(`${sx} ${sy} ${sw} ${sh}`)

    // move and maximize window
    Window.this.move(0, 0, sw, sh);

    // set focus
    document.body.state.focus = true;
});
