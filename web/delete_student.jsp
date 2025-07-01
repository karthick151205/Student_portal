<%-- 
    Document   : delete_student.jsp
    Created on : 28-Jun-2025, 11:29:38 am
    Author     : Karthick Raja
--%>

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
   
if(session.getAttribute("user_id") == null) {
    response.sendRedirect("login.jsp");
}

    String rollNumber = request.getParameter("roll_number");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        String url = "jdbc:mysql://localhost:3306/student_report?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
        String user = "root";      // your DB username
        String password = "karthi"; // your DB password

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        String sql = "DELETE FROM student_results WHERE roll_number = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, rollNumber);

        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            // Redirect back to ranking page after successful deletion
            response.sendRedirect("view_rank.jsp");
        } else {
            out.println("<h3 style='color:red;'>Student not found or already deleted.</h3>");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    } finally {
        try { if(pstmt != null) pstmt.close(); } catch (Exception ignored) {}
        try { if(conn != null) conn.close(); } catch (Exception ignored) {}
    }
%>

