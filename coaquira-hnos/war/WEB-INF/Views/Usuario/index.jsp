<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="model.entity.Usuario" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index</title>
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
List<Usuario>users=(List<Usuario>)request.getAttribute("users");
%>
<ul class="pager">
  <li><a href="/users/index">Regresar...</a>
  <li><a href="/usuario/add">Registro</a>
</ul>

 <div class="container">
<table class="table">
 <h3>Users</h3>
  <thead>
    <tr>
      	  <th scope="col">DNI</th>
                <th scope="col">Nombre</th>
                <th scope="col">Apellido</th>
                <th scope="col">Email</th>
                <th scope="col" class="actions">Actions</th>
    </tr>
    </thead>
  <tbody>
<%if(users.size()>0){ %>

<%for(int i=0;i<users.size();i++) {%>
<% Usuario user=(Usuario)users.get(i); %>
 <tr>
 <th scope="row"><%=user.getDni() %></th>
 <td><%=user.getNombre() %></td>
<td><%=user.getApellido() %></td>
<td><%=user.getEmail() %></td>

<td class="actions">
                	<a href="/usuario/view?id=<%=user.getId() %>">View</a>
                	<a href="/usuario/edit?id=<%=user.getId() %>">Edit</a>
                	<a href="/usuario/delete?id=<%=user.getId() %>" onclick="return confirm('you want to delete a user?')">Delete</a>
                	</td>
      </tr>       
<%} %>

</tbody>
</table>
<%}%>
</div>
</html>