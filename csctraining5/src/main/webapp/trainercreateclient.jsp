<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title> Update create client </title>
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<%--
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("trainerID")==null)
    response.sendRedirect("trainerlogin.jsp"); --%>
<a href="homepagetrainer.jsp">homepage</a>
	<section>
			<form method="post">
			<div>
				<div>
					<label>Name</label> 
					<input type="text" name="clientName" required>
					<br>
					<label class="details">phone</label> 
					<input type="text" name="clientPhone" pattern="[0-9]{3}-[0-9]{7}" placeholder="xxx-xxxxxxx" required>
					<br>
					<label class="details">Email</label>
					<input type="email" name="clientEmail" required>
					<br>
					<label class="details">Qualifications : </label>
					<input type="text" name="clientAge" required>
					<br>
					<label class="details">Password : </label>
					<input type="password" name="clientPassword"required>
				</div>
				
				<input type="hidden" name="action" value="createclient">
			<div>
				<input type="submit" value="Register Client" formaction="ClientController">
			</div>
					<a href="homepagetrainer.jsp">Cancel</a>
				</div>
			</form>
	</section>
</body>
</html>


