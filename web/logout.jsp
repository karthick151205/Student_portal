<%-- 
    Document   : logout
    Created on : 28-Jun-2025, 6:48:16 pm
    Author     : Karthick Raja
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
    // Invalidate the session
    session.invalidate();

    // Redirect to login page
    response.sendRedirect("login_form.jsp");
%>

