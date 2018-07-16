<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="model.entity.Material" %>
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
  <style type="text/css">
  table{
  border-collapse: separate;
  border-spacing: 50px 5px;
}
</style>
</head>
<body>
<%
Material material=(Material)request.getAttribute("material");
%>
  <ul class="pager">
  <li><a href="/materials">Regresar...</a>
  <li><a href="/materials/add">Registro</a>
</ul>
<div class="container"> 
<div class="users view large-9 medium-8 columns content">
    <h3><%=material.getId() %></h3>
    <table class="vertical-table">
        <tr>
            <th scope="row">Name</th>
            <td><%=material.getName() %></td>
        </tr>
        <tr>
            <th scope="row">Cost</th>
            <td><%=material.getCost() %></td>
        </tr>
        <tr>
            <th scope="row">Date</th>
            <td><%=material.getFecha() %></td>
        </tr>
        <tr>
            <th scope="row">Quantity</th>
            <td><%=material.getQuantity() %></td>
        </tr>
    </table>
</div>
</div>
</body>
</html>