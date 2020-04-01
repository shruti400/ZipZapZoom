/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import connection.MyCon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
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
 * @author Raja
 */
public class acc_up extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try  {
                        HttpSession session=request.getSession();
           String email=(String)session.getAttribute("email");
                String company_name=request.getParameter("company_name");
                String address=request.getParameter("address");
                String password=request.getParameter("password");
               Connection con =MyCon.getConnection();
               PreparedStatement ps=con.prepareStatement("update transportertemp set company_name=?,address=?,password=?  where emailaddress=?");
               ps.setString(1,company_name);
                ps.setString(2,address);
                ps.setString(3,password);
                ps.setString(4,email);
                if(ps.executeUpdate()>0){
                    out.println("<script>"
                            + "var x=document.getElementById('x'); var str='Account updated Successfully' x.innerHtml=str;"
                            + "</script>");
                }
                else{
                 out.println("<script>"
                            + "var x=document.getElementById('x'); var str='Account updat unsuccessfully' x.innerHtml=str;"
                            + "</script>");
                               }
              // HttpSession session=request.getSession();
               if(session.getAttribute("utype").equals("Transporter")){
                   response.sendRedirect("HomeTransporter.jsp");
               }
                else{
                         response.sendRedirect("cust_homepage.jsp");
                        }}
        catch(Exception e){
        out.println(e);}
                   
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(acc_up.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(acc_up.class.getName()).log(Level.SEVERE, null, ex);
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