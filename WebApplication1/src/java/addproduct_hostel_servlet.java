/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LAPPI_2.O
 */
@MultipartConfig 

@WebServlet(urlPatterns = {"/addproduct_hostel_servlet"})
public class addproduct_hostel_servlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
         
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addproduct_hostel_servlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addproduct_hostel_servlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        
    //System.out.println("ssdf");
   HttpSession session= request.getSession();
    
   String email=(String)session.getAttribute("email");
   
    
    
    String iname=request.getParameter("iname");
    String idesc=request.getParameter("idesc");
    String pno=request.getParameter("con");
        
    Part file=request.getPart("img");
    //its parameter
    String imgfilename=file.getSubmittedFileName();
    
    //path
    imgfilename=iname+imgfilename;
    
    //change this path according to the desired location of th project
    String imgpath="C:/Users/LAPPI_2.O/Documents/NetBeansProjects/WebApplication1/web/hostel_uploaded_img/"+imgfilename;
    
    
    //moving file
    try
    {
        FileOutputStream fos=new FileOutputStream(imgpath);
    
    InputStream is=file.getInputStream();
    
    byte[] data= new byte[is.available()];
    
    is.read(data);
    
    fos.write(data);
    
    fos.close();

    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
        
    
    //jdbc
    
    
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
           p.setString(5,imgfilename);
           
         
           
          int r= p.executeUpdate();
          
          if(r>0)
          {
               try ( PrintWriter out = response.getWriter())
               {
                   out.println("<script>");
                   out.println("alert(\"Item Added Successfully\")");
                   out.println("window.open('showitem_hostel.jsp','_self')");
                   out.println("</script>");
               }
              
                
		
		//window.open('addproduct_hostel.jsp','_self');
		
              
           //    response.sendRedirect("home_hostel.jsp");
          }
          
           }
           catch(Exception e)
           {
              System.out.println(e);
            }
    
    
    
    
    
    
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
