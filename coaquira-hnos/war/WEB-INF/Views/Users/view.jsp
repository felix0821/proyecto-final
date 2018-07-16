<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="controller.users.*"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.util.*"%>

<html lang="es">
<head>
<title>View User</title>
<meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<ul class="pager">
<li><a href="/users/index">Regresar...</a></li>
<li><a href="/users/logout">Logout</a></li>
</ul>
<!-- Menú de navegación del sitio -->

<form action="edit" method="get" name="formFecha">
<fieldset><legend>Edit user</legend>
<div class="container">
<%List<User> users = (List<User>) request.getAttribute("users");%>
<%for( User u : users){%>
    <div class="form-group row">
	<div class="col-xs-3">
		<label for="email">ID :</label>
		<input class="form-control" type="text" name="id" maxlength="30" value=<%=u.getId()%> readonly/>
	</div>
	</div>
    <div class="form-group row">
	<div class="col-xs-3">
	<%List<Role> roles = (List<Role>) request.getAttribute("roles");%>
		<label for="sel1">Rol:</label>
      <%for(Role r : roles){%>
      <%if(r.getId().equals(Long.toString(u.getRole()))){%>
        <input class="form-control" type="text" name="rol" maxlength="30" value=<%=r.getName()%> readonly/>
      <%}%>
        <%}%>
	</div>
	</div>
	<div class="form-group row">
	<div class="col-xs-3">
		<label for="email">Email(gmail) :</label>
		<input class="form-control" type="text" name="email" maxlength="30" value=<%=u.getEmail()%> pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" title="La descripcion debe ser un correo valido" readonly/>
	</div>
	</div>
	<div class="form-group row">
	<div class="col-xs-3">
		<label for="email">Birth :</label>
		<input class="form-control" type="text" name="email" maxlength="30" value=<%=u.getBirth()%>  readonly/>
	</div>
	</div>
	<div class="form-group row">
    <div class="col-xs-3">
	<label for="email">Gender :</label>
	<%if(u.getGender()){%>
	  <input class="form-control" type="text" name="email" maxlength="30" value="Femenino"  readonly/>
	<%}else{%>
	<input class="form-control" type="text" name="email" maxlength="30" value="Masculino"  readonly/>
      <%}%>
    </label>
    </div>
	</div>
	<%}%>
	</div>
	</fieldset>
	<p>
	<div div class="container">
	<div class="col-xs-2">
		<div class="form-group row">
		<input type="submit" class="btn btn-primary" name="editar" value="MODIFY"/>
		</div>
		</div>
	</div>
	</form>
	
		<li><a href="/users">Users</a></li>
		<br>
		<li><a href="/roles">Roles</a></li>
		<br>
		<li><a href="/resources">Resources</a></li>
		<br>
		<li><a href="/access">Access</a></li>
	<br>

</body>
</html>