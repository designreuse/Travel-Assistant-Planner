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
            <p>Account Management Page</p>
        </div>
    </div>

<div id = "boxStyle">
    <div style="text-align: center;">
        <div id = "boxSize" >
            <div id = "border">
                <p style="font-family: verdana,arial; color: green;"><b>Account Successfully Updated.</b></p>
                <span style="font-family: verdana,arial; color: #D4D4D4; font-size: 1.00em; font-weight:bold;">My account information</span>
                <div id = "pad">

                    <style type="text/css" scoped>


                    </style>

                    <form method="GET" action="http://localhost:8080/TAP/update" name="aform" target="_top">
                        <input type="hidden" name="action" value="login">
                        <input type="hidden" name="hide" value="">
                        <table align='center'>

                            <tr><td>Your First Name:</td><td><input type="text" name="firstName" placeholder="Sallie"></td></tr>
                            <tr><td>Your Last Name:</td><td><input type="text" name="lastName" placeholder="Mae"></td></tr>
                            <tr><td>Email Address:</td><td><input type="email" name="Email" placeholder="sallie.mae@gmail.com"></td></tr>
<!--                            <tr><td>Username:</td><td><input type="text" name="oldUsername"placeholder="sallie101"></td> -->
                            <tr><td>New Username:</td><td><input type="text" name="newUsername"></td>
<!--                            <tr><td>Old Password:</td><td><input type="password" name="oldPassword"></td></tr>  -->
                            <tr><td>New Password:</td><td><input type="password" name="newPassword"></td></tr>
<!--                            <tr><td>Confirm New Password:</td><td><input type="password" name="confirmPassword"></td></tr> -->


                            <tr><td>&nbsp;</td><td><input align = "center" type="submit" value="Update"></td></tr>
                            <tr><td colspan=2>&nbsp;</td></tr>

                        </table>
                     </form>
                </div></div></div></div></div>

<p>
    <a href="home.jsp">Go to Homepage</a> Start planning a trip today
</p>

</body>
</html>