<%-- 
    Document   : deleteitem_hostel_DAO
    Created on : 11-Sep-2022, 11:29:29 pm
    Author     : LAPPI_2.O
--%>
<%
    if(session.getAttribute("email")==null)
    {
        response.sendRedirect("login_hostel.jsp");
    }
%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>


<%
    
    Integer id=Integer.parseInt(request.getParameter("id"));
%>
<%
    try
            {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject","root","");
                String qry2="DELETE FROM `products` WHERE id=?";
                PreparedStatement p1= con.prepareStatement(qry2);
                p1.setInt(1,id);
                 
                int i=p1.executeUpdate();
                if(i>0)
            {
                %>
               <script>
		alert("Item Deleted Successfully");
		window.open('showitem_hostel.jsp','_self');
		</script>
            <%
            }           

                
                
            }
            catch(Exception e)
            {
                System.out.println(e);
                
            }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
