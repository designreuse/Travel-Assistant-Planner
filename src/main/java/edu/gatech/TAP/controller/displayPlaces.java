	//LoadItinerary.java
package edu.gatech.TAP.controller;

import java.io.*;
import java.sql.*;
import java.lang.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;


@WebServlet(urlPatterns={
	"/displayPlaces", 
})
	public class displayPlaces extends HttpServlet {  // JDK 6 and above only

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
	         conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tapdb", "myuser", "xxxx");  // <<== Check
	         // Step 2: Create a "Statement" object inside the "Connection"
	         stmt = conn.createStatement();

         	String username = "placeholder";
            String itineraryString = "placeholder";
            Cookie[] cookies = request.getCookies();
         	if(cookies != null){
         		for(Cookie cookie : cookies){
         			if(cookie.getName().equals("username"))username = cookie.getValue();
                    if(cookie.getName().equals("itineraryID")) itineraryString = cookie.getValue();

         		}
         	}

            int itineraryID;
            if(request.getParameterMap().containsKey("itineraryID")){
                itineraryID = Integer.parseInt(request.getParameter("itineraryID"));
                Cookie itineraryCookie = new Cookie("itineraryID", Integer.toString(itineraryID));
                response.addCookie(itineraryCookie);
            } else {
                itineraryID = Integer.parseInt(itineraryString);
            }
        	//int itineraryID = 1;
            String sqlStatement = "select * from places where itineraryID = "
        	+ itineraryID + " ORDER BY orderID";
        	ResultSet rset = stmt.executeQuery(sqlStatement);
        	ArrayList<String> id = new ArrayList<String>();
        	ArrayList<String> url = new ArrayList<String>();
        	ArrayList<String> ratingUrl = new ArrayList<String>();
        	ArrayList<String> phone = new ArrayList<String>();
        	ArrayList<String> imgUrl = new ArrayList<String>();
        	ArrayList<String> address = new ArrayList<String>();
        	ArrayList<String> placeID = new ArrayList<String>();
        	while(rset.next()){
        		id.add(rset.getString("id"));
        		url.add(rset.getString("url"));
        		ratingUrl.add(rset.getString("ratingUrl"));
        		phone.add(rset.getString("phone"));
        		imgUrl.add(rset.getString("imgUrl"));
        		address.add(rset.getString("address"));
        		placeID.add(rset.getString("placeID"));
        	}
        	request.setAttribute("id",id);
        	request.setAttribute("url",url);
        	request.setAttribute("ratingUrl",ratingUrl);
        	request.setAttribute("phone",phone);
        	request.setAttribute("imgUrl",imgUrl);
        	request.setAttribute("address",address);
        	request.setAttribute("placeID", placeID);

            String itineraryName = "Itinerary";
            String centralLocation = "Location";
            sqlStatement = "select * from itineraries where itineraryID = " 
            + itineraryID;
            rset = stmt.executeQuery(sqlStatement);
            while(rset.next()){
                itineraryName = rset.getString("itineraryName");
                centralLocation = rset.getString("centralLocation");
            }
            request.setAttribute("itineraryName", itineraryName);
            request.setAttribute("centralLocation", centralLocation);
        	

            //response.sendRedirect("editItinerary.jsp");
        	RequestDispatcher dispatcher =
        	getServletContext().getRequestDispatcher("/editItinerary.jsp");
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