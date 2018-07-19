<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Index</title>

</head>
<body>
 <ul class="pager">
  <li><a href="/users/index">Regresar...</a>
  <li><a href="/report/add">Registro</a>
</ul>
<%
		System.out.print("Entro indexReport");
		List<Report> report = (List<Report>) request.getAttribute("report");
		List<Monto> monto = (List<Monto>)request.getAttribute("monto");
	%>
	

<div class="container">
<table class="table">
<p></p>
<h3>Total: <%=monto.get(0).getMonto() %></h3>
 <h3>Reportes</h3>
  <thead>
    <tr>
      	 <th scope="col">id1</th>
         <th scope="col">Descripcion</th>
         <th scope="col">Monto</th>
         <th scope="col">Operacion</th>
        <th scope="col" class="actions">Actions</th>
    </tr>
    </thead>
  <tbody>
	<%if (report.size() > 0) {	
		%>

<%
			for (Report p : report) {
		%>

		<tr>
		    <th scope="row"><%=p.getId() %></th>
			<td><%=p.getDescripcion()%></td>
			<td><%=p.getMonto()%></td>
			<td><%=p.getOperacion()%></td>
			<td class="actions">
                	<a href="/report/edit?id=<%=p.getId()%>">Modificar</a>
                	<a href="/report/delete?id=<%=p.getId()%>">Eliminar</a>
                	<a href="/report/view?id=<%=p.getId()%>">Ver</a></td>
                	      
		<%
			}
		%>
</tbody>
</table>

	<%
		} else {
	%>
	<p />
	<h6><span class="heading">No hay nada</span></h6>
	<%	}%>
</div>

</body>
</html>