package edu.gatech.TAP.controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;


@WebServlet(urlPatterns={
        "/update", // GET
})
public class AccountUpdateServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();
        Connection conn = null;
        Statement stmt = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");//.newInstance();

            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tapdb", "myuser", "xxxx");  // <<== Check

            stmt = conn.createStatement();

            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("Email");
//            String oldUsername = request.getParameter("oldUsername");
            String newUsername = request.getParameter("newUsername");
//            String oldPassword = request.getParameter("oldPassword");
            String newPassword = request.getParameter("newPassword");
            int passhash = newPassword.hashCode();
//            int passhash = request.getParameter("Password").hashCode();
//            String typedPassword = request.getParameter("confirmPassword");


            if(newUsername != "") {
                String dbUsernameUpdate = "update account set username='" + newUsername + "' where firstname='" + firstName +
                        "' and lastname='" + lastName + "'";
                int rset = stmt.executeUpdate(dbUsernameUpdate);
            }


            if(passhash != 0) {
                String dbPwdUpdate = "update account set Password=" + passhash + " where firstName='" + firstName +
                        "' and lastName='" + lastName + "'";
                int dummy = stmt.executeUpdate(dbPwdUpdate);
            }

            response.sendRedirect("accountPageUpdated.jsp");


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