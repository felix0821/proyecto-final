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
<div class="container"> 
<form method="get" action="/usuario/add">
<span class="title">Create User</span>
<%if(mensaje!=null){ %>
<p><%=mensaje %></p>
<%}%>
<table border="0" cellspacing="1" cellpadding="5" bgcolor="#CCCCCC">
<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">DNI</span>
  </div>
  <input type="text" name="dni" pattern="[0-9]{8}" required="">
</div>
<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">Nombre</span>
  </div>
  <input type="text" name="name"  pattern="[a-zA-Z ]+"required>
  </div>
<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">Apellido</span>
  </div>
  <input type="text" name="apellido"  pattern="[a-zA-Z ]+" required="">
  </div>
<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">Email</span>
  </div>
  <input type="email" name="email"   required="">
  </div>
  <button type="submit" class="btn btn-secondary btn-sm">Submit</button>
</table>
</form>
</div>
</body>
</html>