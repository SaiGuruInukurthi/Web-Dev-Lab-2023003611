# Weather Webapp (Minimal/"Nothing"-style)

Quick notes ✅

- Files created: `index.html`, `styles.css`, `script.js`, `config.js`, `.env`.
- The UI is intentionally minimalist with a clean, large-title layout inspired by Nothing's styling.

How to add your API key 🔑

1. Add your OpenWeatherMap API key to `.env`:
   ```
   WEATHER_API_KEY=your_real_api_key
   ```

2. Generate config.js from .env:
   ```
   node generate-config.js
   ```

3. Open `index.html` in your browser to use the app.

**Note:** Browsers can't read .env files directly, so we use a script to copy the key from .env into config.js.

Run locally 🚀

- For best results run via a local HTTP server (e.g., `Live Server` extension in VS Code, or `python -m http.server`), then open `index.html`.

Notes

- The app fetches data from OpenWeatherMap's current weather API. If you get errors, check your API key and network.
- Remember not to commit real API keys to public repositories.
