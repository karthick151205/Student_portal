<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<%@ page import="java.sql.*" %>
<%@ page import="Oops.StudentReport" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%
    Object userIdObj = session.getAttribute("user_id");
    if (userIdObj == null) {
        response.sendRedirect("login_form.jsp");
        return;
    }
    int userId = (int) userIdObj;
    String rollNumberParam = request.getParameter("roll");
    String name = ""; 
    int age = 0;
    int tamil = 0, english = 0, mathematics = 0, physics = 0, chemistry = 0, computerScience = 0;
    boolean recordFound = false;

    if (rollNumberParam != null && !rollNumberParam.trim().isEmpty()) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
    String url = "jdbc:mysql://b5mkw3hz4pketjlxs9cp-mysql.services.clever-cloud.com:3306/b5mkw3hz4pketjlxs9cp";
    String user = "ui60qawn0wknpbuj"; // Change if needed
    String password = "tg55JuZt1E9UayFF9Js7"; // Your actual password
    Class.forName("com.mysql.cj.jdbc.Driver");

    conn = DriverManager.getConnection(url, user, password);

    String sql = "SELECT name, age, tamil, english, mathematics, physics, chemistry, computer_science " +
                 "FROM student_results WHERE roll_number = ?";
    ps = conn.prepareStatement(sql);
    ps.setString(1, rollNumberParam);
    rs = ps.executeQuery();

    if (rs.next()) {
        recordFound = true;
        name = rs.getString("name");
        age = rs.getInt("age");
        tamil = rs.getInt("tamil");
        english = rs.getInt("english");
        mathematics = rs.getInt("mathematics");
        physics = rs.getInt("physics");
        chemistry = rs.getInt("chemistry");
        computerScience = rs.getInt("computer_science");
    }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if(rs != null) rs.close(); } catch (Exception ignored) {}
            try { if(ps != null) ps.close(); } catch (Exception ignored) {}
            try { if(conn != null) conn.close(); } catch (Exception ignored) {}
        }
    }
%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Report Form</title>
<style>
    body {
        margin: 0;
        background: linear-gradient(to top left, #96C8FB,#DDBDFC);
        display: flex;
        flex-direction: column;
        align-items: center;
        min-height: 100vh;
        font-family: 'Arial', sans-serif;
    }

    header {
        background-color: #370554;
        color: #fff;
        padding:10px;
        text-align: center;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        width: 100%;
    }

    .container {
        background-color: #fff;
        padding: 30px 40px;
        margin: 30px;
        border-radius: 10px;
        box-shadow: 0 8px 24px rgba(0, 0, 0, 0.6);
        width: 90%;
        max-width: 480px;
        border: 1px solid #333;
        margin-top: 40px;
    }

    h2, h3 {
        text-align: center;
        color: #370554;
        margin: 10px 0 20px;
    }

    form label {
        display: block;
        margin-top: 15px;
        font-weight: bold;
        color: #0d0505;
    }

    input[type="text"],
    input[type="number"] {
        width: 100%;
        padding: 10px;
        margin: 5px 0 10px;
        border-radius: 6px;
        border: 1px solid #444;
        background-color: #fff;
        color: black;
        font-size: 14px;
        text-transform: uppercase;
    }

    input[type="text"]:focus,
    input[type="number"]:focus {
        border-color: #00bcd4;
        background-color: #fff;
        outline: none;
        box-shadow: 0 0 4px #00bcd4;
    }

    .button-group {
        display: flex;
        justify-content: space-between;
        gap: 10px;
        margin-top: 20px;
    }

    input[type="submit"] {
        flex: 1;
        padding: 14px;
        background: #370554;
        color: white;
        font-weight: bold;
        border: none;
        border-radius: 8px;
        font-size: 16px;
        cursor: pointer;
        transition: background 0.3s ease, transform 0.2s;
    }

    input[type="submit"]:hover {
        background: linear-gradient(to right, #0086c3, #005f73);
        transform: translateY(-2px);
    }

    .btn-link {
        display: inline-block;
        text-align: center;
        text-decoration: none;
        flex: 1;
        padding: 14px;
        background-color: #370554;
        color: white;
        font-weight: bold;
        border-radius: 8px;
        font-size: 16px;
        transition: background 0.3s ease, transform 0.2s;
    }

    .btn-link:hover {
        background: linear-gradient(to right, #0086c3, #005f73);
        transform: translateY(-2px);
    }

    .no-record {
        text-align: center;
        color: red;
        font-style: italic;
        margin-bottom: 10px;
    }

    .common-section {
        width: 100%;
    }

    footer {
        background: rgba(255, 255, 255, 0.85);
        text-align: center;
        color: #555;
        font-size: 14px;
        padding: 15px;
        border-top: 1px solid #ccc;
        width: 100%;
        margin-top: auto;
    }
</style>
</head>
<body>

<header>
    <h1>Smart Student Portal</h1>
</header>

<div class="common-section">
    <jsp:include page="common.jsp" />
</div>

<div class="container">
    <h2>Enter Student Details</h2>
    <% if (rollNumberParam != null && !rollNumberParam.trim().isEmpty() && !recordFound) { %>
        <div class="no-record">No record found for Roll Number: <%= rollNumberParam %></div>
    <% } %>

    <form action="result.jsp" method="post">
        <label>Name:</label>
        <input type="text" name="name" placeholder="Enter full name" value="<%= name %>" required>

        <label>Roll Number:</label>
        <input 
            type="text" 
            name="roll" 
            placeholder="Enter your Roll Number" 
            value="<%= (rollNumberParam != null) ? rollNumberParam : "" %>" 
            <%= (recordFound) ? "readonly" : "" %> 
            required>

        <label>Age:</label>
        <input type="number" name="age" placeholder="Enter age" value="<%= (age != 0) ? age : "" %>" required>

        <h3>Enter Marks (out of 100)</h3>

        <label>Tamil:</label>
        <input type="number" name="Tamil" min="0" max="100" placeholder="Enter mark" value="<%= recordFound ? tamil : "" %>" required>

        <label>English:</label>
        <input type="number" name="English" min="0" max="100" placeholder="Enter mark" value="<%= recordFound ? english : "" %>" required>

        <label>Mathematics:</label>
        <input type="number" name="Mathematics" min="0" max="100" placeholder="Enter mark" value="<%= recordFound ? mathematics : "" %>" required>

        <label>Physics:</label>
        <input type="number" name="Physics" min="0" max="100" placeholder="Enter mark" value="<%= recordFound ? physics : "" %>" required>

        <label>Chemistry:</label>
        <input type="number" name="Chemistry" min="0" max="100" placeholder="Enter mark" value="<%= recordFound ? chemistry : "" %>" required>

        <label>Computer Science:</label>
        <input type="number" name="ComputerScience" min="0" max="100" placeholder="Enter mark" value="<%= recordFound ? computerScience : "" %>" required>

        <div class="button-group">
            <input type="submit" value="Generate Report">
            <a href="homepage.jsp" class="btn-link">Back to Home</a>
        </div>
    </form>
</div>

<script>
    document.querySelector("form").addEventListener("submit", function() {
        const textInputs = this.querySelectorAll('input[type="text"]');
        textInputs.forEach(input => {
            input.value = input.value.toUpperCase();
        });
    });
</script>

<footer>
    &copy; 2025 Smart Student Portal.
</footer>

</body>
</html>