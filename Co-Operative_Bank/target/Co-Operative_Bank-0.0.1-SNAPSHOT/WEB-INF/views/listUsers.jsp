<!DOCTYPE html>
<html>
<head>
    <title>Bank Users</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        /* Custom styles for the modal form */
        .modal-form-container {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .modal-form-container label {
            font-weight: bold;
        }

        .modal-form-container input[type="text"],
        .modal-form-container input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 3px;
            border: 1px solid #ccc;
        }

        .modal-form-container input[type="submit"] {
            background-color: #111;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        .modal-form-container input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Bank Users</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Title</th>
                    <th>Designation</th>
                    <th>Email</th>
                    <th>Action</th> <!-- Added Action column -->
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>Mr.</td>
                    <td>Manager</td>
                    <td>manager@bank.com</td>
                    <td><a href="#" data-toggle="modal" data-target="#editUserModal" data-userid="1">Edit</a></td> <!-- Edit button -->
                </tr>
                <tr>
                    <td>2</td>
                    <td>Ms.</td>
                    <td>Teller</td>
                    <td>teller@bank.com</td>
                    <td><a href="#" data-toggle="modal" data-target="#editUserModal" data-userid="2">Edit</a></td> <!-- Edit button -->
                </tr>
                <!-- Add more rows as needed -->
            </tbody>
        </table>
    </div>

    <!-- Edit User Modal -->
    <div class="modal fade" id="editUserModal" tabindex="-1" role="dialog" aria-labelledby="editUserModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editUserModalLabel">Edit User</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Add your form content here -->
                    <form action="editUser" method="POST" class="modal-form-container">
                        <label for="busr_id">User ID:</label>
                        <input type="text" id="busr_id" name="busr_id" readonly><br><br>

                        <label for="busr_title">Title:</label>
                        <input type="text" id="busr_title" name="busr_title" required><br><br>

                        <label for="busr_desg">Designation:</label>
                        <input type="text" id="busr_desg" name="busr_desg" required><br><br>

                        <label for="busr_email">Email:</label>
                        <input type="email" id="busr_email" name="busr_email" required><br><br>

                        <input type="submit" value="Save">
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Include Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    
    <script>
        $('#editUserModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var userID = button.data('userid'); // Extract user ID from data-userid attribute
            var modal = $(this);
            modal.find('#busr_id').val(userID); // Set the user ID value in the form field
        });
    </script>
</body>
</html>
