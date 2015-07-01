<!DOCTYPE html>
<html lang="en">
  <head>

      <script LANGUAGE="JavaScript">
          <!--



          n = (document.layers) ? 1:0
          ie = (document.all) ? 1:0

          function init() {
              slideoutActive = 0
              if (n) {
                  slideout1 = document.slideoutInterface.document.slideoutContent.document.slideoutContent1
                  slideout2 = document.slideoutInterface.document.slideoutContent.document.slideoutContent2
                  slideout3 = document.slideoutInterface.document.slideoutContent.document.slideoutContent3
                  slideout4 = document.slideoutInterface.document.slideoutContent.document.slideoutContent4
                  slideout5 = document.slideoutInterface.document.slideoutContent.document.slideoutContent5
              }

              if (ie) {
                  slideout1 = slideoutContent1.style
                  slideout2 = slideoutContent2.style
                  slideout3 = slideoutContent3.style
                  slideout4 = slideoutContent4.style
                  slideout5 = slideoutContent5.style
              }
              slideoutShown = slideout1
              slideoutShown.xpos = 0
              slideoutNew = "none"
              slideoutNew.xpos = -285
          }


          function slideout(which) {
              if (!slideoutActive && slideoutShown != which) {
                  slideoutActive = 1
                  slideoutNew = which
                  slideoutNew.xpos = -285
                  slideoutLeft()
              }
          }


          function slideoutLeft() {
              if (slideoutShown.xpos > -285) {
                  slideoutShown.xpos -= 15
                  slideoutShown.left = slideoutShown.xpos
                  setTimeout("slideoutLeft()",30)
              }
              else {
                  hide(slideoutShown)
                  show(slideoutNew)
                  setTimeout("slideoutRight()",50)
              }
          }


          function slideoutRight() {
              if (slideoutNew.xpos < 0) {
                  slideoutNew.xpos += 15
                  slideoutNew.left = slideoutNew.xpos
                  setTimeout("slideoutRight()",30)
              }
              else {
                  slideoutShown = slideoutNew
                  slideoutActive = 0  // stops the sequence
              }
          }


          function show(showobj) {
              if (n) showobj.visibility = "show"
              if (ie) showobj.visibility = "visible"
          }
          function hide(hideobj) {
              if (n) hideobj.visibility = "hide"
              if (ie) hideobj.visibility = "hidden"
          }

          //-->
      </script>


      <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

    <title>TAP Homepage</title>

    <!-- Bootstrap core CSS -->
    <link href="stylesheets/bootstrap.min.css" rel="stylesheet">
    <link href="stylesheets/align.css" rel="stylesheet">
      <!--slidershow-->

      <link href="stylesheets/js-image-slider.css" rel="stylesheet" type="text/css" />
      <script src="js/mcVideoPlugin.js" type="text/javascript"></script>
      <script src="js/js-image-slider.js" type="text/javascript"></script>
      <link href="generic.css" rel="stylesheet" type="text/css" />

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
        <h2>Travel Planner & Advisor</h2>
        <p>A travel planner and advisor to assist with all of your travel needs.
            Make your trip simple by letting us plan your day based on your dining, entertainment, and travel specifications .
            With TAP, your perfect vacay is just a click away.</p>
      </div>
    </div>
    <!-- slider
================================================== -->

    <div id="sliderFrame">
        <div id="slider">

            <a href="searchTab.jsp">
                <img src="img/tap2.jpg" alt="Let's start exploring! " />
            </a>
            <a href="accountPage.jsp">
                <img src="img/tap3.jpg" alt="Create a new account with us " />
            </a>
            <a href="Itineraries.jsp">
                <img src="img/tap5.jpg" alt="Start planning " />
                </a>

            <a href="Contact.jsp">
                <img src="img/tap4.jpg" alt="Let us know how you feel" />
            </a>

        </div>
    </div>


    <div class="container">

    <embed src="Refill.mp3" autostart="true" loop="true"
        width="2" height="0">
     </embed>

      <hr>

      <footer>
        <p>&copy; TAP 2014     |     CS 2340    |    Georgia Tech</p>
      </footer>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <script src="js/slider.js"></script>



    </head>


    </body>
</html>