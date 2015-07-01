<!DOCTYPE html>
<html>
<!--<script src="js/register.js"/>-->
<head lang="en">
    <meta charset="UTF-8">
    <title>TAP</title>
    <link href="stylesheets/bootstrap.min.css" rel="stylesheet">
    <link href="stylesheets/align.css" rel="stylesheet">
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
            <ul class="nav navbar-nav navbar-left">
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
        <h1>Contact Us</h1>
        <p>Let us know what you think :)</p>
    </div>
</div>
        <h2>Want more specific info about the Website?</h2>
        <h3>Click Here to MEET our Developers</h3>
        <li><a href="meetDevelopers.html">the.TEAM</a></li>
<div align="center">
<form >
    <input type="hidden" name="action" value="submit">
   <br> Your name:
    <input name="name" type="text" value="" size="30"/><br>
   <br> Your email:
    <input name="email" type="text" value="" size="30"/><br>
   <br> Comments <br>
    <textarea name="message" rows="7" cols="30"></textarea><br>
    <input type="submit" value="Send email"/>
</form>
</div>
</body>