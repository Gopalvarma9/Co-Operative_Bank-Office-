<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<!DOCTYPE html>
<html>
<head>
    <title>Co-Operative Bank - Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        /* CSS styles for the login form */
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

        #forgotPassword {
            display: block;
            font-size: 0.875rem;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div id="content" class="col-md-4 offset-md-4">
            <h1 class="text-center">Login</h1>
            ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
            <form id="loginForm" class="mt-4"  action="home" method="post">
             <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            
                <div class="form-group">
                    <label for="username">Employee ID:</label>
                    <input type="text" class="form-control" id="username" name="username" placeholder="Enter your Employee Id">
                </div>
                <div class="form-group">
                    <label for="busr_id">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password">
                </div>
                <button type="submit" class="btn btn-primary btn-block">Login</button>
                <a href="SendOtp"  id="forgotPassword">Forgot Password?</a>
            </form>
        </div>
    </div>

</body>
</html>
