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
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author SOM
 */
public class CheckUser extends HttpServlet {

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
            String uid=request.getParameter("email");      
            String pass=request.getParameter("password");      
            HttpSession session=request.getSession();
            Class.forName("com.mysql.jdbc.Driver");
            //Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ora", "mysh", "myshop");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zipzapzoom","root","");
           
            PreparedStatement ps=con.prepareStatement("select * from transportertemp where emailaddress=? and password=?");
            ps.setString(1, uid);
            ps.setString(2, pass);
            ResultSet rs=ps.executeQuery();
            boolean found=rs.next();
            if(found){    
                session.setAttribute("checked", "yes");
                String email=rs.getString(1);
                session.setAttribute("email", email);

                String utype=rs.getString(7);
                session.setAttribute("utype", utype);
                String approval=rs.getString(5);
                session.setAttribute("approval",approval);
//                String unm=rs.getString(2);
//                session.setAttribute("username", unm);
                if(utype.equalsIgnoreCase("Transporter"))
                    response.sendRedirect("Register2.jsp");
                else
                    response.sendRedirect("cust_homepage.jsp");
            }
            else{
                
                    out.println("<h2>Invalid User Details....</h2>");
                    out.println("<a href=Login.jsp>Try-Again</a>");
                
            }

        } catch (SQLException ex) {
            Logger.getLogger(CheckUser.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CheckUser.class.getName()).log(Level.SEVERE, null, ex);
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
