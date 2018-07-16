<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="model.entity.Usuario" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View</title>
<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
</head>
<body>
<ul class="pager">
  <li><a href="/usuario">Regresar...</a>
  <li><a href="/usuario/add">Registro</a>
</ul>
<%
Usuario user=(Usuario)request.getAttribute("user");
%>
<div class="container"> 
<div class="users view large-9 medium-8 columns content">
    <h3>User</h3>
    <table class="vertical-table">
        <tr>
            <th scope="row">Dni</th>
            <td><%=user.getDni() %></td>
        </tr>
        <tr>
            <th scope="row">Nombre</th>
            <td><%=user.getNombre() %></td>
        </tr>
        <tr>
            <th scope="row">Apellidos</th>
            <td><%=user.getApellido() %></td>
        </tr>
        <tr>
            <th scope="row">Email</th>
            <td><%=user.getEmail() %></td>
        </tr>
    </table>
</div>
</div>
</body>
</html>