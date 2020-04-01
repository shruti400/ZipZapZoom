/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import connection.MyCon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Raja
 */
public class up_q extends HttpServlet {

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
            out.println("dikkat hai kuch");
            int price=Integer.parseInt(request.getParameter("price"));
            String oid=request.getParameter("oid");
            String email=request.getParameter("email");
           
            String expected_date=request.getParameter("expected_date");
            Connection con=MyCon.getConnection();
            PreparedStatement ps=con.prepareStatement("update query_table set price=?, expected_date=?,status=? where oid=?");
            ps.setInt(1,price);
            ps.setString(2,expected_date);
            ps.setString(3,"b");
            ps.setString(4,oid);
            out.println(oid);
           
            String msg="Your order "+oid+" has been reviewed. The maximum possible fair and expected date for delivery are "
                    +price+" and "+expected_date+" resp. ";
            PreparedStatement ps1=con.prepareStatement("insert into notification values(?,?,?) ");
               ps1.setString(1,email);
               ps1.setString(2,oid);
               ps1.setString(3,msg);
           
               if(ps1.executeUpdate()>0 && ps.executeUpdate()>0)
                    response.sendRedirect("aa_query.jsp");
               else
                out.println("dikkat hai kuch");
           
        }
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
            Logger.getLogger(up_q.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(up_q.class.getName()).log(Level.SEVERE, null, ex);
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
