import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const mapElement = document.getElementById('map');


const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const mapBoxMap = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/lolafagade/cjw7qkzoq08aq1cmw0f7bsq49',
center: [4.895380, 52.355020],
zoom: 12.0
  });
  window.mapBoxMap = mapBoxMap;
  return mapBoxMap
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 40, maxZoom: 13 });
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken }));
  }
};



export { initMapbox };
