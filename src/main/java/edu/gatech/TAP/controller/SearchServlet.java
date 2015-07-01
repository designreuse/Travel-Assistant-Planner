package edu.gatech.TAP.controller;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;

import java.util.ArrayList;

@WebServlet(urlPatterns={
        "/search", // GET
})
public class SearchServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        String term = request.getParameter("term");
        String location = request.getParameter("location");
        String price = request.getParameter("price"); 
        String distance = request.getParameter("distance"); 
        String rating = request.getParameter("rating");

        ArrayList<Result> searchResult = YelpAPI.getResults(term, location, distance, rating);

        request.setAttribute("searchResult", searchResult);

        RequestDispatcher dispatcher =
                getServletContext().getRequestDispatcher("/SearchResults.jsp");
        dispatcher.forward(request,response);
        
       

    }
}