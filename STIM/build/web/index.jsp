<%-- 
    Document   : index
    Created on : May 4, 2016, 9:02:44 AM
    Author     : Raul V
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>STIM</title>
        
        <style type="text/css">
            
            body {
                background-color: #f0f0f2;
                margin: 0;
                padding: 0;
                font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;

            }
            div {
                width: 600px;
                margin: 5em auto;
                padding: 50px;
                background-color: #fff;
                border-radius: 1em;
            }
            a:link, a:visited {
                color: #38488f;
                text-decoration: none;
            }
            @media (max-width: 700px) {
                body {
                    background-color: #fff;
                }
                div {
                    width: auto;
                    margin: 0 auto;
                    border-radius: 0;
                    padding: 1em;
                }

            }
    
            .textbox {
                width: 200px;
                padding: 20px;
            }
    
    
    </style>
    </head>
    <body background="imagenes/fondo.jpg">
        <form name="Crear_UsuarioFRM" method="post">
        <div>
            <p align="center">
                <img src="imagenes/stim_logo.png" width="50%" height="50%"/>
            </p>
            <p align="center">
                <input name="txtUsuario" type="text" placeholder="Usuario" class="textbox"/>
                <input name="txtPassword" type="password" placeholder="Contraseña" class="textbox"/>
            </p>

            <br/>

            <p align="center">
                <input name="cmd" type="submit" value="Iniciar Sesión"/>
            </p>
        </div>
        <p align="center">
            <a href="crear_usuario.jsp">Crear Usuario</a>
        </p>
        </form>
        
    </body>
    
    <%
        //boolean conectado = true;
        try{
            String username = request.getParameter("txtUsuario");   
            String password = request.getParameter("txtPassword");
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/stim?" + "user=root&password=");    
            PreparedStatement pst = conn.prepareStatement("Select idusuario,password from usuario where idusuario=? and password=?");
            pst.setString(1, username);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();                        
            if(rs.next()){
                if(username.equals("admin") && password.equals("admin")) {
                    response.sendRedirect("desarrollador.jsp");
                } else {
                    response.sendRedirect("bienvenido.jsp");
                    session.setAttribute("username", username);
                }
            }      
            else {
                // Mostrar mensaje de error
            }           
       }
       catch(Exception e){       
           out.println("Algo a ocurrido, trate de nuevo");       
       }      
        
   %>

</html>
