import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

// Connects to data-controller="map"
export default class extends Controller {
  static targets = ["waypointsInput", "mapContainer"]

  connect() {
    this.markers = new Map();
    this.landmarks = this.landmarks || [];
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

    const geocoder = new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      types: "country,region,place,postcode,locality,neighborhood,address, poi",
      mapboxgl: mapboxgl,
      countries: 'jp',
      placeholder: 'Search for a place',
      className: 'custom-geocoder'
    });

    this.map.addControl(geocoder);

// geocoder.on('result', (event) => {
//   const coordinates = event.result.geometry.coordinates;
//   const address = event.result.place_name; // This is the address

//   this.addLandmarkMarker(coordinates, `landmark-${this.landmarks.length}`, '#000', true, address);
//   console.log(address)
// });

    this.waypoints = this.initializeWaypoints();

    this.map.on('click', (event) => {
        const coords = [event.lngLat.lng, event.lngLat.lat];
        this.waypoints.push(coords);
        this.updateWaypoints();
    });

    this.updateWaypointList();

    this.element.addEventListener('landmark:add', (event) => {
      const { coordinates } = event.detail;
      const address = event.detail.address;
      if (Array.isArray(coordinates) && coordinates.length === 2) {
        this.landmarks.push({ coords: coordinates, address });
        this.addLandmarkMarker(coordinates, `landmark-${this.landmarks.length - 1}`, "#000", true, address);
      } else {
        console.error("1. Invalid coordinates format. Expected [lng, lat] array.");
      }
    });

  }

  addLandmarkMarker(coords, id, color, useCustomMarker = false, address = "") {
    console.log('Adding landmark marker at', coords);
    if (!Array.isArray(coords) || coords.length !== 2) {
      console.error("2. Invalid coordinates format. Expected [lng, lat] array.");
      return;
    }

    const markerElement = useCustomMarker ? this.createLandmarkCustomMarkerElement(id) : null;
    const marker = new mapboxgl.Marker(markerElement || { color })
      .setLngLat(coords)
      .addTo(this.map);
    this.markers.set(id, marker);
    this.landmarks.push({ coords, address });

    console.log('Landmark marker', marker);
    console.log('Landmark address:', address);
  }

  createLandmarkCustomMarkerElement(id) {
    const el = document.createElement('div');
    el.id = `marker-${id}`
    el.className = 'custom-marker';
    el.style.backgroundImage = `url(${this.data.get("pinPurple")})`; // URL to your custom icon
    el.style.width = '46px'; // Size of the icon
    el.style.height = '46px';
    el.style.backgroundSize = '100%';
    return el;
  }


    initializeWaypoints() {
      const waypointsInput = document.querySelector('#waypoints_input');
      return waypointsInput ? JSON.parse(waypointsInput.value || '[]') : [];
    }


    updateWaypoints(){

      // remove all the existing marker, before re-rendering them
      document.querySelectorAll(".custom-marker").forEach(marker => marker.remove())
      // console.log(document.querySelectorAll(".custom-marker"));


      // re-rendering waypoints
      this.waypoints.forEach((point, index) => {
        this.addMarker(point, `waypoint-${index}`,
          index === 0 ? '#3887be' : '#f30', true);
      });

      // console.log("Current landmarks:", this.landmarks);

      // re-rendering landmarks
      this.landmarks.forEach((landmark, index) => {
        const coords = landmark.coords;  // Access the coordinates array
        const address = landmark.address;     // Access the address string

        console.log("landmark coords:", coords)
        if (Array.isArray(coords) && coords.length === 2) {
          this.addLandmarkMarker(coords, `landmark-${index}`, "#000", true, address);
        } else {
          console.error("3. Invalid coordinates format. Expected [lng, lat] array.");
        }
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



    addMarker(coords, id, color, useCustomMarker = false) {
      console.log('Adding marker at', coords);
      const markerElement = useCustomMarker ? this.createCustomMarkerElement(id) : null;
      const marker = new mapboxgl.Marker(markerElement || { color })
        .setLngLat(coords)
        .addTo(this.map);
      this.markers.set(id, marker);
      console.log("this.waypoints:", this.waypoints)
    }


    createCustomMarkerElement(id) {
      const el = document.createElement('div');
      el.id = `marker-${id}`
      console.log("id:", id )
      el.className = 'custom-marker';
      //el.style.backgroundImage = `url(${this.data.get("logoUrl")})`;
      if (id == "waypoint-0") {
        el.style.backgroundImage = `url(${this.data.get("pinOne")})`
      }
      else if (id == "waypoint-1") {
        el.style.backgroundImage = `url(${this.data.get("pinTwo")})`
      }
      else if (id == "waypoint-2") {
        el.style.backgroundImage = `url(${this.data.get("pinThree")})`
      }
      else if (id == "waypoint-3") {
        el.style.backgroundImage = `url(${this.data.get("pinFour")})`
      }
      else if (id == "waypoint-4") {
        el.style.backgroundImage = `url(${this.data.get("pinFive")})`
      }
      else if (id == "waypoint-5") {
        el.style.backgroundImage = `url(${this.data.get("pinSix")})`
      }
      else if (id == "waypoint-6") {
        el.style.backgroundImage = `url(${this.data.get("pinSeven")})`
      }
      else if (id == "waypoint-7") {
        el.style.backgroundImage = `url(${this.data.get("pinEight")})`
      }
      else if (id == "waypoint-8") {
        el.style.backgroundImage = `url(${this.data.get("pinNine")})`
      }
      else if (id == "waypoint-9") {
        el.style.backgroundImage = `url(${this.data.get("pinTen")})`
      }
      else {
        el.style.backgroundImage = `url(${this.data.get("logoUrl")})`;
      }

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
      const waypointsList = document.querySelector('#waypoints-list');
      if (!waypointsList) return;

      waypointsList.innerHTML = '';

      this.waypoints.forEach((coords, index) => {
        const listItem = document.createElement('div');
        // listItem.textContent = `Waypoint ${index + 1} - Lat: ${coords[1]}, Lng: ${coords[0]} `;
        // listItem.textContent = `Waypoint: ${index + 1} `;
        listItem.classList.add('no-marker');

        const waypointImage = document.createElement('img');
        waypointImage.src = this.getWaypointImageSrc(index);
        waypointImage.alt = `Waypoint ${index + 1}`;
        waypointImage.classList.add('waypoint-icon');
        listItem.appendChild(waypointImage);

        const removeButton = document.createElement('button');
        removeButton.textContent = '×';
        removeButton.classList.add('btn', 'btn-danger', 'btn-sm', 'custom-remove-btn');
        removeButton.setAttribute('type', 'button');
        removeButton.dataset.action = 'click->map#removeWaypoint';
        removeButton.dataset.index = index;
        listItem.appendChild(removeButton);

        waypointsList.appendChild(listItem);

  //       const removeButton = document.createElement('button');
  // removeButton.classList.add('custom-remove-btn'); // Add a custom class for any specific styles
  // removeButton.setAttribute('type', 'button');
  // removeButton.dataset.action = 'click->map#removeWaypoint';
  // removeButton.dataset.index = index;

  // // Create the image element for the remove button
  // const removeIcon = document.createElement('img');
  // removeIcon.src = this.data.get("remove");// Replace with the correct path to your icon
  // removeIcon.alt = 'Remove';
  // removeIcon.style.width = '38px'; // Adjust size as needed
  // removeIcon.style.height = '38px'; // Adjust size as needed

  // removeButton.appendChild(removeIcon); // Append the image to the button
  // listItem.appendChild(removeButton);

  // waypointsList.appendChild(listItem);
      });
    }

    getWaypointImageSrc(index) {
      switch (index) {
        case 0:
          return this.data.get("pinOne");
        case 1:
          return this.data.get("pinTwo");
        case 2:
          return this.data.get("pinThree");
        case 3:
          return this.data.get("pinFour");
        case 4:
          return this.data.get("pinFive");
        case 5:
          return this.data.get("pinSix");
        case 6:
          return this.data.get("pinSeven");
        case 7:
          return this.data.get("pinEight");
        case 8:
          return this.data.get("pinNine");
        case 9:
          return this.data.get("pinTen");
        default:
          return this.data.get("logoUrl"); // Fallback image
      }
    }

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
