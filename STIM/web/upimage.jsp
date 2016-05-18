<%-- 
    Document   : upimage
    Created on : May 18, 2016, 11:53:50 AM
    Author     : Raul V
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subir Imagen al formulario</title>
    </head>
    <body>
        <form name="frm" action="saveImage.jsp" enctype="multipart/form-data" method="post">
            <input type="file" name="uProperty" /> <br>
            <input type="submit" name="goUpload" value="Upload" />
        </form>
    </body>
</html>
