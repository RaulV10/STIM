<%@include file="sesion.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
 
    <link rel="stylesheet" type="text/css" href="css/style.css"/>
    <script type="text/javascript" language="javascript" src="js/jquery-2.2.1.js"></script>
    <script type="text/javascript" language="javascript" src="js/dynjs.js"></script>
    
  
    <script type="text/javascript" language="javascript" >

        function asignarId(v1){

          document.getElementById("idInstituto").value = v1[0];
          document.getElementById("txtNombre").value = v1[1];
          document.getElementById("txtDireccion").value = v1[2];
          document.getElementById("txtTelefono").value = v1[3];

        }

    </script>
    
    
    <title>GraduArte</title>
    
  </head>

  <body onload="cargarInstitutoTBL()">
    
    <div class="menulateral">
      <%@include file="menulateral.jsp"%>
    </div>
    
    <div class="contenedor">
    
      <div>
        <h1 id="header">Instituto</h1>
      </div>
      
      <div style="float:left;">
        <form name="InstitutoFRM" method="post" action="InstitutoSVT">

          <div class="div-alineacion-izq">
            <input id="idInstituto" name="idInstituto" type="hidden" value="0"/>
            
            <label>Nombre</label>
            <input id="txtNombre" name="txtNombre" class="control-texto-largo" type="text" autofocus=""/>
          </div>
          <div class="div-alineacion-izq">
            <label>Dirección</label>
            <input id="txtDireccion" name="txtDireccion"  class="control-texto-largo" type="text"/>
          </div>

          <div class="div-alineacion-izq">
            <label>Teléfono</label>
            <input id="txtTelefono" name="txtTelefono"  class="control-texto-corto" type="text"/>
          </div>
          
           <input name="cmd" class="control-submit" type="submit" value="Agregar"/>
           <input name="cmd" class="control-submit" type="submit" value="Modificar"/>
           <input name="cmd" class="control-submit" type="submit" value="Eliminar"/>

        </form>
      </div>
      
     <div style="float:left;margin-left: 50px;padding:5px;">
        <a href="carrera.jsp"><img src="images/agregar.png" width="60" height="60" title="Agregar carreras"></a>
      </div>
    </div>
    
    
    <div class="contenedor">
      <div id="tblInstituto"></div>
    </div>
  </body>
</html>