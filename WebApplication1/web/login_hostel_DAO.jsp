<%-- 
    Document   : login_hostel_DAO
    Created on : 11-Sep-2022, 12:05:20 am
    Author     : LAPPI_2.O
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
            String uname=request.getParameter("email");
            String pass=request.getParameter("pass");
            
    
            try
            {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject","root","");
            
            String qry="SELECT * FROM `hostel_registration` WHERE email="+"'"+uname+"' AND pass="+"'"+pass+"'";
            
            
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(qry);
            
             while(rs.next())
             {
                if(rs.getString("email").equals(uname) & rs.getString("pass").equals(pass) )
                {
                %>
                
                <script>
		alert("Login Successfully");
		window.open('addproduct_hostel.jsp','_self');
		</script>
                
                <%
                    
                    session.setAttribute("email", uname);
                }
                
             }
            
            }
            catch(Exception e)
            {
               System.out.println(e);
            }
%>
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <title>Hostel</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-sixteen.css">
    <link rel="stylesheet" href="assets/css/owl.css">

  </head>

  <body>

    

    <!-- Header -->
    <header class="">
      <nav class="navbar navbar-expand-lg">
        <div class="container">
          <a class="navbar-brand" href="index.html"><h2>Hostel <em>Sale</em></h2></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
              <li class="nav-item active">
                <a class="nav-link" href="index.html">Home
                  <span class="sr-only">(current)</span>
                </a>
              </li> 
              <li class="nav-item">
                <a class="nav-link" href="products.html">Items</a>
              </li>
              
              <li class="nav-item">
                <a class="nav-link" href="contact.html">Contact Us</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>

    <!-- Page Content -->
    
    

    <center>
      <br><br><br><br><br><br><br><br><br>
      <H1>Login Failed!!!</H1><br><br>
      <H1>Enter Correct Email Id Or Password </H1>
      <br><br>
      <a href="login_hostel.jsp">Click To Login Again</a>
    </center>

