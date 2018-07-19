<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="model.entity.Lista" %>
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
List<Lista>materials=(List<Lista>)request.getAttribute("lista");
%>
  <ul class="pager">
  <li><a href="/users">Regresar...</a>
</ul>

<div class="container">
<table class="table">
 <h3>Lista</h3>
  <thead>
    <tr>
      	 <th scope="col">id</th>
         <th scope="col">Correo</th>
         <th scope="col">Ip</th>
         <th scope="col">Date</th>
    </tr>
    </thead>
  <tbody>
<%if(materials.size()>0){ %>

<%for(int i=0;i<materials.size();i++) {%>
<% Lista m=(Lista)materials.get(i); %>
 <tr>
 <th scope="row"><%=m.getId() %></th>
 <td><%=m.getCorreo() %></td>
 <td><%=m.getIp() %></td>
 <td><%=m.getFecha() %></td>

      </tr>       
<%} %>

</tbody>
</table>
<%}%>
</div>
</body>
</html>