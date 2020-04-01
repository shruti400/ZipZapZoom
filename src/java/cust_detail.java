/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import connection.MyCon;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
/**
 *
 * @author Raja
 */



public class cust_detail extends HttpServlet {

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
        InputStream inputStream = null; // input stream of the upload file
PrintWriter out = response.getWriter();
        // obtains the upload file part in this multipart request
//       Part filePart = request.getPart("id_proof");
//        if (filePart != null) {
//            // prints out some information for debugging
//            System.out.println(filePart.getName());
//            System.out.println(filePart.getSize());
//            System.out.println(filePart.getContentType());
//
//            // obtains input stream of the upload file
//            inputStream = filePart.getInputStream();
//        }
        try  {
            /* TODO output your page here. You may use following sample code. */
               Connection con=MyCon.getConnection();
               PreparedStatement ps=con.prepareStatement("insert into trial_customer values (?,?,?,?,?);");
                ps.setString(1,request.getParameter("email"));       
                ps.setString(2,request.getParameter("name"));
                ps.setString(3,request.getParameter("ph_num"));
               ps.setString(4,request.getParameter("id_proof"));
                ps.setString(5,request.getParameter("password"));
//                  if (inputStream != null) {
//                // fetches input stream of the upload file for the blob column
//                ps.setBlob( 4,inputStream);//Store File URL into DB
//                  }
                if(ps.executeUpdate()>0){
                    response.sendRedirect("cust_login.jsp");
                }
                else
                    out.println("zaid");
            }
        catch(Exception e){
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(cust_detail.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(cust_detail.class.getName()).log(Level.SEVERE, null, ex);
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
