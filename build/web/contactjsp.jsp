<%-- 
    Document   : contactjsp
    Created on : 29-Jun-2025, 2:08:14 pm
    Author     : Karthick Raja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String msg = "";
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://b5mkw3hz4pketjlxs9cp-mysql.services.clever-cloud.com:3306/b5mkw3hz4pketjlxs9cp", "ui60qawn0wknpbuj", "tg55JuZt1E9UayFF9Js7");

            String sql = "INSERT INTO contact_messages (name, email, message) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, message);

            int result = stmt.executeUpdate();
            if (result > 0) {
                msg = "success";
            } else {
                msg = "error";
            }

        } catch (Exception e) {
            e.printStackTrace();
            msg = "error";
        } finally {
            if (stmt != null) try { stmt.close(); } catch (Exception ignored) {}
            if (conn != null) try { conn.close(); } catch (Exception ignored) {}
        }
    }
    response.sendRedirect("contact.jsp?status=" + msg);
%>
