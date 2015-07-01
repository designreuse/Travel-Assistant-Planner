<%@ page import="edu.gatech.TAP.controller.*" %>

<%@ page import="java.util.*" %>
<%@ page import="java.Lang.*" %>


<%  ArrayList<String> ids = (ArrayList<String>) request.getAttribute("id");
    ArrayList<String> urls = (ArrayList<String>) request.getAttribute("url");
    ArrayList<String> ratingUrls = (ArrayList<String>) request.getAttribute("ratingUrl");
    ArrayList<String> phones = (ArrayList<String>) request.getAttribute("phone");
    ArrayList<String> imgUrls = (ArrayList<String>) request.getAttribute("imgUrl");
    ArrayList<String> addresses = (ArrayList<String>) request.getAttribute("address");
    ArrayList<String> placeIDs = (ArrayList<String>) request.getAttribute("placeID"); 
%>

<%  String aId;
    String aUrl;
    String aRatingUrl;
    String aPhone;
    String aImgUrl;
    String aAddress;
    String aPlaceID;    %>

<!DOCTYPE html>
<html>
<!--<script src="js/register.js"/>-->
<head lang="en">
    <meta charset="UTF-8">
    <title>TAP</title>
    <link href="stylesheets/bootstrap.min.css" rel="stylesheet">
    <link href="stylesheets/align.css" rel="stylesheet">


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
                <p>
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

<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>

<table>

    <%  if(ids.size() == 0){    %>
            <p>There are no places in this itinerary.</p>
    <%  } else {
            for(int i=0;i<ids.size();i++){
                aId = ids.get(i);
                aUrl = urls.get(i);
                aRatingUrl = ratingUrls.get(i);
                aPhone = phones.get(i);
                aImgUrl = imgUrls.get(i);
                aAddress = addresses.get(i);
                aPlaceID = placeIDs.get(i); %>

                <table>
                    <tr>
                        <td></td>
                        <td>
                            <a href="<%= aUrl %>"><%= aId %></a>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td rowspan="3" width="100" align="center">
                            <img src="<%= aImgUrl %>" width="50" height="50">
                        </td>
                        <td width="350">
                            <%= aAddress %>
                        </td>
                        <td align="right">
                            <img src="<%= aRatingUrl %>" alt="Yelp rating">
                        </td>
                        <td>
                            <form method="GET" action="/TAP/MovePlace">
                                <input name="placeID" type="hidden" value="<%= aPlaceID %>">
                                <input name="action" type="hidden" value=1>
                                <input type="submit" value="Move Up">
                            </form>
                        </td>
                        <td>
                            <form method="GET" action="/TAP/MovePlace">
                                <input name="placeID" type="hidden" value="<%= aPlaceID %>">
                                <input name="action" type="hidden" value=-1>
                                <input type="submit" value="Move Down">
                            </form>
                        </td>
                        <td>
                            <form method="GET" action="/TAP/MovePlace">
                                <input name="placeID" type="hidden" value="<%= aPlaceID %>">
                                <input name="action" type="hidden" value=0>
                                <input type="submit" value="Remove">
                            </form>
                        </td>
                        <td>
                            <a href="https://twitter.com/share?url=/" class="twitter-share-button" data-text="Heading to <%= aId %>! Who wants to come?">Tweet</a>
                        </td>

                     <tr>
                        <td>
                            <%= aPhone %>
                        </td>
                        <td></td>
                     </tr>
                </table>
                <p></p>
                <hr>
        <%  }
       }   %>

        <tr align="center">
            <td align="center">
                <a href="/TAP/searchTab.jsp">Add another place</a>
            </td>
        </tr>

        <form method="GET" action="/TAP/GetMaps">
            <input type="submit" value="Get Directions">
            <input name= "addresses" type="hidden" value="<%= addresses%>">
        </form>

</table>

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
