<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title> Update training</title>
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
		
<sql:query dataSource="${ic}" var="od">
   			SELECT *
		    from training
		    WHERE trainerID=?
	</sql:query>

<a href="homepagetrainer.jsp">homepage</a>
	<sql:query dataSource="${ic}" var="oc">
  SELECT *
  FROM skills
</sql:query>

<sql:query dataSource="${ic}" var="ov">
  SELECT *
  FROM trainer
</sql:query>

<sql:query dataSource="${ic}" var="ox">
  SELECT *
  FROM client
</sql:query>

	<section>
	<c:forEach var="training" items="${od.rows}">
				<header >make training session</header>
					<form method="post" action="TrainingController">
							<div>
								<span>Training Sports</span>
								<input type="text" name="trainingSports" value="${$training.trainingSports}">
							</div>
							<div>
								<span>Start Date</span> 
								<input type="date" name="startDate" value="${$training.startDate}">
							</div>
							<div >
								<span>End Date</span> 
								<input type="date" name="endDate" value="${$training.endDate}">
							</div>
							<div>
								<span>Training Venue</span>
								<select name="trainingVenue">
									<option value="${training.trainingVenue}">${training.trainingVenue}</option>
									<option value="Petaling Jaya">Petaling Jaya</option>
									<option value="Jasin">Jasin</option>
								</select>
							</div>
							<div>
								<span>Skill : </span>
								<select name="skillID">
									<c:forEach items="${oc.rows}" var="skill">
										<option value="<c:out value="${skill.SkillID}"/>"><c:out value="${skill.skillName}" /></option>
									</c:forEach>
								</select>
							</div>
							<div >
								<span>Trainer : </span> 
								<select name="trainerID">
									<c:forEach items="${ov.rows}" var="trainer">
										<option value="<c:out value="${trainer.trainerID}"/>"><c:out value="${trainer.trainerName}"/></option>
									</c:forEach>
								</select>
							</div>
						<div >
								<span>Player : </span> 
								<select name="clientID">
									<c:forEach items="${ox.rows}" var="client">
										<option value="<c:out value="${client.clientID}"/>"><c:out value="${client.clientName}"/></option>
									</c:forEach>
								</select>
							</div>
						<input type="hidden" name="action" value="updatetraining">
						<div>
							<input type="submit" value="Book" >
						</div>
					</form>
					</c:forEach>
			
	</section>
</body>
</html>


