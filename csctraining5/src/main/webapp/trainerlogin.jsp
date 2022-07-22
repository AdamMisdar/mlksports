<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <title> trainer login </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   </head>
    <style>
        * {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
body {
  background: url('https://images7.alphacoders.com/932/932701.jpg') no-repeat center;
  background-size: cover;
  font-family: sans-serif;
}
.login-wrapper {
  height: 100vh;
  width: 100vw;
  display: flex;
  justify-content: center;
  align-items: center;
}
.form {
  position: relative;
  width: 100%;
  max-width: 380px;
  padding: 80px 40px 40px;
  background: rgba(0,0,0,0.7);
  border-radius: 10px;
  color: #fff;
  box-shadow: 0 15px 25px rgba(0,0,0,0.5);
}
.form::before {
  content:'';
  position: absolute;
  top: 0;
  left: 0;
  width: 50%;
  height: 100%;
  background: rgba(255,255,255, 0.08);
  transform: skewX(-26deg);
  transform-origin: bottom left;
  border-radius: 10px;
  pointer-events: none;
}
.form img {
  position: absolute;
  top: -50px;
  left: calc(50% - 50px);
  width: 100px;
  background: rgba(255,255,255, 0.8);
  border-radius: 50%;
}
.form h2 {
  text-align: center;
  letter-spacing: 1px;
  margin-bottom: 2rem;
  color: #ff652f;
}
.form .input-group {
  position: relative;
}
.form .input-group input {
  width: 100%;
  padding: 10px 0;
  font-size: 1rem;
  letter-spacing: 1px;
  margin-bottom: 30px;
  border: none;
  border-bottom: 1px solid #fff;
  outline: none;
  background-color: transparent;
  color: inherit;
}
.form .input-group label {
  position: absolute;
  top: 0;
  left: 0;
  padding: 10px 0;
  font-size: 1rem;
  pointer-events: none;
  transition: .3s ease-out;
}
.form .input-group input:focus + label,
.form .input-group input:valid + label {
  transform: translateY(-18px);
  color: #ff652f;
  font-size: .8rem;
}
.submit-btn {
  display: block;
  margin-left: auto;
  border: none;
  outline: none;
  background: #ff652f;
  font-size: 1rem;
  text-transform: uppercase;
  letter-spacing: 1px;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
}
.sign-up {
  color: inherit;
}

#sign-up {
  position: absolute;
  display: flex;
  justify-content: center;
  align-items: center;
  top: 0;
  left: 0;
  right: 0;
  height: 0;
  z-index: 1;
  background: rgb(1, 11, 39);
  opacity: 0;
  transition: 0.6s;
}
#sign-up:target {
  height: 100%;
  opacity: 1;
}
.close {
  position: absolute;
  right: 1.5rem;
  top: 0.5rem;
  font-size: 2rem;
  font-weight: 900;
  text-decoration: none;
  color: inherit;
}
    </style>

<body>
  
  <section>
  <div class="login-wrapper" >
    <form action="TrainerController" method="POST" class="form">
      <img src="data:image/png;base64,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" alt="">
      <h2>Login</h2>
     
      <div class="input-group">
        <input type="text" name="trainerEmail" placeholder="Email" required>
        <label for="trainerEmail">Email</label>
      </div>
      <div class="input-group">
        <input type="password" name="trainerpassword" placeholder="Password" required>
        <label for="trainerPassword">Password</label>
      </div>
      <div class="input-box button">
      <input type="hidden" name="action" value="logintrainer">
      <input style="display: flex;
    background-color: rgb(0, 128, 85);
    width: 150px;
    height: 50px;
    text-align: justify;
    padding: auto;
    align-items: center;
    justify-content: center;
    position: relative;
    color: white;
    border: transparent;
    border-radius: 10px;
    margin: auto;
    margin-top:10px;
    font-size: 0.9em;" type="submit" name="submit" value="Login">
      
      </div>
      
      <a href="trainercreateaccount.jsp" class="sign-up">Sign Up</a>
    </form>
    </div>
          
          
  </section>
</body>
</html>

