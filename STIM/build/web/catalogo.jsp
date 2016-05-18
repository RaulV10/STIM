<%-- 
    Document   : catalogo
    Created on : May 17, 2016, 8:25:53 AM
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
        <link rel="stylesheet" type="text/css" href="CSS/bienvenido.css">
        <title>JSP Page</title>
        
            <script type="text/javascript" language="javascript" >

        function asignarId(v1){




          document.getElementById("idJuego").value = v1;
      
      
        }

    </script>
    

        
        
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
            <div class="wrapper">
                <form name="compraVenta" action="RentaSVT" method="post">
                    <input type="hidden" id="idJuego" name="idJuego" />
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
                    <div class="cell">
                        Compra
                    </div>
                    <div class="cell">
                        Renta
                    </div>
                  </div>

                  <%

                    /* TABLA DE JUEGOS */
                    ResultSet rs;
                    Conexion cnn = new Conexion();

                    // Almacenar el resultado de la consulta en un ResultSet
                    rs = cnn.consultar("select idjuego, titulo, clasificacion, clase, precioventa from juegos");
                    
                    //int idJuego = Integer.parseInt(rs.getString(1));
                    
                    // Reccorrer el resultado para desplegar el resultado de la consulta
                    while(rs.next()) {
                        //int idJuego = rs.getInt(1);
                        out.println("<div class='row' onclick=\"asignarId('" + rs.getString(1) +"')\">");
                            out.println("<div class='cell'>" + rs.getString(2) + "</div>");
                            out.println("<div class='cell'>" + rs.getString(3) + "</div>");
                            out.println("<div class='cell'>" + rs.getString(4).toUpperCase() + "</div>");
                            out.println("<div class='cell'> $" + rs.getString(5) + "</div>");
                            out.println("<div class='cell'><a href='#'>Comprar</a></div>");
                            out.println("<div class='cell'><a href='#'>Rentar</a></div>");
                            out.println("<div class='cell'><input type='submit' value='Rentar'/></div>");
                            //session.setAttribute("idJuego", idJuego);
                        out.println("</div>");
                        
                    } 

                %>



                </div>
                </form>
            </div>
    </body>
</html>
