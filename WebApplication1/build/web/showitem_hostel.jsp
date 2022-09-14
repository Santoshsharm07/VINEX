<%
    if(session.getAttribute("email")==null)
    {
        response.sendRedirect("login_hostel.jsp");
    }
%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
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

    <!-- ***** Preloader Start ***** -->
    <div id="preloader">
        <div class="jumper">
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>  
    <!-- ***** Preloader End ***** -->

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
              <li class="nav-item ">
                <a class="nav-link" href="index.html">Home
                  <span class="sr-only">(current)</span>
                </a>
              </li> 
              <li class="nav-item active" >
                <a class="nav-link" href="products.html">Your Items</a>
              </li>
              <li class="nav-item ">
                <a class="nav-link" href="">Delete Items</a>
              </li>
             <li class="nav-item ">
                <a class="nav-link" href="">Logout</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>

    <!-- Page Content -->
    
    

    <center>
      <br><br><br><br><br><br>
      
    </center>
    
    


         
 <div>
	<center>
		
                <h2>Email: <%=(String)session.getAttribute("email") %></h2>
		
			<form action="" method="post">
				<table border='1' width='1000px' cellpadding='10' cellspacing='50' align='center' style="background-color:#ffffff">
					<tr>
						
                                            <td>
                                                <h4>ID</h4>
                                            </td>
                                            <td>
                                                <h4>Item Name</h4>
                                            </td>
                                            <td>
                                                <h4>Item Description</h4>
                                            </td>
                                             <td>
                                                <h4>Contact Details</h4>
                                            </td>
                                            <td>
                                                <h4>Image</h4>
                                            </td>
                              
					</tr>
	<%
            try
            {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject","root","");
            
            String qry="SELECT * FROM `products` WHERE uemail="+"'"+(String)session.getAttribute("email")+"'";
            
            
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(qry);
            
             while(rs.next())
             {
                
                
                %>
                <tr>
                    
                    <td>
                        <h3><%=rs.getInt("id") %></h3>
                    </td>
                    <td>
                        <h3><%=rs.getString("itemname") %></h3>
                    </td>
                    <td>
                        <h3><%=rs.getString("itemdesc") %></h3>
                    </td>
                    <td>
                        <h3><%=rs.getString("contactdet") %></h3>
                    </td>
                    <td>                     
                        
                         <h3><img src="hostel_uploaded_img/<%=rs.getString("img") %>" style="width:300px;height: 200px"></h3>
                    </td>
                </tr>
                
                
                <%
                
                
             }
            
            }
            catch(Exception e)
            {
               System.out.println(e);
            }
        %>
					
		
					</table>
				
			</form>
		</center>
	</div>
          
          
          

          
          


       



    

    
    


    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


    <!-- Additional Scripts -->
    <script src="assets/js/custom.js"></script>
    <script src="assets/js/owl.js"></script>
    <script src="assets/js/slick.js"></script>
    <script src="assets/js/isotope.js"></script>
    <script src="assets/js/accordions.js"></script>


    <script language = "text/Javascript"> 
      cleared[0] = cleared[1] = cleared[2] = 0; //set a cleared flag for each field
      function clearField(t){                   //declaring the array outside of the
      if(! cleared[t.id]){                      // function makes it static and global
          cleared[t.id] = 1;  // you could use true and false, but that's more typing
          t.value='';         // with more chance of typos
          t.style.color='#fff';
          }
      }
    </script>


  </body>

</html>
