<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <title>My Single-Page Application</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        /* CSS styles for sidebar and content layout */
  #sidebar {
        padding: 20px;
        background-color: #111;
        min-height: 100vh;
        width: 500px; /* Adjust the width as per your preference */
    }

        #content {
            padding: 20px;
            background-color: #f8f9fa;
            color: #333;
        }

        /* Additional color styles for sidebar links */
        #sidebar .nav-link {
            color: #818181;
        }

        #sidebar .nav-link:hover {
            color: #f1f1f1;
            text-shadow: 0 0 10px #000;
        }

        /* CSS styles for top navigation bar */
        #navbar {
            background-color: #333;
            color: #fff;
            padding: 10px;
        }

        #welcome {
            font-size: 14px;
            font-weight: bold;
            margin-right: 10px;
            display: inline-block;
            text-align: center;
            width: auto;
        }

        #logout {
            font-size: 14px;
            font-weight: bold;
            color: #000; /* Update the color to black */
            text-decoration: underline;
            cursor: pointer;
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <div id="header" class="container-fluid bg-dark text-white py-3 text-center">
        <h1>Co-Operative Bank</h1>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <span id="welcome">Welcome!!!</span>
            </div>
            <div class="col-md-6 text-right">
                <a id="logout" onclick="logout()">Logout</a>
            </div>
        </div>
        <div class="row">
            <div id="sidebar" class="col-md-3">
                <nav>
                    <ul class="nav flex-column">
                        <li class="nav-item"><a class="nav-link" href="#dashboard">DashBoard</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="accountsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Accounts
                            </a>
                            <div class="dropdown-menu" aria-labelledby="accountsDropdown">
                                <a class="dropdown-item" href="#savings">Savings</a>
                                <a class="dropdown-item" href="#current">Current</a>
                                <a class="dropdown-item" href="#fixed-deposit">Fixed Deposit</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="transactionsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Transactions
                            </a>
                            <div class="dropdown-menu" aria-labelledby="transactionsDropdown">
                                <a class="dropdown-item" href="#money_deposit">money_deposit</a>
                                <a class="dropdown-item" href="#loan-repayment">loan_repayment</a>
                                <a class="dropdown-item" href="#interest-deposit">interest-deposit</a>
                                <a class="dropdown-item" href="#money-withdrawl">money_withdrawl</a>
                                <a class="dropdown-item" href="#loan-withdrawl">loan_withdrawl</a>
                            </div>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="#Account_Application">Account_Application</a></li>
                        <li class="nav-item"><a class="nav-link" href="#reports">Reports</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="usersDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Users
                            </a>
                            <div class="dropdown-menu" aria-labelledby="usersDropdown">
                                <a class="dropdown-item" href="#list-users">List All Users</a>
                                <a class="dropdown-item" href="#add-user">Add a User</a>
                            </div>
                        </li>
                    </ul>
                </nav>
            </div>
            
            <p id="r1"></p>
        </div>
    </div>

    <script>
        // Function to load content based on the hash in the URL
        function loadContent() {
            var contentDiv = document.getElementById("content");
            var hash = window.location.hash;
            document.getElementById('r1').innerHTML = "";

            if (hash === "#money_deposit") {
                functionfordeposit();
            } else if (hash === "#loan-repayment") {
                function_4_loan_repay();
            } else if (hash === "#interest-deposit") {
                function_4_Interest_Deposit();
            } else if (hash === "#money-withdrawl") {
                function_4_money_withdrawl();
            } else if (hash === "#loan-withdrawl") {
                function_4_loan_withdrawl();
            } else if (hash === "#withdrawal") {
                contentDiv.innerHTML = "<h1>Withdrawal</h1><p>Content for the Withdrawal page goes here.</p>";
            } else if (hash === "#transfer") {
                contentDiv.innerHTML = "<h1>Transfer</h1><p>Content for the Transfer page goes here.</p>";
            } else if (hash === "#Account_Application") {
                Application();
            } else if (hash === "#list-users") {
                listUsers();
            } else if (hash === "#add-user") {
                addUser();
            } else {
                contentDiv.innerHTML = "<h1>Page Not Found</h1><p>The page you're looking for does not exist.</p>";
            }
        }

        // Event listener to detect hash changes and load content accordingly
        window.addEventListener("hashchange", loadContent);

        // Load initial content based on the hash in the URL
        loadContent();

        // Function to handle logout button click
        function logout() {
            // Add your logout logic here
            alert("Logged out successfully!");
        }

        function Application() {
            document.getElementById('r1').innerHTML = "";
            $.ajax({
                url: 'for',
                method: 'get',
                success: function (resultText) {
                    $('#r1').html(resultText);
                },
                error: function (jqXHR, exception) {
                    console.log('Error occurred!');
                }
            });
        }

        function functionfordeposit() {
            document.getElementById('r1').innerHTML = "";
            $.ajax({
                url: 'moneydeposit',
                method: 'get',
                success: function (resultText) {
                    $('#r1').html(resultText);
                },
                error: function (jqXHR, exception) {
                    console.log('Error occurred!');
                }
            });
        }

        function function_4_loan_repay() {
            document.getElementById('r1').innerHTML = "";
            $.ajax({
                url: 'loanrepay',
                method: 'get',
                success: function (resultText) {
                    $('#r1').html(resultText);
                },
                error: function (jqXHR, exception) {
                    console.log('Error occurred!');
                }
            });
        }

        function function_4_Interest_Deposit() {
            document.getElementById('r1').innerHTML = "";
            $.ajax({
                url: 'interest',
                method: 'get',
                success: function (resultText) {
                    $('#r1').html(resultText);
                },
                error: function (jqXHR, exception) {
                    console.log('Error occurred!');
                }
            });
        }

        function function_4_money_withdrawl() {
            document.getElementById('r1').innerHTML = "";
            $.ajax({
                url: 'withdrawl',
                method: 'get',
                success: function (resultText) {
                    $('#r1').html(resultText);
                },
                error: function (jqXHR, exception) {
                    console.log('Error occurred!');
                }
            });
        }

        function function_4_loan_withdrawl() {
            document.getElementById('r1').innerHTML = "";
            $.ajax({
                url: 'lowid',
                method: 'get',
                success: function (resultText) {
                    $('#r1').html(resultText);
                },
                error: function (jqXHR, exception) {
                    console.log('Error occurred!');
                }
            });
        }

        function listUsers() {
            document.getElementById('r1').innerHTML = "";
            $.ajax({
                url: 'listUsers',
                method: 'get',
                success: function (resultText) {
                    $('#r1').html(resultText);
                },
                error: function (jqXHR, exception) {
                    console.log('Error occurred!');
                }
            });
        }

        function addUser() {
            document.getElementById('r1').innerHTML = "";
            $.ajax({
                url: 'addUser',
                method: 'get',
                success: function (resultText) {
                    $('#r1').html(resultText);
                },
                error: function (jqXHR, exception) {
                    console.log('Error occurred!');
                }
            });
        }
    </script>

    <!-- Include Bootstrap JS at the end to improve page load time -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
