<%@ page import="edu.gatech.TAP.controller.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.Lang.*" %>

<% ArrayList<Result> searchResult =
   (ArrayList<Result>) request.getAttribute("searchResult"); %>

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
	String address; %>

<%	id="Yelp San Francisco";	//set default
	url="http://www.yelp.com/biz/yelp-san-francisco";
	ratingUrl="http://s3-media1.fl.yelpcdn.com/photo/oqI01Sg8uNtCRH9qqII0cQ/ms.jpg";
	imgUrl="http://s3-media2.ak.yelpcdn.com/bphoto/7DIHu8a0AHhw-BffrDIxPA/ms.jpg";
	phone="+1-415-908-3801";
	address="140 New Montgomery St";	%>

	<% 	if(searchResult.size() == 0){
			out.println("no results found");
		}
		for(Result result : searchResult){
	        id = result.getName();
	        phone = result.getDisplay_phone();
	        address = result.getAddress();
	        url = result.getUrl();
	        imgUrl = result.getImgUrl();
	        ratingUrl = result.getRating_img_url();
    %>
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
			<td>
				<form method="GET" action="savePlace">
					<input name="id" type="hidden" value="<%=id%>">
					<input name="phone" type="hidden" value="<%=phone%>">
					<input name="address" type="hidden" value="<%=address%>">
					<input name="url" type="hidden" value="<%=url%>">
					<input name="imgUrl" type="hidden" value="<%=imgUrl%>">
					<input name="ratingUrl" type="hidden" value="<%=ratingUrl%>">
					<input type="submit" value="Add to Itinerary">
				</form>
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