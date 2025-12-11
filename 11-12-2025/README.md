
# GATE Score Card — Project README

Date: 11/12/2025

Today in web dev lab, we were instructed to use the provided reference image of a GATE examination scorecard and recreate it using HTML and CSS in three different ways.

Reference image (saved in this folder as `Reference.jpg`):

![Reference image of the GATE Score Card](Reference.jpg)

Assignment
---------
- Recreate the GATE Score Card using the given reference image and make 3 versions:
	- Using inline CSS (styles in the `style` attributes of elements) — `GATE_ScoreCard_inline/index.html`
	- Using internal CSS (a <style> block inside the `<head>`) — `Gate_scorecard_internal/index.html`
	- Using external CSS (a separate `styles.css` file) — `GATE_ScoreCard_External/index.html`

Project structure
-----------------
The project in this workspace currently contains the following files and folders (relative to this workspace root):

```
GATE_ScoreCard_External/
	├─ index.html
	├─ styles.css
	├─ README.md
	└─ Results.png

GATE_ScoreCard_inline/
	├─ index.html
	├─ README.md
	└─ Results.png

Gate_scorecard_internal/
	├─ index.html
	├─ Loki.png
	├─ Loki_sig.png
	├─ Rickroll QR.png
	├─ Reference.jpg
	├─ Results.png
	└─ README.md  <-- (this file)

Other files at workspace root:
	├─ Reference.jpg
	├─README.md
	└─ .vscode/
```

Viewing & testing
-----------------
1. Open any of the `index.html` files in your browser to preview the card.
2. The `GATE_ScoreCard_inline/index.html` file uses inline `style` attributes for everything.
3. The `Gate_scorecard_internal/index.html` uses internal CSS inside a `<style>` block.
4. The `GATE_ScoreCard_External/index.html` imports `styles.css` for all styles.
5. If URLs to images in the HTML reference the `Gate_scorecard_internal` folder (for example to avoid duplicating assets), copy the images into the same folder as needed or update the paths.



