<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title> client View training </title>
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

<sql:setDataSource var="ic" 
	driver="org.postgresql.Driver"
	url = "jdbc:postgresql://ec2-107-22-122-106.compute-1.amazonaws.com/d1b0par7a0st19"
	user = "lkdyrtnkvudsec"
	password = "620bf7c7c2a55a4f7f8c2e4bbffd66da99e55f81ab3da479df875a1ca3b55be7"/>

	<sql:query dataSource="${ic}" var="trainingList">
		SELECT * 
		FROM client c
		JOIN training t
		on c.clientid = t.playerid
		join skills s
		on t.skillid=s.skillid
	</sql:query>

<section class="home-section">
  <a href="homepagetrainer.jsp" >homepage</a>
  <a href="trainerviewskill.jsp" >view skill</a>
  <a href="trainerviewaccount.jsp" >view account</a>
  <div class="home-content">
        <a href="trainercreatetraining.jsp">add training session</a>
        <header>training list</header>
        <form action="TrainingController" method="post">
      <table>
        <tr>
          <th>NO.</th>
          <th>training Venue</th>
          <th>Start Date</th>
          <th>End Date</th>
          <th>Skill</th>
          <th>Player</th>
          <th>Update</th>
          <th>delete</th>
        </tr>
        <c:forEach var="result" items="${trainingList.rows}">
            <tr>
              <td>${result.trainingID}</td>
              <td>${result.trainingVenue}</td>
              <td>${result.startDate}</td>
              <td>${result.endDate}</td>
              <td>${result.skillName}</td>
              <td>${result.clientName}</td>
              <td><input type="hidden" name="trainingID" value="${result.trainingID}">
              <a href="trainerupdatetraining.jsp?trid=${result.trainingID}">update</a></td>
              <td>
              <td>
	              <input type="hidden" name="trainingID" value="${result.trainingID}">
	              <a href="trainerupdatetraining.jsp?trid=${result.trainingID}">update</a></td>
              <td>
                <input type="hidden" name="action" value="deletetraining">
                <button formaction="TrainingController"  onclick="return confirm('Confirm to delete this training session?')">Delete</button>
              </td>
            </tr>
          
        </c:forEach>
      </table>
      </form>
    </div>
</section>
</body>
</html> 