<%-- 
    Document   : homepage
    Created on : 28-Jun-2025, 5:16:48 pm
    Author     : Karthick Raja
--%>

<!DOCTYPE html>
<html>
<head>
    <title>Student Portal</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to top left, #96C8FB, #DDBDFC);
            color: #370554;
            text-align: center;
            padding: 0;
            margin: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
            background-position: center;
            background-repeat: no-repeat;
        }

        header {
            background-color: #370554;
            color: #fff;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        main {
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        main h1 {
            font-size: 40px;
            margin-bottom: 10px;
        }

        main p {
            font-size: 18px;
            margin-bottom: 30px;
        }

        .link-container {
            margin: 20px 0;
        }

        .link-container a {
            display: inline-block;
            text-decoration: none;
            font-size: 18px;
            font-weight: bold;
            color: #fff;
            background-color: #370554;
            padding: 15px 30px;
            border-radius: 8px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .link-container a:hover {
            background-color: #0086c3;
            transform: translateY(-2px);
        }
        
        footer {
            background: rgba(255, 255, 255, 0.85);
            text-align: center;
            color: #555;
            font-size: 14px;
            padding: 15px;
            border-top: 1px solid #ccc;
        }
    </style>
</head>
<body>
    <header>
        <h1>Smart Student Portal</h1>
    </header>
 
    <jsp:include page="common.jsp" />
    
    <main>
        <h1>Welcome to the Student Portal</h1>
        <p><h3>What would you like to do?<h3></p>

        <div class="link-container">
            <a href="Student_Report.jsp">Generate a Report Card</a>
        </div>
        <div class="link-container">
            <a href="view_rank.jsp">View Student Rankings</a>
        </div>
    </main>
    <footer>
        &copy; 2025 Smart Student Portal.
    </footer>
</body>
</html>
