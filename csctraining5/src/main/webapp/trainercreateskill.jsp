<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<title>create skill</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

	<%--
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("trainerID")==null)
    response.sendRedirect("trainerlogin.jsp"); --%>

	<section>
		<header>add skill</header>
		<form action="SkillController" method="post">

			<label>skill Name</label> <input type="text" name="skillName">
			<br> <label>SKill description</label> <input type="text"
				name="skillDesc"><br>
			<div>
				<label>Type</label> <select name="skillType">
					<option disabled selected>choose type</option>
					<option value="Balancing">Balancing</option>
					<option value="Running">Running</option>
					<option value="Leaping">Leaping</option>
					<option value="Galloping">Galloping</option>
					<option value="Skipping">Skipping</option>
				</select>
			</div>
			<label>Skill price</label> <input type="text" name="skillPrice"><br>

			<input type="hidden" name="action" value="createskill">
			<div>
				<input type="submit" value="Create Skill" formaction="SkillController">
			</div>
		</form>
	</section>

</body>
</html>

