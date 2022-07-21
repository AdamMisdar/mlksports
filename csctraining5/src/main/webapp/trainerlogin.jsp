<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> trainer login </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>

<body>
  
  <section>
          
          <form action="TrainerController" method="POST">
            <input type="text" name="trainerEmail" placeholder="Email" required>
            <input type="password" name="trainerpassword" placeholder="Password" required>
            <div class="input-box button">
              <input type="hidden" name="action" value="logintrainer">
              <input type="submit" name="submit" value="Login">
            </div>
            <div class="login-signup">
                or 
                  
                  <a href="trainercreateaccount.jsp">create account</a>
                
            </div>
          </form>
  </section>
</body>
</html>

