import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    latitudeTarget: String,
    longitudeTarget: String,
    markers: Array
  };
  static targets = ["map", "latitude", "longitude", "address"]

  connect() {
    console.log(this.longitudeTarget)
    console.log(this.latitudeTarget)
    mapboxgl.accessToken = this.apiKeyValue;

    const carte = new mapboxgl.Map({
      container: this.mapTarget,
      style: 'mapbox://styles/mapbox/streets-v11',
      center: [2.3522, 48.8566],
      zoom: 14,
      speed: 0.8,
      curve: 1,
    });

    const geocoder = new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl
    });

    geocoder.on('result', (event) => {
      const coordinates = event.result.center;
      console.log(event);

      this.latitudeTarget.value = coordinates[1];
      this.longitudeTarget.value = coordinates[0];
      this.addressTarget.value = event.result.place_name;
    });


    //   var styleSelector = document.getElementById('map-style');
    // styleSelector.addEventListener('change', function(e) {
    //   var style = e.target.value;
    //   carte.setStyle(style);
    // });

    var checkbox = document.getElementById("map-style-checkbox");
    checkbox.addEventListener("change", function() {
      // Vérifiez l'état de la checkbox
      if (checkbox.checked) {
        // Si la checkbox est cochée, utilisez le style Streets
        carte.setStyle("mapbox://styles/mapbox/streets-v11");
      } else {
        // Sinon, utilisez le style Satellite
        carte.setStyle("mapbox://styles/mapbox/satellite-v9");
      }
    });

    // navigator.geolocation.getCurrentPosition(function(position) {
    //   // Set the map's center to the user's position
    //   carte.setCenter([position.coords.longitude, position.coords.latitude]);

    //   // Add a marker at the user's position
    //   new mapboxgl.Marker()
    //     .setLngLat([position.coords.longitude, position.coords.latitude])
    //     .addTo(carte);
    // }, function(error) {
    //   console.error(error);
    // });



    navigator.geolocation.getCurrentPosition(function(position) {
      // Set the map's center to the user's position
      carte.setCenter([position.coords.longitude, position.coords.latitude]);

      // Create a custom marker using HTML and CSS
      var marker = document.createElement('div');
      marker.style.background = '#FF0000';
      marker.style.width = '16px';
      marker.style.height = '16px';
      marker.style.borderRadius = '50%';


      var marker = document.createElement('div');
      marker.className = 'marker';
      marker.innerHTML = '<span class="beacon"></span>';

      // Add the custom marker at the user's position
      new mapboxgl.Marker({ element: marker })
        .setLngLat([position.coords.longitude, position.coords.latitude])
        .addTo(carte);
    }, function(error) {
      console.error(error);
    });



    carte.on('touchstart', (event) => {
      console.log(this.latitudeTarget.value);
      this.marker?.remove();
      this.latitudeTarget.value = event.lngLat.lng;
      this.longitudeTarget.value = event.lngLat.lat;
      // this.addressTarget.value = "*** Secret ***";
      console.log(this.latitudeTarget.value);
      this.marker = new mapboxgl.Marker()
        .setLngLat([ event.lngLat.lng, event.lngLat.lat ])
        .addTo(carte)
    });

    carte.addControl(geocoder);
  }
}
