package edu.gatech.TAP.controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;


@WebServlet(urlPatterns={
        "/list", // GET
        "/create", // POST
        "/delete/*" // DELETE
})
public class CreateAccountServlet extends HttpServlet {  // JDK 6 and above only
 
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

          conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tapdb", "myuser", "xxxx"); // <<== Check

         // Step 2: Create a "Statement" object inside the "Connection"
         stmt = conn.createStatement();
 
         // add account
         int passhash = request.getParameter("Password").hashCode();
         String sqlStatement = "insert into account values (" + "'" + request.getParameter("firstName") + "', '"
               + request.getParameter("lastName") + "', '" + request.getParameter("Email") +
                 "', '" + request.getParameter("Username") + "', '" + passhash + "')";


          String findDuplicate = "select * from account where username = '" + request.getParameter("Username") + "'";

          ResultSet isDuplicate = stmt.executeQuery(findDuplicate);
          String duplicateUser = null;
          if(isDuplicate.next()) {
              duplicateUser = isDuplicate.getString("username");
          }
          if(duplicateUser == null){
              int rset = stmt.executeUpdate(sqlStatement);// Send the query to the server
              response.sendRedirect("indexAccountCreated.jsp");
//              out.println("<html>");
//              out.println("<head>");
//              out.println("<title>TAP: Travel Advisor & Planner</title>");
//              out.println("<link rel=\"stylesheet\"; href=\"box.css\">");
//              out.println("</head>");
//
//              out.println("<body bgcolor=white>");
//
//              out.println("<table border=\"0\" cellpadding=\"10\" align=\"center\">");
//              out.println("<tr>");
//              out.println("<td align=center>");
//              out.println("<img src=\"tapIcon.jpg\">");
//              out.println("</td>");
//              out.println("<td style=\"text-align: center;\">");
//
//              out.println("<h2>Account Created!</h2>");
//              out.println("</td>");
//              out.println("</tr>");
//              out.println("</table>");
          } else {
              out.println("<html>");
              out.println("<head>");
              out.println("<title>TAP: Travel Advisor & Planner</title>");
              out.println("<link rel=\"stylesheet\"; href=\"box.css\">");
              out.println("</head>");

              out.println("<body bgcolor=white>");

              out.println("<table border=\"0\" cellpadding=\"10\" align=\"center\">");
              out.println("<tr>");
              out.println("<td align=center>");
              out.println("<img src=\"tapIcon.jpg\">");
              out.println("</td>");
              out.println("<td style=\"text-align: center;\">");

              out.println("<h2>User Account Already Exists Please Try Again.</h2>");
              out.println("</td>");
              out.println("</tr>");
              out.println("</table>");
          }
         //get new page
         RequestDispatcher dispatcher = 
                getServletContext().getRequestDispatcher("index.html");
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