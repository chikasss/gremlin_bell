import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

// Connects to data-controller="map"
export default class extends Controller {
  static targets = ["waypointsInput", "mapContainer"]

  connect() {
    this.markers = new Map();
    const mapboxAccessToken = this.element.dataset.mapboxApiKey;
    mapboxgl.accessToken = mapboxAccessToken;

    this.map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/chikas/cm00elyc0007101pw2mloe5uw',
      center: [139.759455, 38.6828391], // starting position
      zoom: 4.5
    });

    this.map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        trackUserLocation: true,
        showUserHeading: false
      }),
      'top-left'
    );

    this.map.addControl(
      new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      types: "country,region,place,postcode,locality,neighborhood,address",
      mapboxgl: mapboxgl,
      placeholder: 'Search for a place',
      className: 'custom-geocoder'
    }),
    );

    this.waypoints = this.initializeWaypoints();
    //this.updateWaypoints();
    //let isLongPress = false;

    this.map.on('click', (event) => {
        const coords = [event.lngLat.lng, event.lngLat.lat];
        this.waypoints.push(coords);
        this.updateWaypoints();
      // if (!isLongPress) {
      //   const coords = [event.lngLat.lng, event.lngLat.lat];
      //   this.waypoints.push(coords);
      //   this.updateWaypoints();
      // }
      //isLongPress = false;
    });

    // let touchTimer, mouseTimer;

    // this.map.on('touchstart', (event) => {
    //   touchTimer = setTimeout(() => {
    //     isLongPress = true;
    //     this.handleLandmark(event);
    //   }, 1500);
    // });

    // this.map.on('touchend', () => {
    //   clearTimeout(touchTimer);
    // });

    // this.map.getCanvas().addEventListener('mousedown', (event) => {
    //   mouseTimer = setTimeout(() => {
    //     isLongPress = true;
    //     //const mapboxPoint = this.map.unproject([event.clientX, event.clientY]);
    //     this.handleLandmark(event); //
    //   }, 1500);
    // });

    // this.map.getCanvas().addEventListener('mouseup', () => {
    //   clearTimeout(mouseTimer);
    // });

    // this.map.getCanvas().addEventListener('mouseleave', () => {
    //   clearTimeout(mouseTimer);
    // });

    this.updateWaypointList();
    this.displayLandmark();
  }

    initializeWaypoints() {
      const waypointsInput = document.querySelector('#waypoints_input');
      return waypointsInput ? JSON.parse(waypointsInput.value || '[]') : [];
    }


    updateWaypoints(){
      ['start', 'end'].forEach(id => {
        if (this.map.getLayer(id)) {
          this.map.removeLayer(id);
          this.map.removeSource(id);
        }
      });

      // remove all the existing marker, before re-rendering them
      document.querySelectorAll(".custom-marker").forEach(marker => marker.remove())
      console.log(document.querySelectorAll(".custom-marker"));

      // re-rendering markers
      this.waypoints.forEach((point, index) => {
        this.addMarker(point, `waypoint-${index}`,
          index === 0 ? '#3887be' : '#f30', true);
      });

      if (this.waypoints.length > 1) {
        this.getRoute(this.waypoints);
      } else {
        if (this.map.getSource('route')) {
          this.map.removeLayer('route');
          this.map.removeSource('route');
        }
      }

      const waypointsInput = document.querySelector('#waypoints_input');
      if (waypointsInput) {
      waypointsInput.value = JSON.stringify(this.waypoints);
      }

      this.updateWaypointList();
    }

    displayLandmark() {
      // const lat = parseFloat(this.element.dataset.mapLat);
      // const long = parseFloat(this.element.dataset.mapLong);
      // landmark.coordinates
      const coords = JSON.parse(this.element.dataset.mapCoordinates) ||'[]';
      this.map.setCenter(coords);
      this.addMarker(coords, 'landmark', '#000', true);
    }

    addMarker(coords, id, color, useCustomMarker = false) {
      console.log('Adding marker at', coords);
      const markerElement = useCustomMarker ? this.createCustomMarkerElement(id) : null;
      const marker = new mapboxgl.Marker(markerElement || { color })
        .setLngLat(coords)
        .addTo(this.map);
      this.markers.set(id, marker);
    }


    createCustomMarkerElement(id) {
      const el = document.createElement('div');
      el.id = `marker-${id}`
      el.className = 'custom-marker';
      el.style.backgroundImage = `url(${this.data.get("logoUrl")})`; // URL to your custom icon
      el.style.width = '42px'; // Size of the icon
      el.style.height = '42px';
      el.style.backgroundSize = '100%';
      return el;
    }

    removeWaypoint(event){
      const index = parseInt(event.currentTarget.dataset.index);
      const waypointId = `waypoint-${index}`;

      console.log("Attempting to remove waypoint with ID:", waypointId);
      console.log(this.markers);
      if (this.markers.has(waypointId)) {
        const marker = this.markers.get(waypointId);
        console.log(`marker-${waypointId}`, marker, this.markers);
        marker.remove();  // This removes the marker from the map
        this.markers.delete(waypointId);  // This removes the marker from the tracking map
        console.log(marker, this.markers);

      }
      console.log(this.waypoints);
      this.waypoints.splice(index, 1);

      this.updateWaypoints(); // Ensure map markers and route are updated
      //this.updateWaypointList(); // Update the lis
    }

    updateWaypointList() {
      console.log("updating")
      const waypointsList = document.querySelector('#waypoints-list');
      if (!waypointsList) return;

      waypointsList.innerHTML = '';

      this.waypoints.forEach((coords, index) => {
        const listItem = document.createElement('li');
        listItem.textContent = `Waypoint ${index + 1} - Lat: ${coords[1]}, Lng: ${coords[0]} `;
        const removeButton = document.createElement('button');
        removeButton.textContent = 'Remove';
        removeButton.setAttribute('type', 'button');
        removeButton.dataset.action = 'click->map#removeWaypoint';
        removeButton.dataset.index = index;
        listItem.appendChild(removeButton);
        waypointsList.appendChild(listItem);
      });
    }


    // handleLandmark(event) {
    //   console.log("adding landmark")
    //   const coords = [event.lngLat.lng, event.lngLat.lat];
    //   this.addMarker(coords, 'landmark', '#000', true);

    //     const formData = new FormData();
    //     formData.append('landmark[latitude]', coords[1]);
    //     formData.append('landmark[longitude]', coords[0]);
    //     formData.append('landmark[name]', 'New Landmark');

    //     const csrfToken = document.querySelector("[name='csrf-token']").content;

    //     const options = {
    //       method: 'POST',
    //       headers: {
    //         "Accept": "text/plain",
    //         "X-CSRF-Token": csrfToken,
    //       },
    //       body: formData,
    //     };

    //     fetch(`/routes/${this.routeIdTarget}/landmarks`, options)
    //       .then(response => response.text())
    //       .then((data) => {
    //         this.landmarksTarget.insertAdjacentHTML('beforeend', data);
    //       });
    // }

  getRoute(waypoints) {
    const waypointsString = waypoints.map(p => p.join(',')).join(';');
    fetch(
      `https://api.mapbox.com/directions/v5/mapbox/driving-traffic/${waypointsString}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`,
      { method: 'GET' }
    )
    .then(response => response.json())
    .then(json => {
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

      if (this.map.getSource('route')) {
        this.map.getSource('route').setData(geojson);
      } else {
        this.map.addLayer({
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
            'line-color': '#ff5e5e',
            'line-width': 4
          }
        });
      }
    });
  }
}
