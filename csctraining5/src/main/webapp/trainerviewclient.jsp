<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
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

<sql:query dataSource="${ic}" var="oc">

  SELECT row_number() over () "rank",clientID,clientName,clientAge,clientPhoneno,clientEmail from client
</sql:query>

<section class="home-section">
  <a href="homepagetrainer.jsp" >homepage</a>
  <a href="trainerviewskill.jsp" >view skill</a>
  <a href="trainerviewaccount.jsp" >view account</a>
  <a href="trainerviewtraining.jsp" >view training</a>
  <div class="home-content">
        <a href="clientcreatetraining.jsp"><button>add training session</button></a>
        <header>training list</header>
     <form method="post">
      <table>
        <tr>
          <th>NO.</th>
          <th>name</th>
          <th>age</th>
          <th>phone</th>
          <th>email</th>
          <th>update</th>
          <th>delete</th>
        </tr>
        <c:forEach var="result" items="${oc.rows}">
            <tr>
              <td>${result.rank}</td>
              <td>${result.clientName}</td>
              <td>${result.clientAge}</td>
              <td>${result.clientPhoneno}</td>
              <td>${result.clientEmail}</td>
              <td> <input type="hidden" name="clientID" value="${result.clientID}"> <a href="trainerupdateclient.jsp">update</a></td>
              <td> <input type="hidden" name="action" value="deletetraining">
                <button formaction="TrainingController"  onclick="return confirm('Confirm to delete this client account?')">Delete</button>
              </td>
            </tr>
         	
        </c:forEach>
      </table>
     </form>
    </div>
</section>
</body>
</html> 