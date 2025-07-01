<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
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
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .main-content {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px 20px;
        }

        .form-container {
            background: #f3f6f7;
            padding: 30px;
            border-radius: 12px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0px 5px 15px rgba(20, 20, 20, 0.2);
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .form-container:hover {
            transform: translateY(-5px);
            box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.3);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            color: #555;
            display: block;
            margin-bottom: 5px;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 2px solid #ddd;
            border-radius: 5px;
            font-size: 1em;
            transition: 0.3s;
        }

        input:focus, select:focus {
            border-color: #3593bf;
            outline: none;
            box-shadow: 0 0 8px rgba(23, 1, 5, 0.1);
        }

        .gender-container {
            display: flex;
            gap: 10px;
            margin-bottom: 15px;
            align-items: center;
        }

        .gender-container input {
            margin-right: 5px;
        }

        .error {
            color: red;
            font-size: 0.85em;
            margin-bottom: 10px;
            display: none;
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

        .form-container p {
            text-align: center;
        }

        .form-container a {
            color: #370554;
            text-decoration: none;
            font-weight: bold;
        }

        .form-container a:hover {
            color:#28a9d4;
            text-decoration: underline;
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
            .form-container {
                width: 90%;
            }
        }
    </style>


</head>
<script>
document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form");
    const errorDiv = document.querySelector(".error");

    form.addEventListener("submit", function (event) {
        const password = document.getElementById("password").value;
        const cpassword = document.getElementById("cpassword").value;

        if (password !== cpassword) {
            event.preventDefault();
            errorDiv.textContent = "Passwords do not match!";
            errorDiv.style.display = "block";
        } else {
            errorDiv.style.display = "none";
        }
    });
});
</script>


<body>
 <header>
        <h1>Smart Student Portal</h1>
    </header>
 
    <div class="common-section">
        <jsp:include page="common.jsp" />
    </div>

    <div class="main-content">
        <div class="form-container">
            <h2>Register Now</h2>
            <div class="error"></div>
            <form action="registerjsp.jsp" method="post">
                <label for="fname">First Name:</label>
                <input type="text" id="fname" name="fname" placeholder="Enter your first name" required>

                <label for="lname">Last Name:</label>
                <input type="text" id="lname" name="lname" placeholder="Enter your last name" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Enter a valid email" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Create a password" required>

                <label for="cpassword">Confirm Password:</label>
                <input type="password" id="cpassword" name="cpassword" placeholder="Confirm your password" required>

               <label>Gender:</label>
               <div class="gender-container">
               <input type="radio" id="male" name="gender" value="Male" required>
               <label for="male">Male</label>

              <input type="radio" id="female" name="gender" value="Female">
              <label for="female">Female</label>

              <input type="radio" id="other" name="gender" value="Other">
              <label for="other">Other</label>
              </div>


                <button type="submit" class="submit-btn">Register</button><br><br>
                <p>Already have an account? <a href="login_form.jsp">Sign in</a></p>
            </form>
        </div>
    </div>

    <footer>
        &copy; 2025 Smart Student Portal.
    </footer>
</body>
</html>