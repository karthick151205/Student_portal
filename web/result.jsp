<%@ page import="Oops.StudentReport, java.sql.*" contentType="text/html" pageEncoding="UTF-8" %>
<%
    int userId = (int) session.getAttribute("user_id");

    try {
        // Validate required fields
        String name = request.getParameter("name");
        String roll = request.getParameter("roll");
        String ageParam = request.getParameter("age");

        if (name == null || name.trim().isEmpty() ||
            roll == null || roll.trim().isEmpty() ||
            ageParam == null || ageParam.trim().isEmpty()) {
            out.println("<h3 style='color:red'>Missing required fields (name, roll, or age). Please go back and fill in the form properly.</h3>");
            return;
        }

        int age = Integer.parseInt(ageParam);

        String[] subjects = {"Tamil", "English", "Mathematics", "Physics", "Chemistry", "ComputerScience"};
        int marks[] = new int[subjects.length];
        for (int i = 0; i < subjects.length; i++) {
            String markParam = request.getParameter(subjects[i]);
            if (markParam == null || markParam.trim().isEmpty()) {
                out.println("<h3 style='color:red'>Missing or invalid mark for " + subjects[i] + ".</h3>");
                return;
            }
            marks[i] = Integer.parseInt(markParam);
        }

        // Perform Result Logic
        StudentReport sr = new StudentReport(name.toUpperCase(), age, roll.toUpperCase(), marks);
        sr.calculateResult();

        // Save to DB
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/student_report?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",
            "root", "karthi"
        );

        String sql = "INSERT INTO student_results (name, roll_number, age, tamil, english, mathematics, physics, chemistry, computer_science, total_marks, percentage, grade, result, user_id) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, sr.getname());
        ps.setString(2, sr.getRollnumber());
        ps.setInt(3, sr.getage());
        ps.setInt(4, marks[0]);
        ps.setInt(5, marks[1]);
        ps.setInt(6, marks[2]);
        ps.setInt(7, marks[3]);
        ps.setInt(8, marks[4]);
        ps.setInt(9, marks[5]);
        ps.setInt(10, sr.getTotalMark());
        ps.setDouble(11, sr.getPercentage());
        ps.setString(12, sr.getGrade());
        ps.setString(13, sr.getResult());
        ps.setInt(14, userId);

        ps.executeUpdate();
        conn.close();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to top left, #96C8FB, #DDBDFC);
            margin: 0;
            padding: 0;
        }

        header {
          font-family: Arial, sans-serif;
          text-align: center;
          background: #370554;
          color: white;
          padding: 12px 0;
          font-weight: 500;
          font-size: 1.5rem;
          letter-spacing: 0.5px;
           box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
         }


        .report-container {
            max-width: 850px;
            margin: 40px auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
            padding: 30px;
        }

        h3 {
            color: #370554;
            font-size: 22px;
            margin-bottom: 10px;
        }

        p {
            font-size: 16px;
            margin: 4px 0;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin: 20px 0;
        }

        table, th, td {
            border: 1px solid #555;
        }

        th {
            background-color: #eae2ff;
            font-size: 16px;
            padding: 10px;
            text-align: center;
        }

        td {
            padding: 8px;
            font-size: 15px;
            text-align: center;
        }

        table tr:nth-child(odd) {
            background-color: #f9f9f9;
        }

        .summary {
            border-radius: 8px;
            background: #eae2ff;
            border: 1px solid #ccc;
            padding: 15px;
            margin-top: 25px;
        }

        .button-group {
            text-align: center;
            margin-top: 30px;
        }

        .action-btn {
            background-color: #370554;
            color: white;
            padding: 14px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin: 10px;
            width: 160px;
            font-size: 16px;
            transition: 0.3s;
        }

        .action-btn:hover {
            background: #0086c3;
            transform: scale(1.03);
        }

        @media print {
            body {
                background: white;
                margin: 0;
            }

            .report-container {
                margin: 0 auto;
                box-shadow: none;
                padding: 0;
                width: 100%;
                max-width: 800px;
            }

            .button-group {
                display: none;
            }

            header {
                background: white;
                color: black;
                box-shadow: none;
            }
        }
    </style>
</head>
<body>
    <header>
    <h1 style="margin: 0; font-size: 1.8rem;">Report Card</h1>
</header>


    <div class="report-container">
        <form>
            <div class="summary">
                <p><b>Name:</b> <%= sr.getname() %></p>
                <p><b>Roll Number:</b> <%= sr.getRollnumber() %></p>
                <p><b>Age:</b> <%= sr.getage() %></p>
            </div>

            <h3>Marks:</h3>
            <table>
                <tr>
                    <th>Subject</th>
                    <th>Marks</th>
                </tr>
                <% for(int i = 0; i < subjects.length; i++) { %>
                    <tr>
                        <td><%= subjects[i] %></td>
                        <td><%= marks[i] %></td>
                    </tr>
                <% } %>
            </table>

            <div class="summary">
                <h3>Summary:</h3>
                <p><b>Total Marks:</b> <%= sr.getTotalMark() %></p>
                <p><b>Percentage:</b> <%= String.format("%.2f", sr.getPercentage()) %> %</p>
                <p><b>Grade:</b> <%= sr.getGrade() %></p>
                <p><b>Result:</b> <%= sr.getResult() %></p>
            </div>

            <div class="button-group no-print">
                <button class="action-btn" type="button" onclick="window.print()">Print this Report</button>
                <button class="action-btn" type="button" onclick="window.location.href='homepage.jsp'">Back to Home</button>
            </div>
        </form>
    </div>
</body>
</html>

<%
    } catch(Exception e) {
        e.printStackTrace();
        out.println("<h3 style='color:red'>Error: " + e.getMessage() + "</h3>");
    }
%>
