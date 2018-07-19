<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="controller.*"%>
<%@ page import="java.util.*"%>
<%@ page import="model.entity.*"%>
<html lang="es">
<head>
<title>Add</title>
<meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<ul class="pager">
<li><a href="/materialsController">Regresar...</a></li>
</ul>
<!-- Menú de navegación del sitio -->
<% List<User> usuarios = (List<User>) request.getAttribute("usuarios"); %>
<% List<Project> proyectos = (List<Project>) request.getAttribute("proyectos"); %>
<% List<Material> materiales = (List<Material>) request.getAttribute("materiales"); %>
<form action="add" method="get">
<fieldset><legend>Registro de control de materiales</legend>
<div class="container">
	<div class="form-group row">
	<div class="col-xs-3">
  <label for="role">Project :</label>
  <select name="nameProject" class="form-control" id="sel1">
  <%if( proyectos.size()>0 ) {%>
  <%for( Project p : proyectos ) {%>
        <option><%=p.getName() %></option>
        <%}%>
  </select>
  </div>
	</div>
	<%}else{%>
	<li><a href="/projects/add">Crear nuevo Proyecto</a></li>
	<%}%>
	
    <%if( usuarios.size()>0 ) {%>
	<div class="form-group row">
	<div class="col-xs-3">
  <label for="role">User :</label>
  <select name="nameUser" class="form-control" id="sel1">
  <%for( User p : usuarios ) {%>
        <option><%=p.getEmail() %></option>
        <%}%>
  </select>
  </div>
	</div>
	<%}else{%>
	<li><a href="/users/add">Crear nuevo Usuario</a></li>
	<%}%>
	
	<div class="form-group row">
	<div class="col-xs-3">
		<label for="fecha">Fecha Salida(DD-MM-YYYY) :</label>
		<input class="form-control" type="date" name="fechaS" maxlength="20"  pattern="(0[1-9]|1[0-9]|2[0-9]|3[01])/(0[1-9]|1[012])/[0-9]{4}" title="Ingrese formato correcto" required/>
	</div>
	</div>
	
	<div class="form-group row">
	<div class="col-xs-3">
		<label for="fecha">Fecha Entrada(DD-MM-YYYY) :</label>
		<input class="form-control" type="date" name="fechaE" maxlength="20"  pattern="(0[1-9]|1[0-9]|2[0-9]|3[01])/(0[1-9]|1[012])/[0-9]{4}" title="Ingrese formato correcto" required/>
	</div>
	</div>
	
	<div class="container">
	<div class="form-group row">
	<div class="col-xs-1">
	<label for="ex2">Cantidad:</label>
	<input class="form-control" type="text" id="ex2" name="can"  maxlength="4" pattern="[0-9]{1,2}(.[0-9]{1})?" required/>
	</div>
	
	<%if( materiales.size()>0 ) {%>
	<div class="form-group row">
	<div class="col-xs-3">
  <label for="role">materiales :</label>
  <select name="nameMaterial" class="form-control" id="sel1">
  <%for( Material p : materiales ) {%>
        <option><%=p.getName() %></option>
        <%}%>
  </select>
  </div>
	</div>
	<%}else{%>
	<li><a href="/users/add">Crear nuevo Material</a></li>
	<%}%>
	</div>
	</div>
	<p>
	<div div class="container">
		<div class="form-group row">
		<input type="submit" class="btn btn-primary" name="enviar" value="Submit"/>
		</div>
	</div>
</fieldset>
</form>
</body>
</html>