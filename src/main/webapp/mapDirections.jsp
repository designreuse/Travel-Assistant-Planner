
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">
    <link rel="stylesheet" href="stylesheets/map.css">
    <title>Map and Directions</title>

    <!-- Bootstrap core CSS -->
    <link href="stylesheets/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="jumbotron.css" rel="stylesheet">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <script type= "text/javascript"
            src="https://maps.googleapis.com/maps/api/js?v3.exp&libraries=places,weather&sensor=false">
    </script>

    <script type=" text/javascript">
        var directionsDisplay;
        var directionsService = new google.maps.DirectionsService();
        var map;
        var marker;
        var stepDisplay;
        var douglasville = new google.maps.LatLng(33.751497,-84.747714);
        var address = ["4899 Chapel Hill rd douglasville, ga 30135", "120 North avenue nw atlanta, ga 30332", "275 Riverside Pkwy SW, Austell, GA 30168"];

        function initialize() {
            directionsDisplay = new google.maps.DirectionsRenderer();
            var chicago = new google.maps.LatLng(41.850033, -87.6500523);
            var mapOptions = {
                zoom: 6,
                center: douglasville
            }

            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
            directionsDisplay.setMap(map);
            directionsDisplay.setPanel(document.getElementById('directions-panel'));

            var rendererOptions = {
                map: map
            };
            directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions)
            directionsDisplay.setPanel(document.getElementById('directions-panel'));
            stepDisplay = new google.maps.InfoWindow();

            var trafficLayer = new google.maps.TrafficLayer();
            $('#toggle_traffic').click(function () {

                if(trafficLayer.getMap()){
                    trafficLayer.setMap(null);
                }
                else{
                    trafficLayer.setMap(map);
                }
            });

            var weatherLayer = new google.maps.weather.WeatherLayer({
                temperatureUnits: google.maps.weather.TemperatureUnit.FAHRENHEIT
            });

            var cloudLayer = new google.maps.weather.CloudLayer();

            $('#toggle_weather').click(function () {

                if(weatherLayer.getMap() || cloudLayer.getMap()){
                    weatherLayer.setMap(null);
                    cloudLayer.setMap(null);
                }
                else{
                    weatherLayer.setMap(map);
                    cloudLayer.setMap(map);
                }
            });

            var transitLayer = new google.maps.TransitLayer();
            $('#toggle_transit').click(function () {

                if(transitLayer.getMap()){
                    transitLayer.setMap(null);
                }
                else{
                    transitLayer.setMap(map);
                }
            });

        }

        function calcRoute() {

            <%@ page import="edu.gatech.TAP.controller.*" %>

            <%@ page import="java.util.*" %>
            <%@ page import="java.Lang.*" %>

            <%
                ArrayList<String> address = (ArrayList<String>) request.getAttribute("address");
                String cenLoc = "766 Drewry St NE, Atlanta, GA";
            %>
            var location;
            var address = ${addressJson};
            var waypts = new Array();
            <%--address[0] = '${address1}';--%>
            <%--address[1]='${address2}';--%>
            console.log('${addressJson.get(0)}');
            console.log('${itineraryID}');
//            document.write(address[0]);
//            document.write(address[1]);

            var start = '${centralLocation}';
            <%--// replace with "${centralLocation}"--%>
            var end = address[address.length-1];
            address.splice(0,1);
            address.splice(address.length-1,1);
            console.log(address);
//            address.splice(0,1);
//            address.remove(address.size()-1);
//            for ( location in address) {
//                waypts.push({
//                    location:location,
//                    stopover:true});
//            }
            console.log(waypts);

            address.forEach(function(entry) {
                waypts.push({
                    location: entry,
                    stopover:true});

            });
            var request = {
                origin: start,
                destination: end,
                waypoints: waypts,
                optimizeWaypoints: true,
                travelMode: google.maps.TravelMode.DRIVING
            };
            directionsService.route(request, function(response, status) {
                if (status == google.maps.DirectionsStatus.OK) {
                    directionsDisplay.setDirections(response);C
                }else{
                    alert("something went wrong!");
                }

            });

        }





        google.maps.event.addDomListener(window, 'load', initialize);

    </script>
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="home.jsp">TAP</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li><a href="displayItinerary">Itineraries</a></li>
                <li><a href="accountPage.jsp">My Account</a></li>
                <li><a href="Contact.jsp">Contact Us</a></li>
            </ul>
            <ul class= "nav navbar-nav navbar-right">
                <li><a href="LogoutServlet">Log Out</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="jumbotron">
    <div class="container">
        <h1>TAP</h1>
        <h2>Travel Advisor & Planner</h2>
        <p>Save your time to discover more places ! Find the shortest routes and directions to your destinations</p>
    </div>
</div>
<div id = "map-body">

<div id="directions-panel"></div>
<div id="map-canvas" ></div>
<input type="submit" value="Calculate Route" onclick="calcRoute();">
<button id= "toggle_traffic">Traffic</button>
<button id= "toggle_weather">Weather</button>
<button id= "toggle_transit">Transit</button>
    <body>
<br/>
</div>
<div style="margin:20px;border-width:2px;"><br>

</div>

</body>
</html>
