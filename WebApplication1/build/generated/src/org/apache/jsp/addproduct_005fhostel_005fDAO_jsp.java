package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class addproduct_005fhostel_005fDAO_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');

    if(session.getAttribute("email")==null)
    {
        response.sendRedirect("../login.jsp");
    }

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    String email="email";
    
    String iname=request.getParameter("iname");
    String idesc=request.getParameter("idesc");
    String pno=request.getParameter("con");
    
    
    String tempimg="temp";
    
    //img name
   // Part file=request.getPart("img");
    //its parameter
    //String imgfilename=file.getSubmittedFileName();
    
    //path
    //imgfilename=imgfilename+iname;
    
    //change this path according to the desired location of th project
    //String imgpath="C:/Users/LAPPI_2.O/Documents/NetBeansProjects/WebApplication1/web/hostel_uploaded_img/"+imgfilename;
    
   

      out.write('\n');
      out.write('\n');

            try
            {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/webproject","root","");
            
            String qry="INSERT INTO `products`( `uemail`, `itemname`, `itemdesc`, `contactdet`, `img`) VALUES (?,?,?,?,?)";
            PreparedStatement p= con.prepareStatement(qry);
         
            p.setString(1,email);
            p.setString(2,iname);
            p.setString(3,idesc);
            p.setString(4,pno);
           p.setString(5,tempimg);
            //p.setString(6,email);
         
           
           p.executeUpdate();
          
           }
           catch(Exception e)
           {
              System.out.println(e);
            }
            
 
      out.write("\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Hello World! yes</h1>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
