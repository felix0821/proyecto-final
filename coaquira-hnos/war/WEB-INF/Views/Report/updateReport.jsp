<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="model.entity.*"%>

<%
	Report report = (Report) request.getAttribute("report");
%>
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
<title>MODIFICAR</title>

</head>
<body>
<ul class="pager">
  <li><a href="/report">Regresar...</a>
  <li><a href="/report/add">Registro</a>
</ul>
	<form method="get" action="/report/edit">
	<input type="hidden" name="id" value="<%=report.getId()%>">
		Descripcion: <%=report.getDescripcion() %><br>
		Monto: <input type="number" name="mount" value="<%=report.getMonto()%>"><br> 
		Operacion:  <select name="operation">
			<option value="income">Ingreso</option>
			<option value="spending">Gasto</option>
		</select><br> <input type="submit" value="Registrar">
	</form>
</body>
</html>