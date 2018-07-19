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
<% MaterialController principal = (MaterialController) request.getAttribute("materialController"); %>
<form action="add" method="get">
<fieldset><legend>Registro de control de materiales</legend>
<div class="container">
	<div class="form-group row">
	<div class="col-xs-3">
  <label for="role">Project :</label>
  <select name="nameProject" class="form-control" id="sel1">
  <%if( proyectos.size()>0 ) {%>
  <% Long nameProject = principal.getProject(); %>
  <%for( Project p : proyectos ) {%>
    <%if(p.getId().equals(nameProject)){%>
        <option selected><%=p.getName() %></option>
      <%}else{%>
        <option><%=p.getName() %></option>
        <%}%>
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
  <% Long nameUser = principal.getUser(); %>
  <%for( User p : usuarios ) {%>
    <%if(p.getId().equals(Long.toString(nameUser))){%>
        <option selected><%=p.getEmail() %></option>
      <%}else{%>
        <option><%=p.getEmail() %></option>
        <%}%>
    <%}%>
  </select>
  </div>
	</div>
	<%}else{%>
	<li><a href="/users/add">Crear nuevo Usuario</a></li>
	<%}%>
	
	<div class="form-group row">
	<div class="col-xs-3">
	<%String fch = (String)request.getAttribute("fechaSalida");%>
		<label for="fecha">Fecha Salida(DD-MM-YYYY) :</label>
		<%if(fch==null) {%><input class="form-control" type="date" name="fechaS" maxlength="20"  pattern="(0[1-9]|1[0-9]|2[0-9]|3[01])/(0[1-9]|1[012])/[0-9]{4}" title="Ingrese formato correcto" required/>
		<%}else{%><input class="form-control" type="date" name="fechaS" maxlength="20" value=<%=fch%> pattern="(0[1-9]|1[0-9]|2[0-9]|3[01])/(0[1-9]|1[012])/[0-9]{4}" title="Ingrese formato correcto" required/>
	    <%} %>
	</div>
	</div>
	
	<div class="form-group row">
	<div class="col-xs-3">
	<%String fcha = (String)request.getAttribute("fechaEntrada");%>
		<label for="fecha">Fecha Entrada(DD-MM-YYYY) :</label>
		<%if(fcha==null) {%><input class="form-control" type="date" name="fechaE" maxlength="20"  pattern="(0[1-9]|1[0-9]|2[0-9]|3[01])/(0[1-9]|1[012])/[0-9]{4}" title="Ingrese formato correcto" required/>
		<%}else{%><input class="form-control" type="date" name="fechaE" maxlength="20" value=<%=fcha%> pattern="(0[1-9]|1[0-9]|2[0-9]|3[01])/(0[1-9]|1[012])/[0-9]{4}" title="Ingrese formato correcto" required/>
	    <%} %>
	</div>
	</div>
	
	<%int can = (int)request.getAttribute("cantidad");%>
	<div class="container">
	<div class="form-group row">
	<div class="col-xs-1">
	<label for="ex2">Cantidad:</label>
	<input class="form-control" type="text" id="ex2" name="can"  value=<%=can %> maxlength="4" pattern="[0-9]{1,2}(.[0-9]{1})?" required/>
	</div>
	
	<%if( materiales.size()>0 ) {%>
	<div class="form-group row">
	<div class="col-xs-3">
  <label for="role">materiales :</label>
  <select name="nameUser" class="form-control" id="sel1">
  <% Long nameMaterial = principal.getMaterials(); %>
  <%for( Material p : materiales ) {%>
    <%if(p.getId().equals(nameMaterial)){%>
        <option selected><%=p.getName() %></option>
      <%}else{%>
        <option><%=p.getName() %></option>
        <%}%>
    <%}%>
  </select>
  </div>
	</div>
	<%}else{%>
	<li><a href="/users/add">Crear nuevo Material</a></li>
	<%}%>
	</div>
	</div>
</fieldset>
</form>
</body>
</html>