/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Raul V
 */
@WebServlet(name = "Iniciar_SesionSVT", urlPatterns = {"/Iniciar_SesionSVT"})
public class Iniciar_SesionSVT extends HttpServlet {

    // Seccion de atributos
    private Conexion cnn;
    
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Iniciar_SesionSVT</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Iniciar_SesionSVT at " + request.getContextPath() + "</h1>");
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
            boolean conectado;
        try{
            String username = request.getParameter("txtUsuario");   
            String password = request.getParameter("txtPassword");
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            //Conexion conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/stim?" + "user=root&password=");    
            PreparedStatement pst = cnn.prepareStatement("Select idusuario,password from usuario where idusuario=? and password=?");
            pst.setString(1, username);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();                        
            if(rs.next()){
                response.sendRedirect("bienvenido.html");
            }      
            else {
                /*conectado = false;
                out.println("<p color='red'>");
                out.println("Usuario o Contraseña incorrectos");
                out.println("</p>");*/
            }           
       }
       catch(Exception e){       
           out.println("Something went wrong !! Please try again");       
       }
        
        /*try{
                        String username = request.getParameter("txtUsuario");   
                        String password = request.getParameter("txtPassword");
                        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
  
                        PreparedStatement pst = cnn.prepareStatement("Select idusuario, password from usuario where idusuario=? and password=?");
                        pst.setString(1, username);
                        pst.setString(2, password);
                        ResultSet rs = pst.executeQuery();                        
                        if(rs.next()) {
                            out.println("<!DOCTYPE html>");
                            out.println("<html>");
                            out.println("<head>");
                            out.println("<title>Servlet Crear_UsuarioSVT</title>");            
                            out.println("</head>");
                            out.println("<body>");
                            out.println("<h1>FUNCIONO!!!!</h1>");
                            out.println("</body>");
                            out.println("</html>");
                        } 
                                   
                        else
                           out.println("Invalid login credentials");        
                        processRequest(request, response);
                   }
                   catch(Exception e){       
                       out.println("Something went wrong !! Please try again");       
                   }*/
        
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
