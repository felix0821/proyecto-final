<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="model.entity.Project" %>
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
Project project=(Project)request.getAttribute("project");
%>
  <ul class="pager">
  <li><a href="/project">Regresar...</a>
  <li><a href="/project/add">Registro</a>
</ul>
<div class="container"> 
<div class="users view large-9 medium-8 columns content">
    <h3><%=project.getId() %></h3>
    <table class="vertical-table">
        <tr>
            <th scope="row">Name</th>
            <td><%=project.getName() %></td>
        </tr>
        <tr>
            <th scope="row">Value</th>
            <td><%=project.getValue() %></td>
        </tr>
        <tr>
            <th scope="row">Status</th>
            <td><%=project.getState() %></td>
        </tr>
    </table>
</div>
</div>
</body>
</html>