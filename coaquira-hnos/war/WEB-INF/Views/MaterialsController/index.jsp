<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="model.entity.MaterialController" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Materials</title>
<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
</head>
<body>
<%
List<MaterialController>materialsC=(List<MaterialController>)request.getAttribute("materialsC");
%>
  <ul class="pager">
  <li><a href="/users/index">Regresar...</a>
  <li><a href="/materialsController/add">Registro</a>
</ul>

<div class="container">
<table class="table table-hover">
<h2>Mostrando <%= materialsC.size() %> resultados</h2>
  <thead>
    <tr>
      	 <th scope="col">id</th>
         <th scope="col">Project</th>
         <th scope="col">User</th>
         <th scope="col">Cantidad</th>
         <th scope="col">Material</th>
         <th scope="col">DateOff</th>
         <th scope="col">DateIn</th>
         <th scope="col">Status</th>
        <th scope="col" class="actions">Actions</th>
    </tr>
    </thead>
  <tbody>
<%if(materialsC.size()>0){ %>

<%for( MaterialController m : materialsC )  {%>
 <tr>
 <th scope="row"><%=m.getId() %></th>
 <td><%=m.getProject() %></td>
 <td><%=m.getUser() %></td>
 <td><%=m.getCantidad() %></td>
 <td><%=m.getMaterials() %></td>
 <td><%=m.getFechaSalida() %></td>
 <td><%=m.getFechaEntrada() %></td>
 <td><%=m.getStatus() %></td>

<td class="actions">
                	<a href="/materialsController/view?id=<%=m.getId() %>">View</a>
                	<a href="/materialsController/delete?id=<%=m.getId() %>"
                	onclick="return confirm('you want to remove the material <%=m.getId() %> ?')">GiveBack</a>
                	</td>
      </tr>       
<%} %>

</tbody>
</table>
<%}%>
</div>
</body>
</html>