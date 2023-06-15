<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.banking.model.BankUser" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>Bank Users</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        table {
            width: 100%;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .btn-primary {
            background-color: black;
            border-color: black;
        }

        .btn-primary:hover {
            background-color: #333;
            border-color: #333;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            font-family: Arial, sans-serif;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }

        .modal-dialog {
            margin-top: 200px;
            margin-left: 50%;
            transform: translateX(-50%);
        }
    </style>
</head>
<body>
<div class="container">

    <table class="table"  id="userTable">
        <thead>
            <tr>
                <th>User ID</th>
                <th>Title</th>
                <th>Designation</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody id="userTableBody">
            <% List<BankUser> bankUsers = (List<BankUser>) request.getAttribute("bankUsers");
            if (bankUsers != null && !bankUsers.isEmpty()) {
                for (BankUser bankUser : bankUsers) {
            %>
            <tr>
                <td><%= bankUser.getBusr_id() %></td>
                <td class="title"><%= bankUser.getBusr_title() %></td>
                <td class="designation"><%= bankUser.getBusr_desg() %></td>
                <td>
                    <button class="btn btn-primary" data-toggle="modal" data-target="#editModal-<%= bankUser.getBusr_id() %>">Edit</button>
                </td>
            </tr>
            <!-- Edit Modal for <%= bankUser.getBusr_id() %> -->
            <div class="modal fade" id="editModal-<%= bankUser.getBusr_id() %>" tabindex="-1" role="dialog"
                 aria-labelledby="editModalLabel-<%= bankUser.getBusr_id() %>" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editModalLabel-<%= bankUser.getBusr_id() %>">Edit User</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form method="post" id="editForm-<%= bankUser.getBusr_id() %>" action="saveUserData">
                                <div class="form-group">
                                    <label for="busr_id-<%= bankUser.getBusr_id() %>" >User ID</label>
                                    <input type="text" class="form-control"
                                           name="busr_id" id="busr_id-<%= bankUser.getBusr_id() %>" value="<%= bankUser.getBusr_id() %>" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="busr_title-<%= bankUser.getBusr_id() %>">Title</label>
                                    <input type="text" class="form-control"
                                           name="busr_title" id="busr_title-<%= bankUser.getBusr_id() %>" value="<%= bankUser.getBusr_title() %>">
                                </div>
                                <div class="form-group">
                                    <label for="busr_desg-<%= bankUser.getBusr_id() %>">Designation</label>
                                    <input type="text" class="form-control"
                                           name="busr_desg" id="busr_desg-<%= bankUser.getBusr_id() %>" value="<%= bankUser.getBusr_desg() %>">
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                            <button type="button" class="btn btn-primary" id="saveChangesBtn-<%= bankUser.getBusr_id() %>" onclick="savedata('<%= bankUser.getBusr_id() %>')">Save Changes</button>
                            <button type="button" class="btn btn-secondary" id="okBtn-<%= bankUser.getBusr_id() %>" style="display: none;">OK</button>
                            <br>
                            <div id="successMessage-<%= bankUser.getBusr_id() %>" style="display: none;"></div>
                        </div>
                    </div>
                </div>
            </div>
            <% }
            } else { %>
            <tr>
                <td colspan="4">No users found</td>
            </tr>
            <% } %>
        </tbody>
    </table>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script>
   
    function savedata(busr_id) {
        var busr_title = $("#busr_title-" + busr_id).val();
        var busr_desg = $("#busr_desg-" + busr_id).val();

        var formData = {
            busr_id: busr_id,
            busr_title: busr_title,
            busr_desg: busr_desg,
        };

        var saveChangesBtn = $("#saveChangesBtn-" + busr_id);
        var cancelBtn = $("#editModal-" + busr_id + " .modal-footer .btn-secondary");
        var okBtn = $("#okBtn-" + busr_id);

        $.ajax({
            url: "saveUserData",
            type: "POST",
            data: formData,
            success: function(response) {
                // Display success message
                $('#successMessage-' + busr_id).text(response).show();

                // Reset the form
                document.getElementById("editForm-" + busr_id).reset();

                // Hide the Save Changes and Cancel buttons, and show the OK button
                saveChangesBtn.hide();
                cancelBtn.hide();
                okBtn.show();

                // Change OK button color to black
                okBtn.removeClass("btn-secondary").addClass("btn-primary");

                // Reload the page on OK button click
                okBtn.on("click", function() {
                    location.reload();
                });
            },
            error: function(xhr, status, error) {
                console.log("Error occurred while saving form data");
            }
        });
    }
</script>
</body>
</html>
