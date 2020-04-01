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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SOM
 */
public class verifyotp1 extends HttpServlet {

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
        try  {
             Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/zipzapzoom","root","");
 
           PreparedStatement ps=con.prepareStatement("select value from otp where emailaddress=? and oid=?");
           // ps.setString(1,oid);
            ps.setString(1,request.getParameter("email"));
            
            ps.setString(2,request.getParameter("oid"));
            ResultSet rs=ps.executeQuery();
            int otp=Integer.parseInt(request.getParameter("otp"));
            while(rs.next()){
                    if(rs.getInt(1)==otp){
                        out.println("Verified");
                        PreparedStatement ps1 = con.prepareStatement("update query_table set status=? where oid=? ");
            
            ps1.setString(1,"f");
          
            ps1.setString(2,request.getParameter("oid"));
            int n=ps1.executeUpdate();
                    }else{
                        out.println("Incorrect enter again");
                    }}
            //out.println("hh");
        }catch(Exception  e ){
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
