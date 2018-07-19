<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New</title>
<meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
<body>
<%String mensaje=(String)request.getAttribute("men"); %>
<ul class="pager">
  <li><a href="/usuario">Regresar...</a>
  <li><a href="/usuario/add">Registro</a>
</ul>
<form method="get" action="/usuario/add">
<fieldset><legend>Registro de control de Usuarios</legend>
<div class="container">
<%if(mensaje!=null){ %>
<p><%=mensaje %></p>
<%}%>
<div class="form-group row">
  <label for="inputEmail3" class="col-sm-2 col-form-label">DNI</label>
    <div class="col-sm-10">
  <input type="text" class="form-control" name="dni" pattern="[0-9]{8}" required>
</div>
</div>
<div class="form-group row">
  <label for="inputEmail3" class="col-sm-2 col-form-label">Nombre</label>
    <div class="col-sm-10">
  <input type="text" class="form-control" name="name"  pattern="[a-zA-Z ]+"required>
  </div>
  </div>
<div class="form-group row">
  <label for="inputEmail3" class="col-sm-2 col-form-label">Apellido</label>
    <div class="col-sm-10">
  <input type="text" class="form-control" name="apellido"  pattern="[a-zA-Z ]+" required>
  </div>
  </div>
<div class="form-group row">
  <label for="inputEmail3" class="col-sm-2 col-form-label">Email</label>
    <div class="col-sm-10">
  <input type="email" class="form-control" name="email"   required>
  </div>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</div>
</form>
</body>
</html>