"use strict";

// add scapp refresh
document.on("keydown", function(event, element) {
    if (event.code !== "KeyF5")
        return;

    // reload app
    Window.this.load(location.href);
});

document.on("ready", function() {
    //console.log("Maximize window...");

    if (Window.this.state == Window.WINDOW_MAXIMIZED)
        Window.this.state = Window.WINDOW_MINIMIZED;

    // maximize window
    Window.this.state = Window.WINDOW_MAXIMIZED;
});
