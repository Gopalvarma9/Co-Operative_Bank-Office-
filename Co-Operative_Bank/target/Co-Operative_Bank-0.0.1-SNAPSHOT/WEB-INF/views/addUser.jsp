<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>My Form</title>
    <style>
        .form-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            max-width: 400px;
        }

        .form-container label {
            font-weight: bold;
        }

        .form-container input[type="text"],
        .form-container input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 3px;
            border: 1px solid #ccc;
        }

        .form-container input[type="submit"] {
            background-color: #111;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .form-container input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Adding User</h2> <!-- Heading added here -->
    <div class="form-container">
        <form>
            <label for="busr_id">BankUser ID:</label>
            <input type="text" id="busr_id" name="busr_id" required><br><br>

            <label for="busr_title">BankUser Title:</label>
            <input type="text" id="busr_title" name="busr_title" required><br><br>

            <label for="busr_desg">BankUser Designation:</label>
            <input type="text" id="busr_desg" name="busr_desg" required><br><br>

            <label for="busr_email">BankUser Email:</label>
            <input type="email" id="busr_email" name="busr_email" required><br><br>

            <input type="submit" value="Submit">
        </form>
    </div>
</body>
</html>
