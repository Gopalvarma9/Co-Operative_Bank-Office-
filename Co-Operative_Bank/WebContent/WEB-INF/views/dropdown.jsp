<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="form-group">
    <label for="designationFilter">Filter by Designation:</label>
    <select class="form-control" id="designationFilter">
        <option value="All">All</option>
        <option value="Manager">Manager</option>
        <option value="Account Processing">Account Processing</option>
        <option value="Clerk">Clerk</option>
        <option value="Bank Officer">Bank Officer</option>
    </select>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    // Filter by designation on dropdown change
    $("#designationFilter").change(function() {
        var selectedDesignation = $(this).val();

        // Send AJAX request to retrieve bank users based on designation
        $.ajax({
            url: "fetchData",
            type: "post",
            data: { busr_desg: selectedDesignation },
            success: function(response) {
                // Load the response into the table body
                $("#userTable").html(response);
            },
            error: function(xhr, status, error) {
                console.log("Error occurred while retrieving bank users");
            }
        });
    });
</script>
