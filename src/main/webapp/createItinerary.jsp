<%@ page import="edu.gatech.TAP.controller.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.Lang.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">


    <title>TAP-Create Itinerary</title>

    <!-- Bootstrap core CSS -->
    <link href="stylesheets/bootstrap.min.css" rel="stylesheet">
    <link href="stylesheets/align.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="jumbotron.css" rel="stylesheet">


          <link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
          <script src="//code.jquery.com/jquery-1.10.2.js"></script>
          <script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
          <%--<link rel="stylesheet" href="/resources/demos/style.css">--%>

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
    </div>



    <div class="jumbotron">
      <div class="container">
        <h1>TAP</h1>
        <p>Where are you going to go?</p>
      </div>
    </div>

<div class="container">

<table>
<form method="GET" action="/TAP/loadItinerary">

  <fieldset>
    <legend>Name of Itinerary</legend>
    <input name="itineraryName" type="text" placeholder="My Itinerary">
  </fieldset><br>

  <fieldset>
    <legend>Central Location</legend>
    <input name="centralLocation" type="text" placeholder="350 Ferst Drive, Atlanta GA">
   </fieldset><br>

   <%--<input name="choice" type="hidden" value=<%=choice%>--%>

  <fieldset>
    <legend>How will you get there?</legend>
    <select name="transportation">
      <option value="0">Transportation</option>
      <option value="1">Car</option>
      <option value="2">Cycling</option>
      <option value="3">Walk</option>
      <option value="4">Public Transit</option>
    </select>
   </fieldset><br>

  <fieldset>
   <tr><td>&nbsp;</td><td><input type="submit" value="Create"></td></tr>
  </fieldset>

</form>

      <hr>

        <td align=center>
          <img src="tapIcon.jpg">
        </td>


      <footer>
        <p>&copy; TAP 2014     |     CS 2340    |    Georgia Tech</p>
      </footer>
</table>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>--%>
    <%--<script src="../../dist/js/bootstrap.min.js"></script>--%>
  </body>
</html>
