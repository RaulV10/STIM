<%-- 
    Document   : desarrollador
    Created on : May 12, 2016, 7:32:58 AM
    Author     : Raul V
--%>

<%@page import="clases.Conexion"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="CSS/desarrollador.css">
        <title>JSP Page</title>
        
    </head>
    <body>
        <a href="crear_usuario.jsp"><h1>Crear Usuario</h1></a>
        <form name="VideosFRM" method="post" action='JuegosSVT'>
            
            <div id="popup1" class="overlay">
            <div class="popup">
                    <h2>Agregar un Juego</h2>
		<a class="close" href="#">&times;</a>
		<div class="content">
                    <form>
                        <div class="secciones">
                            Titulo del Juego:
                            <input name="txtTitulo" type="text" />
                        </div>
                        <div class="secciones">
                            Clasificacion:
                            <select id="clasificacion" name="clasificacion">
                                <option value="E">Everyone</option>
                                <option value="E10">Everyone 10+</option>
                                <option value="T">Teen</option>
                                <option value="M">Mature 17+</option>
                                <option value="A">Adults 18+</option>
                            </select>
                        </div>
                        <div class="secciones">
                            Clase:
                            <select id='clase' name='clase'>
                                <option value="plata">Plata</option>
                                <option value="oro">Oro</option>
                                <option value="platino">Platino</option>
                            </select>
                        </div>
                        <div class="secciones">
                            Precio Venta:
                            <input name="txtPrecioVenta" type="text" />
                        </div>

                        <!-- Boton de Comando -->
                        <input name="cmd" type="submit" value="Agregar" />
                    </form>
		</div>
            </div>
            </div>
            <p></p>
            
            <div class="wrapper">
                <div class="table">

                    <div class="row header" style="background: #27ae60">
                    <div class="cell">
                      Titulo
                    </div>
                    <div class="cell">
                      Clasificacion
                    </div>
                    <div class="cell">
                      Clase
                    </div>
                    <div class="cell">
                      Precio Venta
                    </div>
                  </div>

                  <%

                    /* TABLA DE JUEGOS */
                    ResultSet rs;
                    Conexion cnn = new Conexion();

                    // Almacenar el resultado de la consulta en un ResultSet
                    rs = cnn.consultar("select titulo, clasificacion, clase, precioventa from juegos");

                    // Reccorrer el resultado para desplegar el resultado de la consulta
                    while(rs.next()) {
                        out.println("<div class='row'>");
                            out.println("<div class='cell'>" + rs.getString(1) + "</div>");
                            out.println("<div class='cell'>" + rs.getString(2) + "</div>");
                            out.println("<div class='cell'>" + rs.getString(3).toUpperCase() + "</div>");
                            out.println("<div class='cell'> $" + rs.getString(4) + "</div>");
                        out.println("</div>");
                    }

                %>



                </div>

                <div class="box">
                    <a class="button" href="#popup1">Agregar Juego</a>
                </div>
                <br/><br/>
                <div class="table">

                    <div class="row header" style="background: #2980b9">
                    <div class="cell">
                      Usuario
                    </div>
                    <div class="cell">
                      Contraseña
                    </div>
                    <div class="cell">
                      E-mail
                    </div>
                    <div class="cell">
                      Nombre(s)
                    </div>
                    <div class="cell">
                      Apellido(s)
                    </div>
                  </div>

                  <%

                    /* TABLA DE USUARIOS */

                    // Almacenar el resultado de la consulta en un ResultSet
                    rs = cnn.consultar("select * from usuario");

                    String password = "*********";

                    // Reccorrer el resultado para desplegar el resultado de la consulta
                    while(rs.next()) {
                        out.println("<div class='row'>");
                            out.println("<div class='cell'>" + rs.getString(1) + "</div>");
                            out.println("<div class='cell'>" + password + "</div>");
                            out.println("<div class='cell'>" + rs.getString(3) + "</div>");
                            out.println("<div class='cell'>" + rs.getString(4) + "</div>");
                            out.println("<div class='cell'>" + rs.getString(5) + "</div>");
                        out.println("</div>");
                    }

                %>

                </div>
            </div>
                    
            <p><a href="index.jsp">Menu Principal</a></p>
        </form>
    </body>
</html>
