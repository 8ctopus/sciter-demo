"use strict";

// add scapp refresh
document.on("keydown", function(event, element) {
    if (event.code === "KeyF5")
        // reload app
        Window.this.load(location.href);
});

document.on("ready", function() {
    // fix issues with window not maxmizing itself on f5
    if (Window.this.state === Window.WINDOW_MAXIMIZED)
        Window.this.state = Window.WINDOW_MINIMIZED;

    // maximize window
    Window.this.state = Window.WINDOW_MAXIMIZED;
});
