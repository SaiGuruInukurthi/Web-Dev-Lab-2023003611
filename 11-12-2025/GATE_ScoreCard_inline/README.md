# GATE Score Card - Inline CSS

This folder contains a recreation of the GATE Score Card that uses inline styles (style attributes) for all layout and appearance settings. The HTML file references images in the `Gate_scorecard_internal` folder for the photo, signature, and QR code to avoid re-copying binary assets.

Files:
- `index.html` - The full recreated score card using inline CSS.

How to view:
1. Open `index.html` in a browser by double-clicking it or opening it from the browser.

Notes and adjustments:
- All layout & styles are inline on the elements to match the user's request.
- Watermark is implemented using repeating, inline SVG background images.
- To make the file fully self-contained, you can copy the images from `Gate_scorecard_internal` into this folder and update `src` attributes accordingly.

If you'd like me to copy the images into this folder or embed them as base64, tell me and I'll update `index.html` accordingly.
