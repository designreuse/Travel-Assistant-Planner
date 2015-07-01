<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

    <title>LOGIN</title>

    <!-- Bootstrap core CSS -->
    <link href="stylesheets/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="jumbotron.css" rel="stylesheet">

</head>
<body>
<div class="jumbotron">
    <div class="container">
        <h1>TAP</h1>
        <h2>Travel Advisor & Planner</h2>
        <p>A travel advisor and planner to assist with all of your travel needs.
            Make your trip simple by letting us plan your day based on your dining, entertainment, and travel specifications .
            With TAP, your perfect vacay is just a click away.</p>
    </div>
</div>

<div class = "container">
<form method="POST" action="/TAP/home" name="aform" target="_top">
    <input type="hidden" name="action" value="login">
    <input type="hidden" name="hide" value="">
    <table class='center'>
        <fieldset>
            <legend>Login</legend>
            <span style="font-family: verdana,arial; color: red;">Error: Username or password is incorrect.</span>
            <tr><td>Username:</td><td><input type="text" name="login"></td></tr>
            <tr><td>Password:</td><td><input type="password" name="password"></td></tr>
            <tr><td>&nbsp;</td><td><input type="submit" value="Submit"></td></tr>
            <tr><td colspan=2>&nbsp;</td></tr>
            <tr><td colspan=2>Not member yet? Click <a href="/TAP/registration.html">here</a> to register.</td></tr>
        </fieldset>
    </table>
</form>
    </div>
<div class="container">
    <hr>

    <footer>
        <p>&copy; <a href="Contact.jsp"> Contact Us</a>  |   TAP 2014     |     CS 2340    |    Georgia Tech</p>
    </footer>
</div>
</body>
</html>
