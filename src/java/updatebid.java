/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SOM
 */
public class updatebid extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            String oid=request.getParameter("oid");     
            int currentprice=Integer.parseInt(request.getParameter("price"));      
            HttpSession session=request.getSession();
            Class.forName("com.mysql.jdbc.Driver");
            //Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ora", "mysh", "myshop");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zipzapzoom","root","");
           
            PreparedStatement ps=con.prepareStatement("select price,emailaddress from bidinglog where oid=?");
            ps.setString(1, oid);
            ResultSet rs=ps.executeQuery();
            int price=0;
            String name="";
            while(rs.next()){
                 price=rs.getInt(1);
                name=rs.getString(2);
            }
            if(currentprice<price){
                String emailaddress=(String)session.getAttribute("email");
                 PreparedStatement ps1=con.prepareStatement("update bidinglog set price=?,emailaddress=? where oid=?");
                  ps1.setInt(1, currentprice);
                   ps1.setString(2, emailaddress);
                 ps1.setString(3, oid);
            int n=ps1.executeUpdate();
                
//                out.println(currentprice+" "+emailaddress);
                out.println("<table class='table table-bordered table-hover'>");
                out.println("     <tbody>");
               out.println("  <tr >");
        out.println("<td class='success'>Current Bid</td>");
        out.println("<td class='success'>"+currentprice+"</td>");
         out.println("<td class='info'>Transporter</td>");
        out.println("<td class='info'>  "+emailaddress+"</td>");
                 out.println("</tr>");
                    out.println(" </tbody>");
                 out.println("</table>");
            }else{
                out.println("<table class='table table-bordered table-hover'>");
                     out.println("<tbody>");
                 out.println("<tr >");
        out.println("<td class='success'>Current Bid</td>");
        out.println("<td class='success'>"+price+"</td>");
         out.println("<td class='info'>Transporter</td>");
        out.println("<td class='info'>"+name+"</td>");
                 out.println("</tr>");
                     out.println("</tbody>");
                out.println(" </table>");
//                out.println(price +" "+ name);
            }
            
        } catch(Exception e){
            out.println(e);
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
        processRequest(request, response);
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
