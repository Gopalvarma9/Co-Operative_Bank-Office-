
<style>
  .form-container {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 8px;
    font-family: Arial, sans-serif;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
  }

  .form-container h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #333;
  }

  .form-container label {
    display: block;
    margin-bottom: 10px;
    font-weight: bold;
    color: #555;
  }

  .form-container input[type="text"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    font-size: 14px;
  }

  .form-container input[type="submit"] {
    background-color: black;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease;
    display: block;
    margin: 0 auto;
  }

  .form-container input[type="submit"]:hover {
    background-color: #333;
  }
</style>

<div class="form-container">
  <h2>Bank User Form</h2>
  <form id="bankUserForm" action="submit_form" method="POST">
    <label for="busr_id">User ID:</label>
    <input type="text" id="busr_id" name="busr_id" required>

    <label for="busr_title">Title:</label>
    <input type="text" id="busr_title" name="busr_title" required>

    <label for="busr_desg">Designation:</label>
    <input type="text" id="busr_desg" name="busr_desg" required>

    <input type="submit" value="Submit"><br>
    <div id="successMessage" style="display: none;"></div>
  </form>
</div>

<script>
$(document).ready(function() {
    $('#bankUserForm').submit(function(event) {
        event.preventDefault(); // Prevent default form submission

        var form = $(this);
        $.ajax({
            type: form.attr('method'),
            url: form.attr('action'),
            data: form.serialize(),
            success: function(response) {
                $('#successMessage').text(response).show();
                form.trigger('reset'); // Optional: Reset the form after successful submission
            },
            error: function() {
                alert('An error occurred.'); // Handle error case if needed
            }
        });
    });
});
</script>
