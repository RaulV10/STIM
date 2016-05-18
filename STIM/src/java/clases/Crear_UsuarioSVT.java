/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Raul V
 */
@WebServlet(name = "Crear_UsuarioSVT", urlPatterns = {"/Crear_UsuarioSVT"})
public class Crear_UsuarioSVT extends HttpServlet {

    // Seccion de atributos
    private Conexion cnn;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Crear_UsuarioSVT</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Crear_UsuarioSVT at " + request.getContextPath() + "</h1>");
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
        try {
            // Recuperacion de los datos desde el formulario
            String nombres = request.getParameter("txtNombres");
            String apellidos = request.getParameter("txtApellidos");
            String usuario = request.getParameter("txtUsuario");
            String contrasena = request.getParameter("txtContrasena");
            String email = request.getParameter("txtEmail");
            
            // Instanciacion del objeto cnn
            cnn = new Conexion();
            cnn.ejecutarSQL(
                    "insert into usuario values('" + usuario + "'"
                    + ", '" + contrasena + "'"
                    + ", '" + email + "'"
                    + ", '" + nombres + "'"
                    + ", '" + apellidos + "')"
            );


        response.sendRedirect("index.jsp");


        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Crear_UsuarioSVT.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Crear_UsuarioSVT.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}