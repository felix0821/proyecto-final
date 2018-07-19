<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="model.entity.Project" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Projects</title>
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
List<Project>projects=(List<Project>)request.getAttribute("projects");
%>
  <ul class="pager">
  <li><a href="/users/index">Regresar...</a>
  <li><a href="/projects/add">Registro</a>
</ul>

<div class="container">
<table class="table table-hover">
<h2>Mostrando <%= projects.size() %> resultados</h2>
  <thead>
    <tr>
      	 <th scope="col">id</th>
         <th scope="col">Name</th>
         <th scope="col">Cost</th>
         <th scope="col">status</th>
        <th scope="col" class="actions">Actions</th>
    </tr>
    </thead>
  <tbody>
<%if(projects.size()>0){ %>

<%for( Project m : projects ) {%>
 <tr>
 <th scope="row"><%=m.getId() %></th>
 <td><%=m.getName() %></td>
 <td><%=m.getValue() %></td>
 <td><%=m.getState() %></td>

<td class="actions">
                	<a href="/projects/view?id=<%=m.getId() %>">View</a>
                	<a href="/projects/edit?id=<%=m.getId() %>">Edit</a>
                	<a href="/projects/delete?id=<%=m.getId() %>"
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