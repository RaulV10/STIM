<%@include file="sesion.jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dao.InstitutoDAO"%>
<%@page import="core.DataConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<table>
  
    <tr>
      <th>Nombre</th>
      <th>Dirección</th>
      <th>Teléfono</th>
    </tr>
  
    <tr>
    <%

       DataConnection dataConnection = DataConnection.getDataConnection();
       InstitutoDAO institutoDAO = new InstitutoDAO(dataConnection);

       ResultSet rs = institutoDAO.consultar("sp_instituto_select");

       while(rs.next()){
          
          out.println("<tr onclick=\"asignarId([" + rs.getString(1) + ",'" + rs.getString(2) + "','" + rs.getString(3) + "','" + rs.getString(4) +"'])\">");
          out.println("<td>" + rs.getString(2) + "</td>");
          out.println("<td>" + rs.getString(3) + "</td>");
          out.println("<td>" + rs.getString(4) + "</td>");
          out.println("</tr>");

       }
    %>
    </tr>

</table>
