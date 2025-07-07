<%@ page import="java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%
if(session.getAttribute("user_id") == null) {
    response.sendRedirect("login_form.jsp");
    return;
}

int userId = (int) session.getAttribute("user_id");
String role = (String) session.getAttribute("role");

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    String url = "jdbc:mysql://b5mkw3hz4pketjlxs9cp-mysql.services.clever-cloud.com:3306/b5mkw3hz4pketjlxs9cp";
    String user = "ui60qawn0wknpbuj";
    String password = "tg55JuZt1E9UayFF9Js7";

    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(url, user, password);

    String sql;
    if ("admin".equalsIgnoreCase(role)) {
        sql = "SELECT DISTINCT roll_number, name, total_marks, percentage, grade, result FROM student_results ORDER BY total_marks DESC, percentage DESC";
        pstmt = conn.prepareStatement(sql);
    } else {
        sql = "SELECT DISTINCT roll_number, name, total_marks, percentage, grade, result FROM student_results WHERE user_id = ? ORDER BY total_marks DESC, percentage DESC";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, userId);
    }

    rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Rankings</title>
    <style>
        /* Your existing CSS styles */
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to top left, #96C8FB, #DDBDFC);
            color: #370554;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        h2 {
            text-align: center;
            color: #370554;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            margin: 20px 0;
            background-color: #fff;
        }
        table, th, td {
            border: 1px solid #555;
        }
        th {
            background-color: #370554;
            color: #ffffff;
            padding: 12px;
            font-size: 16px;
        }
        td {
            padding: 10px;
            text-align: center;
            font-size: 15px;
        }
        tr:nth-child(odd) {
            background-color: #fafafa;
        }
        tr:hover {
            background-color: #f1f1ff;
        }
        .nav-links {
            text-align: center;
            margin: 20px 0;
        }
        .nav-links a {
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            background-color: #370554;
            padding: 12px 25px;
            border-radius: 6px;
            margin: 0 10px;
            transition: background-color 0.3s, transform 0.2s;
        }
        .nav-links a:hover {
            background-color: #0086c3;
            transform: translateY(-2px);
        }
        input[type=submit] {
            font-size: 14px;
            font-weight: bold;
            color: #fff;
            background-color: #c62828;
            border: none;
            padding: 6px 12px;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background-color: #a01919;
        }
        .button-group {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
        }
        header {
            background-color: #370554;
            color: #fff;
            padding: 30px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <header>
        <h1>Smart Student Portal</h1>
    </header>

    <jsp:include page="common.jsp" />
    <h2><b>Student Rankings</b></h2>

    <table>
        <tr>
            <th>Rank</th>
            <th>Name</th>
            <th>Roll Number</th>
            <th>Total Marks</th>
            <th>Percentage</th>
            <th>Grade</th>
            <th>Result</th>
            <th>Action</th>
        </tr>
        <%
        int rank = 1;
        boolean hasRecords = false;
        while (rs.next()) {
            hasRecords = true;
        %>
        <tr>
            <td><%= rank++ %></td>
            <td><%= rs.getString("name").toUpperCase() %></td>
            <td><%= rs.getString("roll_number").toUpperCase() %></td>
            <td><%= rs.getInt("total_marks") %></td>
            <td><%= String.format("%.2f", rs.getDouble("percentage")) %> %</td>
            <td><%= rs.getString("grade").toUpperCase() %></td>
            <td><%= rs.getString("result").toUpperCase() %></td>
            <td>
                <div class="button-group">
                    <a href="Student_Report.jsp?roll=<%= rs.getString("roll_number") %>"
                       style="text-decoration: none; font-size: 14px; font-weight: bold; color: #fff; background-color: #370554; padding: 6px 12px; border-radius: 5px;"
                       onmouseover="this.style.backgroundColor='#0086c3'"
                       onmouseout="this.style.backgroundColor='#370554'">
                        Generate Report
                    </a>
                    <form method="post" action="delete_student.jsp" style="display:inline;">
                        <input type="hidden" name="roll_number" value="<%= rs.getString("roll_number") %>">
                        <input type="submit" value="Delete"
                               onclick="return confirm('Are you sure you want to delete this student?');">
                    </form>
                </div>
            </td>
        </tr>
        <% } %>
        <% if (!hasRecords) { %>
            <tr><td colspan="8">No student records found. Please add some.</td></tr>
        <% } %>
    </table>

    <div class="nav-links no-print">
        <a href="homepage.jsp">Back to Home</a>
    </div>
</body>
</html>

<%
} catch (Exception e) {
    e.printStackTrace();
    out.println("<h3 style='color:red'>Error: " + e.getMessage() + "</h3>");
} finally {
    try { if(rs != null) rs.close(); } catch (Exception ignored) {}
    try { if(pstmt != null) pstmt.close(); } catch (Exception ignored) {}
    try { if(conn != null) conn.close(); } catch (Exception ignored) {}
}
%>
