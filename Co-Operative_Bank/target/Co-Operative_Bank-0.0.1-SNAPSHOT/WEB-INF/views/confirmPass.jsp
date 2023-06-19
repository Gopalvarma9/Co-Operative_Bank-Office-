<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Co-Operative Bank - Create Account</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        /* CSS styles for the form */
        html, body {
            height: 100%;
        }

        body {
            display: flex;
            align-items: center;
        }

        #content {
            padding: 20px;
            background-color: #f8f9fa;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-control {
            height: calc(1.5em + 0.75rem + 2px);
            padding: 0.375rem 0.75rem;
            font-size: 0.875rem;
            width: 300px;
        }

        .btn-primary {
            background-color: #333;
            border-color: #333;
        }

        .btn-primary:hover {
            background-color: #111;
            border-color: #111;
            text-shadow: none;
        }

        .error-message {
            color: red;
            font-size: 0.75rem;
            margin-top: 5px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div id="content" class="col-md-4 offset-md-4">
            <h1 class="text-center">Create Account</h1>
            <form id="accountForm" class="mt-4" action="login" method="post">
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                    <div class="error-message" id="passwordError"></div>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                    <div class="error-message" id="confirmPasswordError"></div>
                </div>
                <input type="submit" class="btn btn-primary btn-block" value="Submit">
            </form>
        </div>
    </div>

    <script>
        document.getElementById("accountForm").addEventListener("submit", function(event) {
            event.preventDefault();

            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;

            // Password validation rules
            var uppercaseRegex = /^(?=.*[A-Z])/;
            var specialCharRegex = /^(?=.*[!@#$%^&*])/;
            var lengthRegex = /^.{8,}$/;

            var passwordError = document.getElementById("passwordError");
            var confirmPasswordError = document.getElementById("confirmPasswordError");

            passwordError.textContent = "";
            confirmPasswordError.textContent = "";

            var isValid = true;

            if (!uppercaseRegex.test(password)) {
                passwordError.textContent = "Password must contain at least one uppercase letter!";
                isValid = false;
            }

            if (!specialCharRegex.test(password)) {
                passwordError.textContent = "Password must contain at least one special character!";
                isValid = false;
            }

            if (!lengthRegex.test(password)) {
                passwordError.textContent = "Password must be at least 8 characters long!";
                isValid = false;
            }

            if (password !== confirmPassword) {
                confirmPasswordError.textContent = "Passwords do not match!";
                isValid = false;
            }

            if (isValid) {
                this.submit();
            }
        });
    </script>
</body>
</html>
