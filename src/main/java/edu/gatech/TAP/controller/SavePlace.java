package edu.gatech.TAP.controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;


@WebServlet(urlPatterns={
	"/savePlace", 
})
public class SavePlace extends HttpServlet {  // JDK 6 and above only

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
		PreparedStatement pstmt = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");//.newInstance();
			// Step 1: Create a database "Connection" object
			// For MySQL
	        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tapdb", "myuser", "xxxx");  // <<== Check;
			// Step 2: Create a "Statement" object inside the "Connection"
			stmt = conn.createStatement();
			String choice = (String)request.getAttribute("choice");
			//add place
         	String username = "placeholder";
            String itineraryString = "placeholder";
         	Cookie[] cookies = request.getCookies();
         	if(cookies != null){
         		for(Cookie cookie : cookies){
         			if(cookie.getName().equals("username")) username = cookie.getValue();
                    if(cookie.getName().equals("itineraryID")) itineraryString = cookie.getValue();
         		}
         	}


		 	int itineraryID = Integer.parseInt(itineraryString);
         	String sqlStatement = "select MAX(orderID) AS orderID from places where itineraryID = " 
         			+ itineraryID;
            out.println("after sql Statement");
         	pstmt = conn.prepareStatement(sqlStatement);
			out.println(sqlStatement);
         	ResultSet set = pstmt.executeQuery();
         	out.println("here");
         	int orderID = 0;
         	if(set.next()){
         		out.println("here2");
         		if(set.getString("orderID")!=null){
         			orderID = Integer.parseInt(set.getString("orderID"));
         		}
         	}



         	sqlStatement = "select MAX(placeID) AS placeID from places";
         	pstmt = conn.prepareStatement(sqlStatement);
			out.println(sqlStatement);
         	set = pstmt.executeQuery();
         	out.println("here");
         	int placeID = 0;
         	if(set.next()){
         		out.println("here2");
         		if(set.getString("placeID")!=null){
         			placeID = Integer.parseInt(set.getString("placeID")) + 1;
         		}
         	}


		 	// Result place = (Result)request.getAttribute("place");
		 	String id = (String)request.getParameter("id");
		 	String phone = (String)request.getParameter("phone");
		 	String address = (String)request.getParameter("address");
		 	String url = (String)request.getParameter("url");
		 	String imgUrl = (String)request.getParameter("imgUrl");
		 	String ratingUrl = (String)request.getParameter("ratingUrl");
		 	out.println(id);
		 	sqlStatement = "insert into places values (" + "'" + itineraryID + "', '" + id + "', '" + url +
		 		"', '" + ratingUrl + "', '" + phone + "', '" + imgUrl + "', '" + address + 
		 		"', '" + (orderID + 1) + "', '" + placeID +"')";

			int rset = stmt.executeUpdate(sqlStatement);// Send the query to the server
			
			//redirect to different page

			//get new page
	        RequestDispatcher dispatcher =
	        	getServletContext().getRequestDispatcher("/displayPlaces");
	        dispatcher.forward(request,response);

		} catch (SQLException ex) {
			ex.printStackTrace();
			out.println(ex);
		} catch (Exception cex) { //ClassNotFoundException
			cex.printStackTrace();
            out.println(cex);
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