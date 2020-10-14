<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css" integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous">
  <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
   
    <title>Ecommerce Website</title>
  </head>
  <style>

      .cust_bord{
          border-radius: 30px;
          border: 1px solid darkgray;
          padding: 10px;
          box-shadow: 10px 10px 5px darkgrey;
      }
  </style>
  <body class="bg-dark">

    <div class="container">
    <%
   			response.setHeader("Cache-Control", "no-cache,no-store, must-revalidate");
   			response.setHeader("Pragma", "no-cache");
   			response.setHeader("Expires", "0");
   			 %>
         <br>
        <form class="row g-3 needs-validation bg-dark text-white cust_bord m-2" action="add_user" method="post" novalidate>
          <div class="bg-dark">
            <h2 class="text-center text-decoration-underline">Registration</h2>
          </div> 
          <div class="col-md-4 position-relative">
              <label for="validationTooltip01" class="form-label">First name</label>
              <input type="text" class="form-control" name="first_name" id="validationTooltip01"required>
              <div class="valid-tooltip">
                Looks good!
              </div>
            </div>
            <div class="col-md-4 position-relative">
              <label for="validationTooltip02" class="form-label">Last name</label>
              <input type="text" class="form-control" name="last_name" id="validationTooltip02"  required>
              <div class="valid-tooltip">
                Looks good!
              </div>
            </div>
        <div class="col-md-4 position-relative">
              <label for="validationTooltipUsername" class="form-label">Username</label>
              <div class="input-group">
                <span class="input-group-text" id="validationTooltipUsernamePrepend"><i class="fa fa-user "></i></span>
                <input type="text" class="form-control" name="username" id="validationTooltipUsername" aria-describedby="validationTooltipUsernamePrepend" required>
                <div class="invalid-tooltip">
                  Please choose a unique and valid username.
                </div>
              </div>
            </div>
            <div class="col-md-5 position-relative">
              <label for="validationTooltipUsername" class="form-label">Password</label>
              <div class="input-group">
                <span class="input-group-text" id="validationTooltipUsernamePrepend"><i class="fa fa-lock "></i></span>
                <input type="password" class="form-control" name="password" id="validationTooltipUsername" aria-describedby="validationTooltipUsernamePrepend" required>
                <div class="invalid-tooltip">
                  Please choose a unique and valid password.
                </div>
              </div>
            </div>
            <div class="col-md-4 position-relative">
              <label for="validationTooltip03" class="form-label">City</label>
              <input type="text" class="form-control" name="city" id="validationTooltip03" required>
              <div class="invalid-tooltip">
                Please provide a valid city.
              </div>
            </div>
            <div class="col-md-3 position-relative">
              <label for="validationTooltip04" class="form-label">State</label>
              <select class="form-select" name="state" id="validationTooltip04" required>
                <option selected disabled value="">Choose...</option>
                <option>Madhya Pradesh</option>
                <option>Chattishgarh</option>
                <option>Tamil Nadu</option>
                <option>Uttar pradesh</option>
              </select>
              <div class="invalid-tooltip">
                Please select a valid state.
              </div>
            </div>
            <div class="col-md-3 position-relative">
              <label for="validationTooltip05" class="form-label">Zip</label>
              <input type="text" class="form-control" name="zip" id="validationTooltip05" required>
              <div class="invalid-tooltip">
                Please provide a valid zip.
              </div>
            </div>
            <div class="col-md-9 position-relative">
                <label for="validationTooltip06" class="form-label">Address</label>
                <textarea class="form-control" name="address"  id="validationTooltip06" style="resize:none;"  required></textarea>
                <div class="invalid-tooltip">
                  Please enter a address.
                </div>
              </div>
            <div class="col-12 text-center">
              <button class="btn btn-primary" type="submit">Register</button>
            </div>
          </form>
          <br>
    </div>


    <script>
        (function () {
            'use strict'
          
            // Fetch all the forms we want to apply custom Bootstrap validation styles to
            var forms = document.querySelectorAll('.needs-validation')
          
            // Loop over them and prevent submission
            Array.prototype.slice.call(forms)
              .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                  if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                  }
          
                  form.classList.add('was-validated')
                }, false)
              })
          })()
    </script>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  </body>
</html>