<!DOCTYPE html>
<html>
<head>
  <meta name="_csrf" content="${_csrf.token}"/>
  <meta name="_csrf_header" content="${_csrf.headerName}"/>
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

    .form-container label.required::after {
      content: "*";
      color: red;
    }

    .form-container input[type="text"],
    .form-container input[type="email"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
      font-size: 14px;
    }

    .form-container select {
      width: 100%;
      padding: 10px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
      font-size: 14px;
      appearance: none;
      -webkit-appearance: none;
      -moz-appearance: none;
      background-image: url("data:image/svg+xml;charset=utf-8,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='%23333' width='18px' height='18px'%3E%3Cpath d='M7 10l5 5 5-5z'/%3E%3C/svg%3E");
      background-repeat: no-repeat;
      background-position: right 8px center;
      background-size: 12px;
      padding-right: 30px;
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

    #successMessage {
      text-align: center;
      margin-top: 20px;
      font-weight: bold;
      color: green;
      display: none;
    }
  </style>
</head>
<body>
  <div class="form-container">
    <h2>Bank User Form</h2>
    <form id="bankUserForm" method="POST">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      <label for="busr_title" class="required">Name:</label>
      <input type="text" id="busr_title" name="busr_title" placeholder="Enter your name" required>

      <label for="busr_desg" class="required">Designation:</label>
      <select id="busr_desg" name="busr_desg" required>
        <option value="" disabled selected>Select Designation</option>
        <option value="Manager">Manager</option>
        <option value="Account Processing">Account Processing</option>
        <option value="Clerk">Clerk</option>
        <option value="Bank Officer">Bank Officer</option>
      </select>

      <label for="busr_email" class="required">Email:</label>
      <input type="email" id="busr_email" name="busr_email" placeholder="Enter your email" required>

      <input type="submit" value="Submit"><br>
      <div id="successMessage"></div>
    </form>
  </div>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
    $(document).ready(function() {
      $('#bankUserForm').submit(function(event) {
        event.preventDefault(); // Prevent default form submission

        var form = $(this);
        var csrfToken = $('meta[name="_csrf"]').attr('content');
        var csrfHeader = $('meta[name="_csrf_header"]').attr('content');

        // Create the BankUser object with form values
        var bankUser = {
          busr_title: $('#busr_title').val(),
          busr_desg: $('#busr_desg').val(),
          busr_email: $('#busr_email').val()
        };

        $.ajax({
          type: 'post',
          url: 'submit_form',
          data : bankUser ,
          beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeader, csrfToken);
          },
          success: function(response) {
            $('#successMessage').text(response).fadeIn();

            setTimeout(function() {
              $('#successMessage').fadeOut();
            }, 3000);

            form.trigger('reset'); // Optional: Reset the form after successful submission
          },
          error: function() {
            alert('An error occurred.'); // Handle error case if needed
          }
        });
      });

      $('#busr_desg').change(function() {
        if ($(this).val() !== "") {
          $(this).find('option:first').attr('disabled', true).hide();
        }
      });
    });
  </script>
</body>
</html>
