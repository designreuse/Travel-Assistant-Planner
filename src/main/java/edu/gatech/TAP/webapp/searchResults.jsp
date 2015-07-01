<%@ page import="edu.gatech.TAP.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.Lang.*" %>

<html lang="en">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

    <title>TAP Homepage</title>

    <!-- Bootstrap core CSS -->
    <link href="stylesheets/bootstrap.min.css" rel="stylesheet">


  </head>


<body>

	<h1>Search Results</h1>

<% 	String id;
	String url;
	String ratingUrl;
	String phone;
	String imgUrl;
	String address;
	Result currentResult;	%>

<%	id="Yelp San Francisco";	//provide defaults to test
	url="http://www.yelp.com/biz/yelp-san-francisco";
	ratingUrl="http://s3-media1.fl.yelpcdn.com/photo/oqI01Sg8uNtCRH9qqII0cQ/ms.jpg";
	imgUrl="http://s3-media2.ak.yelpcdn.com/bphoto/7DIHu8a0AHhw-BffrDIxPA/ms.jpg";
	phone="+1-415-908-3801";
	address="140 New Montgomery St";	%>

<%	for (int i=0;i<10/*Results.size()*/;i++) {
		/*currentResult=Results.get(i); 
		id=currentResult.getId();
		url=currentResult.getUrl();
		ratingUrl=currentResult.getRatingUrl();
		phone=currentResult.getDisplay_Phone();
		imgUrl=currentResult.getImgUrl();
		address=currentResult.getAddress();*/%>
	<table>
		<tr>
			<td width="50" align="left">
				<img src="<%= imgUrl %>" width="50" height="50">
			</td>
			<td align="left">
				<a href="<%= url %>"><%= id %></a>
			</td>
			<td align="right">
				<img src="<%= ratingUrl %>" alt="Yelp rating">
			</td>
		</tr>
	</table>
	<table>
		<tr>
			<td><%= address %></td>
		</tr>
		<tr>
			<td><%= phone %></td>
		</tr>
	</table>
<%	}	%>

</body>
</html>