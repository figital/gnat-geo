function initialize() {

	geocoder = new google.maps.Geocoder();

}

function getCoordinates(lookup, id) {

	geocoder.geocode( { 'address': lookup}, function(results, status) {

		newline = "";
		previous = $("#tResults").val();		

		if (status == google.maps.GeocoderStatus.OK) {

			loc = results[0].geometry.location;
			newline = id + ',' + loc + '\n';

		} else {
			newline = id + ' ERROR: ' + status + '\n';
		}
		$('#tResults').val(newline + previous); 
	    if (i == datastore.length) { alert('done') }
	});

};


var geocoder;
var map;
intervalId = 0;
i = 0;
datastore = "";

function timedCount() {
	var l = datastore[i];
	lookup = l.address1 + ' ' + l.address2 + ', ' + l.city + ', ' + l.state + ' ' + l.zip;
	getCoordinates(lookup, l.id);			
	i++;
	$("#cursor").val(i);



}

function begin() {
	$.ajax({
		url: 'locations.json?2',
		dataType: 'json',
		async: false,
		success: function(data){
			datastore = data; // store globally
			$("#size").val(datastore.length);
			intervalId = setInterval("timedCount()", 2000 );
		}
	});
}

$(document).ready(function($) {
	
	initialize();

});

