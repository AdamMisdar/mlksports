<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title> client View training </title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="style.css">
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
	

<input type="checkbox" id="check">
<!--header area start-->
<header>
  <label for="check">
    <i class="fas fa-bars" id="sidebar_btn"></i>
  </label>
  <div class="left_area">
    <h3>MLK SPORT </h3>
  </div>

</header>
<!--header area end-->
<!--mobile navigation bar start-->
<div class="mobile_nav">
  <div class="nav_bar">
    <img src="logo.png" class="mobile_profile_image" alt="">
    <i class="fa fa-bars nav_btn"></i>
  </div>
 
 
</div>
<!--mobile navigation bar end-->
<!--sidebar start-->
<div class="sidebar">
  <div class="profile_info">
    <img src="logo.png" class="profile_image" alt="">
   
  </div>
  <a href="homepagetrainer.jsp"><i class="fas fa-home"></i><span>Home</span></a>
    <a href="trainerviewtraining.jsp"><i class="fas fa-clipboard-list"></i><span>Training</span></a>
    <a href="trainerviewskill.jsp"><i class="fas fa-list-alt"></i><span>Skill</span></a>
   
    <a href="trainerviewaccount.jsp"><i class="fas fa-users-cog"></i><span>Account</span></a>
    <a href="trainerviewclient.jsp"><i class="fas fa-users"></i><span>Client</span></a>
   
    <a href="LoginHandler?action=logout" onclick="checkerlogout()" id="logout" onclick="location.href='LoginHandler?action=logout'"><i class="fas fa-sign-out-alt"></i><span> Log Out</span></a>
  
  
</div>

<section class="home-section">
 
 <div class="content">
    <h1>Training List</h1>
    <div class="content-container">
    
  <div class="home-content">
        <button class="buttonadd" style="margin-bottom:10px;" onclick="location.href='trainercreatetraining.jsp'">Add Training Session</button>
        <header>training list</header>
        <form action="TrainingController" method="post">
      <table  class="content-table">
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
              <a href="trainerupdatetraining.jsp?trid=${result.trainingID}">Update</a></td>
              <td>
             
                <input type="hidden" name="action" value="deletetraining">
                <button formaction="TrainingController" class="buttondelete" onclick="return confirm('Confirm to delete this training session?')">Delete</button>
              </td>
            </tr>
          
        </c:forEach>
      </table>
      </form>
    </div>
    </div>
    </div>
</section>
</body>
</html> 