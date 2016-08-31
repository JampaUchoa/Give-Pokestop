var newMarker;

function initMap() {

  var initLat = 0;
  var initLng = 0;

  var icon = new google.maps.MarkerImage('public/icons/pokestop.png', null, null, null, new google.maps.Size(30,30));

  map = new google.maps.Map(document.getElementById('map'), {
      // Change this to geolocation?
      center: {lat: initLat, lng: initLng},
      zoom: 3,
      mapTypeControl: false,
      streetViewControl: false,
      disableAutoPan: true
  });

  poll();

  google.maps.event.addListener(map, 'click', function(event) {
      if (newMarker) {
          newMarker.setMap(null);
      }
      newMarker = new google.maps.Marker({
          position: event.latLng,
          map: map
      });

      newMarker.infoWindow = new google.maps.InfoWindow({
          content: "<div id='add-candidate'> Add a pokestop here! </div>",
          disableAutoPan: false
      });
      newMarker.infoWindow.open(map, newMarker);



      google.maps.event.addListener(newMarker.infoWindow,'closeclick',function(){
          newMarker.setMap(null); //removes the marker
          inputCoords("","");
          toggleView("manual");
      });


      inputCoords(newMarker.getPosition().lat(), newMarker.getPosition().lng());

  });

}

function inputCoords(lat, long) {

  document.getElementById("candidate_latitude").value = lat;
  document.getElementById("candidate_longitude").value = long;

}

function addListeners(marker){
    marker.addListener('click', function() {
        marker.infoWindow.open(map, marker);
        marker.persist = true;
    });

    google.maps.event.addListener(marker.infoWindow,'closeclick',function(){
        marker.persist = null;
    });

    var isMobile = (/iphone|ipod|android|ie|blackberry|fennec/).test(navigator.userAgent.toLowerCase());

    if (!isMobile){
        marker.addListener('mouseover', function() {
            marker.infoWindow.open(map, marker);
        });

        marker.addListener('mouseout', function() {
            if (!marker.persist) {
                marker.infoWindow.close();
            }
        });
    }
    return marker
}

function poll() {

  setTimeout(poll, 3000)

  if (map.getBounds() == undefined){
    console.log("undefined");
    return;
  }

  $.ajax({url: "candidate",
          type: 'GET',
          data: {'nw_la': map.getBounds().getNorthEast().lat(),
                 'nw_lo': map.getBounds().getNorthEast().lng(),
                 'se_la': map.getBounds().getSouthWest().lat(),
                 'se_lo': map.getBounds().getNorthEast().lng()},
          dataType: "json"
        }).done(function(data) {

          $.each(data.result, function(i, item){
            var icon = new google.maps.MarkerImage('static/icons/'+item.pokemon_id+'.png', null, null, null, new google.maps.Size(30,30));

            var marker = new google.maps.Marker({
               position: {lat: item.latitude, lng: item.longitude},
               map: map,
               title: item.name
            });

            marker.infoWindow = new google.maps.InfoWindow({
                content: "<div class='marker'> <img src="+ item.image.url +"> <h2> "+ item.name +"</h2> <p> "+ item.description+ " <p> <i> "+ item.comment +" </i></div>",
                disableAutoPan: true
            });

            addListeners(marker);

        });
        }).fail(function() {
          console.log("fail");
        });
}

function toggleView(view){
  $(".view").addClass("hidden");
  $("."+ view +"").removeClass("hidden");
  flashClear();
}

$(document).on('turbolinks:load', function() {

  $('#map').on('click', '#add-candidate', function () {
    if (loggedIn){
      toggleView("form");
    } else{
      flash("You must log in to add a Pokestop");
      toggleView("login");
    }
  });

  $('body').on('click', '.entry', function () {
    toggleView("login");
  });

});



function flash(text) {
  $(".alert-js").removeClass("hidden");
  $(".alert-js").text(text);

}

function flashClear() {
  $(".alert-js").addClass("hidden");
}
