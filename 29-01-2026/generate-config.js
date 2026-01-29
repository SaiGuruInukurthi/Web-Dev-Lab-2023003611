// Simple script to read .env and generate config.js
const fs = require('fs');
const path = require('path');

const envPath = path.join(__dirname, '.env');
const configPath = path.join(__dirname, 'config.js');

// Read .env file
const envContent = fs.readFileSync(envPath, 'utf8');
const match = envContent.match(/^\s*WEATHER_API_KEY\s*=\s*(.+)\s*$/m);
const apiKey = match ? match[1].trim() : 'REPLACE_WITH_YOUR_API_KEY';

// Generate config.js
const configContent = `// Auto-generated from .env - DO NOT EDIT MANUALLY
// To update: Edit .env then run: node generate-config.js

const WEATHER_API_KEY = '${apiKey}';
`;

fs.writeFileSync(configPath, configContent);
console.log('✅ config.js generated from .env');
