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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SOM
 */
public class resgisterUser extends HttpServlet {

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
            Class.forName("com.mysql.jdbc.Driver");
            //Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:ora", "mysh", "myshop");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zipzapzoom","root","");
           PreparedStatement ps=con.prepareStatement("insert into transportertemp values(?,?,?,?,?,?,?)");
            ps.setString(1,request.getParameter("email"));
            ps.setString(2,request.getParameter("name"));
            ps.setString(3,request.getParameter("phoneno"));
            ps.setString(4,request.getParameter("address"));
            ps.setInt(5,0);
            ps.setString(6,request.getParameter("password"));
             ps.setString(7,request.getParameter("type"));
           // ps.setInt(3,Integer.parseInt(request.getParameter("price")));
            //ps.setInt(4,Integer.parseInt(request.getParameter("time1")));
            int n = ps.executeUpdate();
            if(n>0){
                if(request.getParameter("type").equals("Transporter")){
                    PreparedStatement ps1=con.prepareStatement("insert into notification values(?,?,?)");
                    ps1.setString(1,"aa");
                    ps1.setString(2,"0");
                    ps1.setString(3,"A new Transporter has been added");
                   int k = ps1.executeUpdate();
                }
                response.sendRedirect("Login.jsp");
            }
            else{
               response.sendRedirect("Register.jsp");
            }
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
