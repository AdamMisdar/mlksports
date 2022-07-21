<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<title>update skill</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

	<%--
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("clientID")==null)
    response.sendRedirect("trainerlogin.jsp");
--%>

	<sql:setDataSource var="ic" driver="org.postgresql.Driver"
		url="jdbc:postgresql://ec2-107-22-122-106.compute-1.amazonaws.com/d1b0par7a0st19"
		user="lkdyrtnkvudsec"
		password="620bf7c7c2a55a4f7f8c2e4bbffd66da99e55f81ab3da479df875a1ca3b55be7" />

	<sql:query dataSource="${ic}" var="skill">
    SELECT * from skills
</sql:query>
	<a href="homepagetrainer.jsp">homepage</a>
	<a href="trainerviewskill.jsp">view skill</a>
	<a href="trainerviewaccount.jsp">view account</a>
	<a href="trainerviewtraining.jsp">view training</a>
	
	<section>

		<header>View skill</header>
		<c:forEach var="skill" items="${skill.rows}">
			<form method="post">
				<table>
					<tr>
						<th>NO.</th>
						<th>Skill Name</th>
						<th>Skill description</th>
						<th>Type</th>
						<th>Skill price</th>
						<th>Update</th>
						<th>Delete</th>
					</tr>
					<tr>

						<td>${skill.skillID}</td>
						<td>${skill.skillName}</td>
						<td>${skill.skillDesc}</td>
						<td>${skill.skillType}</td>
						<td>${skill.skillPrice}</td>
						<td>
							<button name="update" formaction="trainerupdateskill.jsp?id=${skill.skillID}">
							</button>
						</td>
						<td><input type="hidden" name="action" value="deleteskill">
							<button formaction="SkillController"
								onclick="return confirm('Confirm to delete this skill option?')">Delete</button>
						</td>
					</tr>
				</table>
			</form>
		</c:forEach>
	</section>

</body>
</html>

