<%-- 
    Document   : bienvenido
    Created on : May 12, 2016, 11:22:35 AM
    Author     : Raul V
--%>

<%@page import="clases.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/bienvenido.css">
        <title>JSP Page</title>
    </head>
    <body>
        <ul class="barra-navegacion">
            <li><a href="bienvenido.jsp"><img src="imagenes/stim_logo2.png" width='125px' height="50px"/></a></li>
            <li class='alinear-centro'>
                <%
                String username = session.getAttribute("username").toString();
                out.print("<h3>Bienvenido " + username.toUpperCase() + "</h3>");
                %>
            </li>
            <li class='alinear-derecha'><a href="index.jsp">Salir</a></li>
            <li class='alinear-derecha'><a href="catalogo.jsp">Catalogo</a></li>
            <li class="alinear-derecha"><a href="#">Tus Juegos</a></li>
        </ul>
        <form name="RentaFRM" method="post">
            
            <table border="5" cellpadding="8" cellspacing="5" align="center">
                        <%
                            /* TABLA DE RENTAS */
                            ResultSet rs;
                            Conexion cnn = new Conexion();
                            
                            // Almacenar el resultado de la consulta en un ResultSet
                            rs = cnn.consultar("select * from renta");
                            
                            out.println("<tr>");
                            out.println("<th colspan='5' style='color: olive'>HISTORIAL DE<br />RENTAS</th>");
                            out.println("</tr>");
                            out.println("<tr>");
                            out.println("<th width='10%'>ID RENTA</th>");
                            out.println("<th width='10%'>ID CLIENTE</th>");
                            out.println("<th width='10%'>ID VIDEO</th>");
                            out.println("<th width='35%'>FECHA DE RENTA</th>");
                            out.println("<th width='35%'>FECHA DE ENTREGA</th>");
                            out.println("</tr>");
                            
                            // Reccorrer el resultado para desplegar el resultado de la consulta
                            while(rs.next()) {
                                out.println("<tr>");
                                out.println("<td>" + rs.getString(1) + "</td>");
                                out.println("<td>" + rs.getString(2) + "</td>");
                                out.println("<td>" + rs.getString(3) + "</td>");
                                out.println("<td>" + rs.getString(4) + "</td>");
                                out.println("<td>" + rs.getString(5) + "</td>");
                                out.println("</tr>");
                            }
                        %>
                    </table>
        </form>
    </body>
</html>
