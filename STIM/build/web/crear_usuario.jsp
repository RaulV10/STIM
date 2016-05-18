<%-- 
    Document   : crear_usuario
    Created on : May 10, 2016, 7:48:36 AM
    Author     : Raul V
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style type="text/css">
            
            body {
                background-color: #f0f0f2;
                margin: 0;
                padding: 0;
                font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;

            }
            div {
                width: 300px;
                margin: 1em auto;
                padding: 30px;
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
    <body>
        <a href="index.jsp"><h1>Crear Usuario</h1></a>
        
        <form name="Crear_UsuarioFRM" method="post" action="Crear_UsuarioSVT">
            
            <div>
                Nombre(s):
                <input name="txtNombres" type="text"/>
            </div>
            <div>
            Apellido(s):
            <input name="txtApellidos" type="text"/>
            </div>
            <div>
            Usuario:
            <input name="txtUsuario" type="text"/>
            </div>
            <div>
            Contraseña:
            <input name="txtContrasena" type="password" />
            </div>
            <div>
            E-mail:
            <input name="txtEmail" type="email"/>
            </div>
            
            <!-- Boton de Comando -->
            <p align="center">
                <input name="cmd" type="submit" value="Crear Usuario"/>
            </p>
        </form>
    </body>
</html>
