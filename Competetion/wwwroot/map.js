var directionsService;
var directionsRenderer;

export function initializemap() {
    directionsService = new google.maps.DirectionsService();
    directionsRenderer = new google.maps.DirectionsRenderer();
    var gujrat = new google.maps.LatLng(32.5731, 74.075005);
    var mapOptions = {
        zoom: 6,
        center: gujrat
    }
    var map = new google.maps.Map(document.getElementById('map'), mapOptions);
    directionsRenderer.setMap(map);
}

export function calcRoute(fromloc, toloc) {
    var start = fromloc;
    var end = toloc;
    var request = {
        origin: start,
        destination: end,
        travelMode: 'DRIVING',
        drivingOptions: {
            departureTime: new Date(Date.now()),
        }
    };
    unitSystem: google.maps.UnitSystem.METRIC

    directionsService.route(request, function (result, status) {
        if (status == 'OK') {
            directionsRenderer.setDirections(result);
            var distance = result.routes[0].legs[0].distance.text;
            var duration = result.routes[0].legs[0].duration.text;
            var durationInTraffic = result.routes[0].legs[0].duration_in_traffic ? result.routes[0].legs[0].duration_in_traffic.text : "Unavailable";
            document.getElementById("sidebar").textContent = "Distance: " + distance;
            document.getElementById("sidebar1").textContent = "Duration: " + duration;
            document.getElementById("sidebar2").textContent = "Duration In Traffic: " + durationInTraffic;

        }
    })
}
