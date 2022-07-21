<!DOCTYPE html>
<html>
<head>
	<title>Trainer homepage</title>
	<meta charset="UTF-8">
   </head>
<body>
  <%--
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");

    if(session.getAttribute("trainerID")==null)
        response.sendRedirect("trainerlogin.jsp");
  --%>

  <section>
        <div>
	        <header>Homepage</header>
	        <br><br>
	        <a href="trainerviewtraining.jsp" >View Training</a>
	        <a href="trainerviewskill.jsp" >View Skill</a>
	        <a href="trainerviewaccount.jsp" >View Account</a>
	        <a href="trainerviewclient.jsp">View Client</a>
	         <a href="trainercreatetraining.jsp">Create Training</a>
	         <a href="trainercreateskill.jsp">create skill</a>
	    </div>
  </section>
</body>
</html>

