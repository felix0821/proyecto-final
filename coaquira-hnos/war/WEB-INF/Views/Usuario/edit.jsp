<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
<%@ page import="model.entity.Usuario" %>
<html>
<head>
<title>Edit</title>
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
<%Usuario user=(Usuario)request.getAttribute("user"); %>
<p/>
<div class="container"> 
<span class="title">Editing User</span>
<form method="get" action="/usuario/edit">
<table border="0" cellspacing="1" cellpadding="5" bgcolor="#CCCCCC">

<input type="hidden" name="id" readonly="readonly" value="<%=user.getId() %>">
</div>
<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">Dni</span>
  </div>
  <input type="text" name="dni"  required="" pattern="[0-9]{8}" value="<%=user.getDni()%>" disabled>
</div>
<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">Nombres</span>
  </div>
  <input type="text" name="nombre" required="" pattern="[a-zA-Z ]+" value="<%=user.getNombre()%>">
  </div>
<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">Apellidos</span>
  </div>
  <input type="text" name="apellido"   required="" pattern="[a-zA-Z ]+" value="<%=user.getApellido()%>">
  </div>
<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="inputGroup-sizing-default">Email</span>
  </div>
  <input type="email" name="email"  required=""  value="<%=user.getEmail()%>">
  </div>
  <button type="submit" class="btn btn-secondary btn-sm">Submit</button>
</table>
</form>
</div>
</body>
</html>