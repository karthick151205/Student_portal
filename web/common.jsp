<%-- 
    Document   : comman
    Created on : 28-Jun-2025, 5:18:31 pm
    Author     : Karthick Raja
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Navigation</title>
    <style>
        nav {
            background: #fff;
            padding: 15px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navlist-right h2 {
            margin: 0;
            color: #003366;
            font-weight: bold;
            font-size: 15px;
        }

        .navlist-right{
    display: flex;
    align-items: center;
    gap: 10px;
   
}

        .navlist-left a {
            margin-left: 20px;
            text-decoration: none;
            color: #003366;
            font-weight: bold;
            font-size: 18px;
        }

        .navlist-left a:hover {
            color: #0056b3;
        }

        p {
            color: #003366;
        }
        
        .logo {
    height: 40px;
    vertical-align: middle;
    margin-right: 10px;
}
    </style>
</head>
<body>
    <nav>
        <div class="navlist-left">
            <a href="homepage.jsp">Home</a>
            <a href="about.jsp">About Us</a>
            <a href="login_form.jsp">Login</a>
            <a href="register_form.jsp">Register</a>
            <a href="contact.jsp">Contact</a>
            <a href="logout.jsp">Logout</a>
        </div>
        <div class="navlist-right">
            <h2>Personalized Student record System</h2>
        </div>
    </nav>
</body>
</html>
