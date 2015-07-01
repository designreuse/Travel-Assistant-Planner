	//LoadItinerary.java
package edu.gatech.TAP.controller;

import java.io.*;
import java.sql.*;
import java.lang.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;


@WebServlet("/displayItinerary")
	public class displayItinerary extends HttpServlet {  // JDK 6 and above only

	   // The doGet() runs once per HTTP GET request to this servlet.
		@Override
		public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	      // Set the MIME type for the response message
			response.setContentType("text/html");
	      // Get a output writer to write the response message into the network socket
			PrintWriter out = response.getWriter();
            out.println("here");
			Connection conn = null;
			Statement stmt = null;
			PreparedStatement pstmt = null;

			try {
	         Class.forName("com.mysql.jdbc.Driver");//.newInstance();
	        // Step 1: Create a database "Connection" object
	         // For MySQL
	         conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tapdb", "myuser", "xxxx");// <<== Check
	         // Step 2: Create a "Statement" object inside the "Connection"
	         stmt = conn.createStatement();

         	out.println("here");
         	String username = "placeholder";
         	Cookie[] cookies = request.getCookies();
         	if(cookies != null){
         		for(Cookie cookie : cookies){
         			if(cookie.getName().equals("username"))username = cookie.getValue();
         		}
         	}
         	out.println("here");
        	String sqlStatement = "select * from itineraries where username = '" + username 
        	+ "' ORDER BY orderID";
        	pstmt = conn.prepareStatement(sqlStatement);
        	ResultSet result = pstmt.executeQuery();
        	ArrayList<String> itineraryNames = new ArrayList<String>();
        	ArrayList<String> centralLocations = new ArrayList<String>();
        	ArrayList<String> itineraryIDs = new ArrayList<String>();
        	while(result.next()){
        		itineraryNames.add(result.getString("itineraryName"));
        		centralLocations.add(result.getString("centralLocation"));
        		itineraryIDs.add(result.getString("itineraryID"));
        	}
        	request.setAttribute("itineraryNames", itineraryNames);
        	request.setAttribute("centralLocations", centralLocations);
        	request.setAttribute("itineraryIDs", itineraryIDs);
        	RequestDispatcher dispatcher = null;
        	dispatcher = getServletContext().getRequestDispatcher("/viewItineraries.jsp");
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