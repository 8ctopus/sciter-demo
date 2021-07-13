"use strict";

// add scapp refresh
document.on("keydown", function(event, element) {
    if (event.code !== "KeyF5")
        return;

    // reload app
    Window.this.load(location.href);
});
