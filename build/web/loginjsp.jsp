<%-- 
    Document   : loginjsp.jsp
    Created on : 28-Jun-2025, 12:26:18 pm
    Author     : Karthick Raja
--%>

<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%
String username = request.getParameter("un");
String password = request.getParameter("pw");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    String url = "jdbc:mysql://localhost:3306/student_report?useSSL=false";
    String dbUser = "root";
    String dbPass = "karthi";

    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, dbUser, dbPass);

    // ✅ Get user id and role
    String sql = "SELECT id, role FROM users WHERE username = ? AND password = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, username);
    pstmt.setString(2, password);

    rs = pstmt.executeQuery();

    if (rs.next()) {
    int userId = rs.getInt("id");
    String role = rs.getString("role");  // ✅ Now role is declared properly

    session.setAttribute("user_id", userId);
    session.setAttribute("username", username);
    session.setAttribute("role", role);  // ✅ This now works

    response.sendRedirect("homepage.jsp");
} else {
return confirm("Invalid username or password.");
%>
        <h3 style="color: red; text-align: center;">Invalid username or password.</h3>
        <p style="text-align: center;"><a href="login_form.jsp">Try Again</a></p>
<%
    }

} catch (Exception e) {
    out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    e.printStackTrace();
} finally {
    try { if (rs != null) rs.close(); } catch (Exception ignored) {}
    try { if (pstmt != null) pstmt.close(); } catch (Exception ignored) {}
    try { if (conn != null) conn.close(); } catch (Exception ignored) {}
}
%>
