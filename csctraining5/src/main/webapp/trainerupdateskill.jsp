<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
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

    if(session.getAttribute("trainerID")==null)
    response.sendRedirect("trainerlogin.jsp"); --%>
    
<sql:setDataSource var="ic" 
	driver="org.postgresql.Driver"
	url="jdbc:postgresql://ec2-107-22-122-106.compute-1.amazonaws.com/d1b0par7a0st19"
	user="lkdyrtnkvudsec"
	password="620bf7c7c2a55a4f7f8c2e4bbffd66da99e55f81ab3da479df875a1ca3b55be7"/>
		
<sql:query dataSource="${ic}" var="oc">
   			SELECT *
		    from skills
		    WHERE skillID=?
	</sql:query>
		
		
	<section>
	
		<header>update skill</header>
		<c:forEach var="skill" items="${oc.rows}">
		<form method="post">

			<label>skill Name</label> <input type="text" name="skillName" value="${skill.skillName}">
			<br> 
			<label>SKill description</label> <input type="text" name="skillDesc" value="${skill.skillDesc}">
			<br>
			<div>
				<label>Type</label> <select name="skillType">
					<option value="${skill.skillType}">${skill.skillType}</option>
					<option value="Balancing">Balancing</option>
					<option value="Running">Running</option>
					<option value="Leaping">Leaping</option>
					<option value="Galloping">Galloping</option>
					<option value="Skipping">Skipping</option>
				</select>
			</div>
			<label>Skill price</label> <input type="text" name="skillPrice" value="${skill.skillPrice}"><br>

			<input type="hidden" name="action" value="updateskill">
			<div>
				<input type="submit" value="Update Skill" formaction="SkillController">
			</div>
			<a href="trainerviewskill.jsp">Cancel</a>
		</form>
		</c:forEach>
	</section>

</body>
</html>

