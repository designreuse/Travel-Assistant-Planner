package edu.gatech.TAP.controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;


@WebServlet(urlPatterns={
	"/updateItinerary", 
})
public class SaveItinerary extends HttpServlet {  // JDK 6 and above only

   	// The doGet() runs once per HTTP GET request to this servlet.
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	  	// Set the MIME type for the response message
		response.setContentType("text/html");
	  	// Get a output writer to write the response message into the network socket
		PrintWriter out = response.getWriter(); 
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");//.newInstance();
			// Step 1: Create a database "Connection" object
			// For MySQL
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tapdb", "myuser", "xxxx");  // <<== Check
			// Step 2: Create a "Statement" object inside the "Connection"
			stmt = conn.createStatement();
			String choice = (String)request.getAttribute("choice");
			//add place
			if(choice.equals("1")){
//			 	int itineraryID = (int)request.getAttribute("itineraryID");
			 	String id = (String)request.getAttribute("id");
			 	String url = (String)request.getAttribute("url");
			 	String ratingUrl = (String)request.getAttribute("ratingUrl");
			 	String phone = (String)request.getAttribute("phone");
			 	String imgUrl = (String)request.getAttribute("imgUrl");
			 	String address = (String)request.getAttribute("address");
			 	String orderID = (String)request.getAttribute("orderID");
				// the order of itinerary and the next itineraryNumber orderID
				// add account
//			 	String sqlStatement = "insert into places values (" + "'" + itineraryID + "', " + id + "', '" + url +
//			 		"', '" + ratingUrl + "', '" + phone + "', '" + imgUrl + "', '" + address + "', '" + orderID + "')";

//				int rset = stmt.executeUpdate(sqlStatement);// Send the query to the server
			}
			//remove place
			else{
//				int itineraryID = (int)request.getAttribute("itineraryID");
//				int placeID = (int)request.getAttribute("placeID");
//				String sqlStatement = "delete from places where itineraryID = '" + itineraryID + "'and placeID = '" + placeID + "'";
//				int rset = stmt.executeUpdate(sqlStatement);
			}
			//pop-up "place added to itinerary"
			//redirect to different page

			//get new page
	        RequestDispatcher dispatcher =
	        	getServletContext().getRequestDispatcher("/editItineraries.jsp");
	        dispatcher.forward(request,response);

		} catch (SQLException ex) {
			ex.printStackTrace();
			out.println(ex);
		} catch (Exception cex) { //ClassNotFoundException
			cex.printStackTrace();
		} finally {
			out.close();
			try {
				// Step 5: Close the Statement and Connection
			  	if (stmt != null) stmt.close();
			  	if (conn != null) conn.close();
			} catch (SQLException ex) {
			  	ex.printStackTrace();
			}
		}
	}
}