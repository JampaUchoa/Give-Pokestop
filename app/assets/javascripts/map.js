function initMap() {

  var initLat = 0;
  var initLng = 0;

  map = new google.maps.Map(document.getElementById('map'), {
      // Change this to geolocation?
      center: {lat: initLat, lng: initLng},
      zoom: 2,
      mapTypeControl: false,
      streetViewControl: false,
      disableAutoPan: true
  });


}
