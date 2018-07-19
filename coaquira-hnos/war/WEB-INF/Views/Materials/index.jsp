<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="model.entity.Material" %>
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
List<Material>materials=(List<Material>)request.getAttribute("materials");
%>
  <ul class="pager">
  <li><a href="/users/index">Regresar...</a>
  <li><a href="/materials/add">Registro</a>
</ul>

<div class="container">
<table class="table table-hover">
<h2>Mostrando <%= materials.size() %> resultados</h2>
  <thead>
    <tr>
      	 <th scope="col">id</th>
         <th scope="col">Name</th>
         <th scope="col">Cost</th>
         <th scope="col">Date</th>
         <th scope="col">Quantity</th>
        <th scope="col" class="actions">Actions</th>
    </tr>
    </thead>
  <tbody>
<%if(materials.size()>0){ %>

<%for(int i=0;i<materials.size();i++) {%>
<% Material m=(Material)materials.get(i); %>
 <tr>
 <th scope="row"><%=m.getId() %></th>
 <td><%=m.getName() %></td>
 <td><%=m.getCost() %></td>
 <td><%=m.getFecha() %></td>
 <td><%=m.getQuantity() %></td>

<td class="actions">
                	<a href="/materials/view?id=<%=m.getId() %>">View</a>
                	<a href="/materials/edit?id=<%=m.getId() %>">Edit</a>
                	<a href="/materials/delete?id=<%=m.getId() %>"
                	onclick="return confirm('you want to remove the material <%=m.getId() %> ?')">Delete</a>
                	</td>
      </tr>       
<%} %>

</tbody>
</table>
<%}%>
</div>
</body>
</html>