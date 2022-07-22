<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<title>update skill</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<%
    Class.forName("org.postgresql.Driver");
	String url="jdbc:postgresql://ec2-107-22-122-106.compute-1.amazonaws.com/d1b0par7a0st19";
	String user="lkdyrtnkvudsec";
	String password="620bf7c7c2a55a4f7f8c2e4bbffd66da99e55f81ab3da479df875a1ca3b55be7";

	int id=Integer.parseInt(request.getParameter("id"));
    String sql= "SELECT * FROM skills WHERE skillid ='"+ id +"'" ;
    Connection con=DriverManager.getConnection(url, user, password);
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery(sql);
    while(rs.next())
    {
	%>

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
	password="620bf7c7c2a55a4f7f8c2e4bbffd66da99e55f81ab3da479df875a1ca3b55be7"
/>
		
<sql:query dataSource="${ic}" var="oc">
   			SELECT *
		    from skills
		    WHERE skillid=<%=rs.getInt("skillid")%>
</sql:query>
<%-- 
<%=rs.getInt("skillid")%>
<%=rs.getInt("skillid")%>
<%=rs.getInt("skillid")%>
${skill.skillID}
${skill.skillID}
${skill.skillID}
--%>
<%-- 
	<input type="text" name="skillid" value="<%=rs.getInt("skillid")%>">
	--%>
	<%} %>
		
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
				<input type="submit" value="Update Skill">
			<a href="trainerviewskill.jsp">Cancel</a>
		</form>
		</c:forEach>
	</section>

</body>
</html>

