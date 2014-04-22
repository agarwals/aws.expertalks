package com.equalexperts.aws;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

/**
 * Book a new ticket by visiting a URL of the form
 * http://ysrtc.co.in:8080/ysrtc/bookTicket?bookedBy=abc
 */

public class BookTicketsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws ServletException, IOException {

        String bookedByValue = (httpServletRequest.getParameter("bookedBy") == null) ? "anonymous" : httpServletRequest.getParameter("bookedBy");
        int ticketBooked = -1;

        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;
        
        //NOTE THAT "mysqldb" should resolve to the database host
        String url = "jdbc:mysql://mysqldb/ysrtc?user=ysrtc&password=ysrtc";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(url);
            statement = connection.createStatement(ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE);
            String bookTicketSql = "insert into tickets(`booked_by`) values (\"" + bookedByValue + "\")";

            statement.executeUpdate(bookTicketSql, Statement.RETURN_GENERATED_KEYS);
            rs = statement.getGeneratedKeys();
            if (rs.next()) {
                ticketBooked = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        httpServletResponse.getWriter().print(ticketBooked);
    }
}