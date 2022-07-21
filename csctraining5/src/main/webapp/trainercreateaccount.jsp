<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<title>trainer create account</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<section>
		<header>register account</header>

		<form action="TrainerController" method="post" action="TrainerController">


			<div>
				<div>
					<label>Name : </label> 
					<input type="text" name="trainerName" required>
					<br>
					<label>phone</label> 
					<input type="text" name="trainerPhone" pattern="[0-9]{3}-[0-9]{7}" placeholder="xxx-xxxxxxx" required>
					<br>
					<label>Email</label>
					<input type="email" name="trainerEmail" required>
					<br>
					<label>Qualifications : </label>
					<input type="text" name="trainerQualification" required>
					<br>
					<label>Password : </label>
					<input type="password" name="trainerPassword" required>
				</div>
				
				<div>
					<input type="hidden" name="action" value="signuptrainer">

						<input type="submit" value="register" >
					
				</div>


			</div>
		</form>
	</section>
</body>
</html>


