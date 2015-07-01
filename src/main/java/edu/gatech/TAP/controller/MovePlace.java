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
    "/MovePlace", 
})
    public class MovePlace extends HttpServlet {  // JDK 6 and above only

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


            int itineraryID = 1;
            String username = "placeholder";
            Cookie[] cookies = request.getCookies();
            if(cookies != null){
                for(Cookie cookie : cookies){
                    if(cookie.getName().equals("username")){username = cookie.getValue();}
                    if(cookie.getName().equals("itineraryID")){itineraryID = Integer.parseInt(cookie.getValue());}        //Make sure this works!!!
                }
            }

            String sqlStatement;
            ResultSet rset;
            int iset;

            if(Integer.parseInt(request.getParameter("action"))>0){    //Move Up

                sqlStatement = "select placeID from places where itineraryID = " + 
                    itineraryID + " order by orderID DESC";
                rset = stmt.executeQuery(sqlStatement);
                rset.last();
                
                if(rset.getInt("placeID") != Integer.parseInt(request.getParameter("placeID"))){    //check to make sure item isn't already last

                    sqlStatement = "select * from places ORDER by orderID DESC";
                    rset = stmt.executeQuery(sqlStatement);
                    rset.next();
                    while(rset.getInt("placeID")!=Integer.parseInt(request.getParameter("placeID"))){
                        rset.next();
                    }
                    int oldOrderID = rset.getInt("orderID");    //get the current/old orderID

                    rset.next();
                    int newOrderID = rset.getInt("orderID");
                    int otherPlaceID = rset.getInt("placeID");  //get the placeID of the place to be swapped with

                    sqlStatement = "update places set orderID = " + newOrderID + 
                        " where placeID = " + request.getParameter("placeID");
                    iset = stmt.executeUpdate(sqlStatement);     //move down 1 orderID

                    sqlStatement = "update places set orderID = " + oldOrderID +
                        " where placeID = " + otherPlaceID ;
                    iset = stmt.executeUpdate(sqlStatement);     //move other place up 1 orderID
                }

            } else if(Integer.parseInt(request.getParameter("action"))<0){        //Move Down

                sqlStatement = "select placeID from places where itineraryID = " + 
                    itineraryID + " order by orderID";
                rset = stmt.executeQuery(sqlStatement);
                rset.last();
                
                if(rset.getInt("placeID") != Integer.parseInt(request.getParameter("placeID"))){    //check to make sure item isn't already last

                    sqlStatement = "select * from places ORDER by orderID";
                    rset = stmt.executeQuery(sqlStatement);
                    rset.next();
                    while(rset.getInt("placeID")!=Integer.parseInt(request.getParameter("placeID"))){
                        rset.next();
                    }
                    int oldOrderID = rset.getInt("orderID");    //get the current/old orderID

                    rset.next();
                    int newOrderID = rset.getInt("orderID");
                    int otherPlaceID = rset.getInt("placeID");  //get the placeID of the place to be swapped with

                    sqlStatement = "update places set orderID = " + newOrderID + 
                        " where placeID = " + request.getParameter("placeID");
                    iset = stmt.executeUpdate(sqlStatement);     //move down 1 orderID

                    sqlStatement = "update places set orderID = " + oldOrderID +
                        " where placeID = " + otherPlaceID ;
                    iset = stmt.executeUpdate(sqlStatement);     //move other place up 1 orderID
                }

            }
            else{ //remove
                sqlStatement = "delete from places where placeID = " + Integer.parseInt(request.getParameter("placeID"));
                iset = stmt.executeUpdate(sqlStatement);     //move other place up 1 orderID
            }


            //displayPlaces is below -> rebuilds edit itinerary page

            sqlStatement = "select * from places where itineraryID = " 
            + itineraryID + " ORDER BY orderID";
            rset = stmt.executeQuery(sqlStatement);
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