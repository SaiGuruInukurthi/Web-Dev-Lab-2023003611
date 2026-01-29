// API_KEY is loaded from config.js

const elements = {
  searchForm: document.getElementById('searchForm'),
  cityInput: document.getElementById('cityInput'),
  msg: document.getElementById('msg'),
  card: document.getElementById('card'),
  city: document.getElementById('city'),
  desc: document.getElementById('desc'),
  temp: document.getElementById('temp'),
  icon: document.getElementById('icon'),
  feels: document.getElementById('feels'),
  hum: document.getElementById('hum'),
  wind: document.getElementById('wind'),
  geoBtn: document.getElementById('geoBtn')
};

function showMessage(text, isError = false){
  elements.msg.textContent = text;
  elements.msg.style.color = isError ? '#e03' : '';
}

async function fetchWeatherByCity(city){
  if(!WEATHER_API_KEY || WEATHER_API_KEY === 'REPLACE_WITH_YOUR_API_KEY'){
    showMessage('API key missing — please add it to config.js from your .env file.');
    return;
  }

  showMessage('Loading...');
  try{
    const url = `https://api.openweathermap.org/data/2.5/weather?q=${encodeURIComponent(city)}&units=metric&appid=${WEATHER_API_KEY}`;
    const res = await fetch(url);
    if(!res.ok) throw new Error('City not found');
    const data = await res.json();
    renderWeather(data);
    showMessage('');
  }catch(err){
    showMessage(err.message, true);
    elements.card.classList.add('hidden');
  }
}

async function fetchWeatherByCoords(lat, lon){
  if(!WEATHER_API_KEY || WEATHER_API_KEY === 'REPLACE_WITH_YOUR_API_KEY'){
    showMessage('API key missing — please add it to config.js from your .env file.');
    return;
  }
  showMessage('Loading...');
  try{
    const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&units=metric&appid=${WEATHER_API_KEY}`;
    const res = await fetch(url);
    if(!res.ok) throw new Error('Failed to get weather for your location');
    const data = await res.json();
    renderWeather(data);
    showMessage('');
  }catch(err){
    showMessage(err.message, true);
    elements.card.classList.add('hidden');
  }
}

function renderWeather(d){
  elements.card.classList.remove('hidden');
  elements.city.textContent = `${d.name}, ${d.sys?.country ?? ''}`;
  elements.desc.textContent = d.weather?.[0]?.description ?? '';
  elements.temp.textContent = `${Math.round(d.main.temp)}°`;
  elements.feels.textContent = `${Math.round(d.main.feels_like)}°`;
  elements.hum.textContent = `${d.main.humidity}%`;
  elements.wind.textContent = `${d.wind.speed} m/s`;
  const iconCode = d.weather?.[0]?.icon;
  elements.icon.src = iconCode ? `https://openweathermap.org/img/wn/${iconCode}@2x.png` : '';
}

elements.searchForm.addEventListener('submit', e => {
  e.preventDefault();
  const city = elements.cityInput.value.trim();
  if(city) fetchWeatherByCity(city);
});

elements.geoBtn.addEventListener('click', () => {
  if(!navigator.geolocation){
    showMessage('Geolocation not supported by your browser', true);
    return;
  }
  showMessage('Getting location...');
  navigator.geolocation.getCurrentPosition(pos => {
    fetchWeatherByCoords(pos.coords.latitude, pos.coords.longitude);
  }, err => {
    showMessage('Unable to retrieve location', true);
  });
});

// Load London weather on startup
fetchWeatherByCity('London');
