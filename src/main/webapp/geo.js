geocoder = new google.maps.Geocoder();

function getCoordinates(address, callback) {
	var coordinates;
	geocoder.geocode({'address' : address}, function (results, status)) {
	    if (status = google.maps.GeocoderStatus.OK) {
            coords_obj = results[0].geometry.location;
            callback(coords_obj);
            coordinates = [coords_obj.lat(), coords_obj.lng()];

         } else {
            alert("Geocode failed, status: " + status)
         });
    }
}