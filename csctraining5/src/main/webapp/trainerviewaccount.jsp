<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<title>trainer view account</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

	<%--
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("trainerID")==null)
    response.sendRedirect("trainerlogin.jsp");
--%>

	<sql:setDataSource var="ic"
		driver="org.postgresql.Driver"
		url="jdbc:postgresql://ec2-107-22-122-106.compute-1.amazonaws.com/d1b0par7a0st19"
		user="lkdyrtnkvudsec"
		password="620bf7c7c2a55a4f7f8c2e4bbffd66da99e55f81ab3da479df875a1ca3b55be7" />

	<sql:query dataSource="${ic}" var="oc">
   			SELECT * from trainer
	</sql:query>


	<section>
		<c:forEach var="trainer" items="${oc.rows}">
			<form action="" method="post">
				<table>
					<tr>
						<th>no.</th>
						<th>name</th>
						<th>phone no</th>
						<th>email</th>
						<th>qualification</th>
						<th>update</th>
						<th>delete</th>
					</tr>
					<tr>
						<td>${trainer.trainerID}</td>
						<td>${trainer.trainerName}</td>
						<td>${trainer.trainerPhone}</td>
						<td>${trainer.trainerEmail}</td>
						<td>${trainer.trainerQualification}</td>
						<td><input type="hidden" name="clientID" value="${trainer.trainerID}"> 
						<a href="trainerupdateaccount.jsp">update</a></td>
						<td><input type="hidden" name="action" value="deletetrainer">
							<button formaction="TrainerController"
								onclick="return confirm('are you sure to delete account?');">delete</button></td>
					</tr>
				</table>
			</form>
		</c:forEach>
	</section>
</body>
</html>


