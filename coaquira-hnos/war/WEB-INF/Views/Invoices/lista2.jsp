<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="model.entity.Factura" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<%	List<Factura>factura=(List<Factura>)request.getAttribute("lista"); %>
<%	String inicio=(String)request.getAttribute("inicio"); %>
<%	String fin=(String)request.getAttribute("fin"); %>
  <ul class="pager">
  <li><a href="/invoices">Regresar...</a>
  <li><a href="/invoices/add">Registro</a>
</ul>

<div class="container">
<table class="table">
 <h3>Se encontraron <%=factura.size() %> Facturas entre <%=inicio %> y <%=fin %></h3>
 <br>
  <thead>
    <tr>
      	 <th scope="col">id</th>
         <th scope="col">Name</th>
         <th scope="col">Cost</th>
         <th scope="col">Date</th>
         <th scope="col">Quantity</th>
    </tr>
    </thead>
  <tbody>
<%if(factura.size()>0){ %>

<%for(int i=0;i<factura.size();i++) {%>
<% Factura m=(Factura)factura.get(i); %>
 <tr>
 <th scope="row"><%=m.getId() %></th>
 <td><%= m.getNameCL() %></td>
        <td><%= m.getRucCL() %></td>
        <td><%= m.getDireccion() %></td>
        <td><%= m.getFecha() %></td>

      </tr>       
<%} %>
</tbody>
</table>
<%}else{%>
<div class="container">
<h4>vacio</h4>
</div>
<%} %>
</div>
</body>
</html>