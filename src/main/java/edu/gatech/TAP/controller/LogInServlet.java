package edu.gatech.TAP.controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;


@WebServlet(urlPatterns={
        "/home", // GET
})
public class LogInServlet extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { //edited

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        Connection conn = null;
        Statement stmt = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");//.newInstance();

            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tapdb", "myuser", "xxxx");  // <<== Check

            stmt = conn.createStatement();

            String typedUsername = request.getParameter("login");
            String typedPassword = request.getParameter("password");
            int passhash = typedPassword.hashCode();
            int dbPassword = 0;
            String fullName = null;
            String dbString = "select * from account where username = '" + typedUsername + "'";

            ResultSet rset = stmt.executeQuery(dbString);
            if (rset.next()) {
                dbPassword = rset.getInt("password");
                fullName = rset.getString("firstName") + " " + rset.getString("lastName");
            } else {
                response.sendRedirect("indexError.jsp");
            }


            if (dbPassword == passhash) {
                Cookie loginCookie = new Cookie("username",typedUsername); //New
                Cookie nameCookie = new Cookie("fullname", fullName);

                //setting cookie to expiry in 30 mins
                loginCookie.setMaxAge(30*60); //New
                response.addCookie(loginCookie);
                response.addCookie(nameCookie);//New
                response.sendRedirect("home.jsp"); //New
            } else {
                response.sendRedirect("indexError.jsp");
            }


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