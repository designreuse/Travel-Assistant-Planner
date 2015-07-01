<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">


    <title>TAP-Add Event</title>

    <!-- Bootstrap core CSS -->
    <link href="stylesheets/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="jumbotron.css" rel="stylesheet">


          <link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
          <script src="//code.jquery.com/jquery-1.10.2.js"></script>
          <script src="//code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
          <%--<link rel="stylesheet" href="/resources/demos/style.css">--%>
          <script>
              $(function() {
                  $( "#datepicker" ).datepicker();
              });
          </script>



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
        <p><%=fullName %>, what would you like to do?</p>
      </div>
    </div>

<div class="container">

<table>
<form method="GET" action="/TAP/search">

  <fieldset>
    <legend>Location</legend>
    <input type="text" value="" placeholder="Atlanta" name="location">
  </fieldset><br>


   <fieldset>
      <legend>Preferences</legend>
      <input type="text" value="" placeholder="Tacos" name="term">
    </fieldset><br>

  <fieldset>
    <legend>Ratings</legend>
    <select name = "rating">
      <option value="Ratings">Yelp Rating</option>
      <option value="1">*</option>
      <option value="2">**</option>
      <option value="3">***</option>
      <option value="4">****</option>
      <option value="5">*****</option>
    </select>
  </fieldset><br>


  <fieldset>
    <legend>Choose a Date</legend>
     <input type="text" id="datepicker">
     <br>

  <fieldset>
    <legend>What Time?</legend>
      <select>
        <option value="Hour">Hr</option>
        <option value="hour">1</option>
        <option value="hour">2</option>
        <option value="hour">3</option>
        <option value="hour">4</option>
        <option value="hour">5</option>
        <option value="hour">6</option>
        <option value="hour">7</option>
        <option value="hour">8</option>
        <option value="hour">9</option>
        <option value="hour">10</option>
        <option value="hour">11</option>
        <option value="hour">12</option>
      </select>

      <select>
      <option value="Minute">Min</option>
      <option value="minute">00</option>
      <option value="minute">01</option>
      <option value="minute">02</option>
      <option value="minute">03</option>
      <option value="minute">04</option>
      <option value="minute">05</option>
      <option value="minute">06</option>
      <option value="minute">07</option>
      <option value="minute">08</option>
      <option value="minute">09</option>
      <option value="minute">10</option>
      <option value="minute">11</option>
      <option value="minute">12</option>
      <option value="minute">13</option>
      <option value="minute">14</option>
      <option value="minute">15</option>
      <option value="minute">16</option>
      <option value="minute">17</option>
      <option value="minute">18</option>
      <option value="minute">19</option>
      <option value="minute">20</option>
      <option value="minute">21</option>
      <option value="minute">22</option>
      <option value="minute">23</option>
      <option value="minute">24</option>
      <option value="minute">25</option>
      <option value="minute">26</option>
      <option value="minute">27</option>
      <option value="minute">28</option>
      <option value="minute">29</option>
      <option value="minute">30</option>
      <option value="minute">31</option>
      <option value="minute">32</option>
      <option value="minute">33</option>
      <option value="minute">34</option>
      <option value="minute">35</option>
      <option value="minute">36</option>
      <option value="minute">37</option>
      <option value="minute">38</option>
      <option value="minute">39</option>
      <option value="minute">40</option>
      <option value="minute">41</option>
      <option value="minute">42</option>
      <option value="minute">43</option>
      <option value="minute">44</option>
      <option value="minute">45</option>
      <option value="minute">46</option>
      <option value="minute">47</option>
      <option value="minute">48</option>
      <option value="minute">49</option>
      <option value="minute">50</option>
      <option value="minute">51</option>
      <option value="minute">52</option>
      <option value="minute">53</option>
      <option value="minute">54</option>
      <option value="minute">55</option>
      <option value="minute">56</option>
      <option value="minute">57</option>
      <option value="minute">58</option>
      <option value="minute">59</option>
      <option value="minute">60</option>
      </select>

      <select>
        <option value="TOD">AM/PM</option>
        <option value="tod">am</option>
        <option value="tod">pm</option>
      </select>
  </fieldset><br>

  <fieldset>
   <tr><td>&nbsp;</td><td><input type="submit" value="Submit"></td></tr>
  </fieldset>

</form>

</table>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <%--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>--%>
    <%--<script src="../../dist/js/bootstrap.min.js"></script>--%>

    <footer>
        <br>
        <br>

        <p><Images src="tapIcon.jpg">     &copy; TAP 2014     |     CS 2340    |    Georgia Tech</p>
    </footer>
  </body>
</html>
