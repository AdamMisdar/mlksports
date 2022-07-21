<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title> Update trainer Form </title>
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
	password ="620bf7c7c2a55a4f7f8c2e4bbffd66da99e55f81ab3da479df875a1ca3b55be7"/>
	
	
<sql:query dataSource="${ic}" var="oc">
   			SELECT * from trainer 
</sql:query>

<a href="homepagetrainer.jsp">homepage</a>
	<section>
			<form method="post">

<c:forEach var="trainer" items="${oc.rows}">
			<div>
				<div>
					<label>Name</label> 
					<input type="text" name="trainerName" value="${trainer.trainerName}">
					<br>
					<label class="details">phone</label> 
					<input type="text" name="trainerPhone" pattern="[0-9]{3}-[0-9]{7}" placeholder="xxx-xxxxxxx" value="${trainer.trainerPhone}">
					<br>
					<label class="details">Email</label>
					<input type="email" name="trainerEmail" value="${trainer.trainerEmail}">
					<br>
					<label class="details">Qualifications : </label>
					<input type="text" name="trainerQualification" value="${trainer.trainerQualifications}">
					<br>
					<label class="details">Password : </label>
					<input type="password" name="trainerPassword" value="${trainer.trainerPassword}">
				</div>
				
				<input type="hidden" name="action" value="updatetrainer">
			<div>
				<input type="submit" value="Update Skill" formaction="TrainerController">
			</div>
					<a href="trainerviewaccount.jsp">Cancel</a>
				</div>
				
</c:forEach> 
			</form>
	</section>
</body>
</html>


