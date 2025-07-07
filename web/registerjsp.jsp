<%-- 
    Document   : registerjsp.jsp
    Created on : 28-Jun-2025, 11:54:21 am
    Author     : Karthick Raja
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String email = request.getParameter("email");
String password = request.getParameter("password");
String cpassword = request.getParameter("cpassword");
String gender = request.getParameter("gender");

if (!password.equals(cpassword)) {
    out.println("<h3 style='color:red;'>Passwords do not match!</h3>");
    out.println("<a href='register_form.jsp'>Go back to register</a>");
    return;
}

Connection conn = null;
PreparedStatement pstmt = null;

try {
    String url = "jdbc:mysql://b5mkw3hz4pketjlxs9cp-mysql.services.clever-cloud.com:3306/b5mkw3hz4pketjlxs9cp";
    String user = "ui60qawn0wknpbuj"; 
    String pass = "tg55JuZt1E9UayFF9Js7"; 

    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, pass);

    String sql = "INSERT INTO users (username, password, fname, lname, gender) VALUES (?, ?, ?, ?, ?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, email); 
    pstmt.setString(2, password); 
    pstmt.setString(3, fname);
    pstmt.setString(4, lname);
    pstmt.setString(5, gender);

    int rows = pstmt.executeUpdate();

    if (rows > 0) {
        response.sendRedirect("login_form.jsp");
    } else {
        out.println("<h3 style='color:red;'>Registration failed. Please try again.</h3>");
    }

} catch (Exception e) {
    e.printStackTrace();
    out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
} finally {
    if (pstmt != null) pstmt.close();
    if (conn != null) conn.close();
}
%>

