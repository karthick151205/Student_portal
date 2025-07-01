<%-- 
    Document   : contact
    Created on : 28-Jun-2025, 5:26:10 pm
    Author     : Karthick Raja
--%>
<%@ page import="java.sql.*" %>
<%
    String msg = request.getParameter("status");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Smart Student Portal</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background: linear-gradient(to top left, #96C8FB, #DDBDFC);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            background-color: #370554;
            color: #fff;
            padding: 30px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .main-content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px 20px;
        }

        .contact-container {
            background: #f3f6f7;
            padding: 30px;
            border-radius: 12px;
            width: 100%;
            max-width: 500px;
            box-shadow: 0px 5px 15px rgba(20, 20, 20, 0.2);
        }

        h2 {
            text-align: center;
            color: #370554;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            color: #555;
            display: block;
            margin-bottom: 5px;
        }

        input, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 2px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
            transition: 0.3s;
            resize: none;
        }

        input:focus, textarea:focus {
            border-color: #3593bf;
            outline: none;
            box-shadow: 0 0 8px rgba(23, 1, 5, 0.1);
        }

        .submit-btn {
            background: #370554;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 5px;
            font-size: 1.1em;
            cursor: pointer;
            transition: 0.3s;
        }

        .submit-btn:hover {
            background: #28a9d4;
            transform: scale(1.03);
        }

        .success-message {
            color: green;
            font-size: 0.95em;
            text-align: center;
            display: none;
            margin-bottom: 10px;
        }

        footer {
            background: rgba(255, 255, 255, 0.85);
            text-align: center;
            color: #555;
            font-size: 14px;
            padding: 15px;
            border-top: 1px solid #ccc;
        }

        @media (max-width: 600px) {
            .contact-container {
                width: 90%;
            }
        }
    </style>
</head>
<body>

    <header>
        <h1>Smart Student Portal</h1>
    </header>

        <jsp:include page="common.jsp" />
    

    <div class="main-content">
        <div class="contact-container">
            <h2>Contact Us</h2>
           <% if ("success".equals(msg)) { %>
              <div class="success-message" style="display:block;">Your message has been sent successfully!</div>
         <% } else if ("error".equals(msg)) { %>
              <div class="success-message" style="display:block; color:red;">Failed to send your message. Please try again.</div>
         <% } else { %>
              <div class="success-message" id="successMsg">Your message has been sent successfully!</div>
         <% } %>
            <form action="contactjsp.jsp" method="post" onsubmit="return validateForm()">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" placeholder="Your full name" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Your email address" required>

                <label for="message">Message:</label>
                <textarea id="message" name="message" rows="5" placeholder="Write your message here..." required></textarea>

                <button type="submit" class="submit-btn">Send Message</button>
            </form>
        </div>
    </div>

    <footer>
        &copy; 2025 Smart Student Portal.
    </footer>

    <script>
        function validateForm() {
            const name = document.getElementById("name").value.trim();
            const email = document.getElementById("email").value.trim();
            const message = document.getElementById("message").value.trim();

            if (!name || !email || !message) {
                alert("All fields are required.");
                return false;
            }

            return true;
        }
    </script>
</body>
</html>