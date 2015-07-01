<%@ page import="edu.gatech.TAP.controller.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.Lang.*" %>


<%  ArrayList<String> itineraryNames = (ArrayList<String>) request.getAttribute("itineraryNames");
    ArrayList<String> centralLocations = (ArrayList<String>) request.getAttribute("centralLocations");
    ArrayList<Integer> itineraryIDs = (ArrayList<Integer>) request.getAttribute("itineraryIDs"); %>

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
        <h1>Your Itineraries</h1>
        <p>Choose a trip</p>
    </div>
</div>

    <table>

    <%  String name;
        String centralLoc;
        int id;

        for(String names : itineraryNames){
            name = names;
            centralLoc = "";
            id = itineraryNames.indexOf(name) + 1;%>

        <tr>
            <td width="60" align="left"><%= name %></td>
            <td width="300" align="right"><%= centralLoc %></td>
            <td>
                <form method="GET" action="displayPlaces">
                    <input type="hidden" name="choice" value="2">
                    <input type="hidden" name="itineraryID" value=<%= id%>>
                    <input type="submit" value="View/Edit This Itinerary">
                </form>
            </td>
        </tr>
    <%  }   %>

    </table>

    <br>

    <a href="createItinerary.jsp">Create a New Itinerary</a></td>

</body>