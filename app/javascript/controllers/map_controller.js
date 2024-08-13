import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  connect() {
    const mapboxAccessToken = this.element.dataset.mapboxApiKey;
    mapboxgl.accessToken = mapboxAccessToken;

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v12',
      center: [139.759455, 38.6828391], // starting position
      zoom: 4.5
    });

    // let start = null;
    // let end = null;
    let waypoints = [];

    async function getRoute(start, end) {
      // make a directions request using cycling profile
      // an arbitrary start will always be the same
      // only the end or destination will change
      const query = await fetch(
        `https://api.mapbox.com/directions/v5/mapbox/driving-traffic/${start[0]},${start[1]};${end[0]},${end[1]}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`,
        { method: 'GET' }
      );
      const json = await query.json();
      const data = json.routes[0];
      const route = data.geometry.coordinates;
      const geojson = {
        type: 'Feature',
        properties: {},
        geometry: {
          type: 'LineString',
          coordinates: route
        }
      };
      // if the route already exists on the map, we'll reset it using setData
      if (map.getSource('route')) {
        map.getSource('route').setData(geojson);
      }
      // otherwise, we'll make a new request
      else {
        map.addLayer({
          id: 'route',
          type: 'line',
          source: {
            type: 'geojson',
            data: geojson
          },
          layout: {
            'line-join': 'round',
            'line-cap': 'round'
          },
          paint: {
            'line-color': '#3887be',
            'line-width': 5,
            'line-opacity': 0.75
          }
        });
      }
      // add turn instructions here at the end
    }

    function addMarker(coords, id, color) {
      if (map.getLayer(id)) {
        map.getSource(id).setData({
          type: 'FeatureCollection',
          features: [{
            type: 'Feature',
            geometry: { type: 'Point', coordinates: coords },
            properties: {}
          }]
        });
      } else {
      map.addLayer({
        id: id,
        type: 'circle',
        source: {
          type: 'geojson',
          data: {
            type: 'FeatureCollection',
            features: [
              {
                type: 'Feature',
                geometry: {
                  type: 'Point',
                  coordinates: coords
                },
                properties: {}
              }]
          }
        },
        paint: {
          'circle-radius': 10,
          'circle-color': color
        }
      });
      }
    }
      // this is where the code from the next step will go
      map.on('click', (event) => {
        const coords = [event.lngLat.lng, event.lngLat.lat];
        waypoints.push(coords); // Store each clicked point as a waypoint

        if (waypoints.length === 1) {
        addMarker(coords, 'start', '#3887be');
      } else if (waypoints.length === 2)  {
        addMarker(coords, 'end', '#f30');
        getRoute(waypoints[0], waypoints[1]);
      } else {
        waypoints = [coords]; // Reset the waypoints and start a new route
        addMarker(start, 'start', '#3887be');
        map.removeLayer('end');
        map.removeSource('route');
      }
    });

      // Select the form using the generated form ID from Simple Form
    const form = document.querySelector('form');

    form.addEventListener('submit', function(event) {
      const waypointsInput = document.querySelector('#waypoints_input');
      waypointsInput.value = JSON.stringify(waypoints); // Populate hidden field with JSON string of waypoints
    });
  }
}
