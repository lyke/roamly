import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    startingPoint: String
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    const toto = this.markersValue
    this.getRoute(toto)

    // const start = [-122.662323, 45.523751];
  }

  getRoute(toto) {
    let markersUrl = ""

    this.markersValue.forEach((marker, index) => {
       markersUrl += `${marker.lng.toString()},${marker.lat.toString()};`
    })


    if (markersUrl.endsWith(";")) {
      markersUrl = markersUrl.substring(0, markersUrl.length - 1);
    }

    console.log(markersUrl.substring(0, this.markersValue.length - 1))


    fetch(
      `https://api.mapbox.com/directions/v5/mapbox/cycling/${markersUrl}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`,
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
              'line-color': '#3887be',
              'line-width': 5,
              'line-opacity': 0.75
            }
          });
        }
      })
      .catch(error => {
        console.error('Error:', error);
      });


  }



  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

    // create a function to make a directions request
}
