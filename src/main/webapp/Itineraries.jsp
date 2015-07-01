<%@ page import="edu.gatech.TAP.controller*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.Lang.*" %>

<!DOCTYPE html>
<html>
<!--<script src="js/register.js"/>-->
<head lang="en">
    <meta charset="UTF-8">
    <title>TAP</title>
    <link href="stylesheets/bootstrap.min.css" rel="stylesheet">


    <style type="text/css">
        #map {
            width: 500px;
            height: 400px;
            margin-top: 10px;
        }
    </style>
</head>

<body>
<%
      String fullName = null;
      Cookie[] cookies = request.getCookies();
      if(cookies !=null){
      for(Cookie cookie : cookies){
          if(cookie.getName().equals("fullname")) fullName = cookie.getValue();
      }
      }
      if(fullName == null) response.sendRedirect("index.jsp");
      %>

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
                <li><a href="LogoutServlet">Log Out</a></li>
            </ul>
        </div>
    </div>
</div>


<div class="jumbotron">
    <div class="container">
        <h1>Your Itineraries</h1>
        <p>Choose a trip</p>
    </div>
</div>

<%  String[][] itineraries = {
            {"0","lukericherson","Atlanta","350 ferst drive atlanta ga"},
            {"1","lukericherson","gwinnett","2895 shady woods circle lawrenceville ga"},
            {"2","lukericherson","UW","1218 NE campus parkway seattle wa"}
        };  %>

    <table>

    <%  String name;
        String centralLoc;

        for(int i=0;i<itineraries.length;i++){
        name = itineraries[i][2];
        centralLoc = itineraries[i][3];%>

        <tr>
            <td width="60" align="left"><%= itineraries[i][2] %></td>
            <td width="300" align="right"><%= itineraries[i][3] %></td>
            <td width="200" align="right"><a href="editItinerary.jsp">View/Edit This Itinerary</a></td>
        </tr>
    <%  }   %>

    </table>
    
    <br>

    <a href="createItinerary.jsp">Create a New Itinerary</a></td>

<table class='center'>

    <h1>My destinations:</h1>
    <form id="calculate-route" name="calculate-route" action="mapDirection.html" method="get">
        <label>Location 1: "3557 doris circle douglasville, ga 30135"</label>

        <br />

        <label>Location 2:"421 st marlow dr. lawrenceville, ga 30044"</label>
        <input type="submit"value="Get Direction to here" />
        <br />

        <label>Location 3:"4899 Chapel Hill rd douglasville, ga 30135"</label>
        <input type="submit"value="Get Direction to here" />
        <br />
        <label>Location 4: "120 North avenue nw atlanta, ga 30332"</label>
        <input type="submit"value="Get Direction to here" />
        <br />
        <label>Location 5: "120 North avenue nw atlanta, ga 30332"</label>
        <input type="submit"value="Get Direction to here" />
        <br />



    </form>
    <div id="map"></div>
    <p id="error"></p>
</table>
<div id = "map_canvas"></div>

</body>