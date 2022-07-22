<!---->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>


<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style2.css">
        <title>MLK SPORT Home</title>
        <link rel="stylesheet" href="bootstrap.min.css">
        <link rel="stylesheet" href="fontawesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans|Roboto" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        
    </head>
    <body>
     <nav class="navbar navbar-expand-lg navbar-light text-capitalize">
            <div class="container">
                
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#show-menu" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div style="color: white;">
                	<span>Welcome to MLK sports <br></span>
                </div>
                <div class="picture">
    
                <div class="collapse navbar-collapse" id="show-menu">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="homepagetrainer.jsp" >Laman Utama <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" type="submit" href="trainercreatetraining.jsp">Create Training</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="trainerviewaccount.jsp" >Account List</a>
                        </li>
                       
                        <li class="nav-item">
                            <a class="nav-link" href="trainerviewtraining.jsp" > Training List</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="trainerviewskill.jsp" > Skill List</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="trainerviewclient.jsp" > Client List</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="trainerlogin.jsp" ><i class="fas fa-sign-out-alt"></i> Log Keluar</a>
                        </li>
                        
        

                    </ul>
                    
                </div>
            </div>
            </div>
        </nav>
        
        
        
       
    </body>
</html>