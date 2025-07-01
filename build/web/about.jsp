<%-- 
    Document   : about
    Created on : 28-Jun-2025, 5:24:03 pm
    Author     : Karthick Raja
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About - Smart Student Portal</title>
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
            padding: 40px 20px;
        }

        .about-container {
            background: #f3f6f7;
            padding: 40px;
            border-radius: 12px;
            max-width: 800px;
            width: 100%;
            box-shadow: 0px 5px 15px rgba(20, 20, 20, 0.2);
            text-align: center;
            color: #333;
            line-height: 1.8;
        }

        h2 {
            color: #370554;
            margin-bottom: 20px;
            font-size: 2em;
        }

        li{
            font-size: 1.05em;
            text-align: left;
        }
        p{
            text-align: right;
            color:#370554;
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
            .about-container {
                padding: 20px;
            }

            h2 {
                font-size: 1.5em;
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
        <div class="about-container">
            <h2>About Us</h2>
            <ul>
                <li>
                Welcome to the <strong>Smart Student Portal</strong>, your all-in-one academic assistant. This platform is designed to simplify and enhance your academic journey by providing essential tools like report card generation, performance tracking, and more.
                </li>
                <li>
                Our goal is to make student data management easier, faster, and more accurate. Whether you're checking your rank, generating a report card, or managing your academic information, the Smart Student Portal is here to help you succeed.
                </li>
                <li>
                Built with modern web technologies and a user-friendly interface, our portal ensures an accessible experience for every student. Thank you for being part of our journey!
                </li>
                <p><b>-Karthick Raja</b></p>
              </ul>
        </div>
    </div>

    <footer>
        &copy; 2025 Smart Student Portal.
    </footer>
</body>
</html>
