//LoadItinerary.java
package edu.gatech.TAP.controller;

import java.io.*;
import java.sql.*;
import java.lang.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


@WebServlet(urlPatterns={
        "/GetMaps",
})
public class GetMaps extends HttpServlet {  // JDK 6 and above only

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
            PreparedStatement centralLocQuery = null;
			try {
	         Class.forName("com.mysql.jdbc.Driver");//.newInstance();
	        // Step 1: Create a database "Connection" object
	         // For MySQL
	         conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tapdb", "myuser", "xxxx");  // <<== Check
	         // Step 2: Create a "Statement" object inside the "Connection"
	         stmt = conn.createStatement();
         	//String itineraryID = (String) request.getAttribute();
         	//String username = (String) request.getAttribute();

         	int itineraryID = 0;
            String centralLocation;
         	Cookie[] cookies = request.getCookies();
         	if(cookies != null){
         		for(Cookie cookie : cookies){
         			if(cookie.getName().equals("itineraryID"))itineraryID = Integer.parseInt(cookie.getValue());
         		}
         	}

            /* trying to add central location to result */
            // assuming cookies works, my next sqlStatement would be :
            String sqlStatementCentralLocation = "select centralLocation from itineraries where itineraryID = " + itineraryID;
            centralLocQuery = conn.prepareStatement(sqlStatementCentralLocation);
            ResultSet result2 = centralLocQuery.executeQuery();
            if(result2.next()){
                request.setAttribute("centralLocation", result2.getString("centralLocation"));
            }



        	String sqlStatement = "select address from places where itineraryID = " + itineraryID;
//            request.setAttribute("itineraryID", itineraryID);
        	pstmt = conn.prepareStatement(sqlStatement);
        	ResultSet result = pstmt.executeQuery();
        	ArrayList<String> address = new ArrayList<String>();
                JSONArray jsonAraay = new JSONArray(); // use json array because js can read it as an array
        	while(result.next()){
        		address.add(result.getString("address"));
        		jsonAraay.add(result.getString("address"));

        	}
                request.setAttribute("addressJson", jsonAraay);
                request.setAttribute("address", address);

        	RequestDispatcher dispatcher = null;
        	dispatcher = getServletContext().getRequestDispatcher("/mapDirections.jsp");
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
