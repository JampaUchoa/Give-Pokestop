var newMarker;

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


  google.maps.event.addListener(map, 'click', function(event) {
      if (newMarker) {
          newMarker.setMap(null);
      }
      newMarker = new google.maps.Marker({
          position: event.latLng,
          map: map
      });

      newMarker.infoWindow = new google.maps.InfoWindow({
          content: "Here?",
          disableAutoPan: false
      });
      newMarker.infoWindow.open(map, newMarker);

      google.maps.event.addListener(newMarker.infoWindow,'closeclick',function(){
          newMarker.setMap(null); //removes the marker
          inputCoords("","");
      });

      inputCoords(newMarker.getPosition().lat(), newMarker.getPosition().lng());
  });

}

function inputCoords(lat, long) {

  document.getElementById("candidate_latitude").value = lat;
  document.getElementById("candidate_longitude").value = long;

}
