<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
<%@ page import="model.entity.Project" %>
<!DOCTYPE html>
<html lang="en">
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
<%Project project=(Project)request.getAttribute("project"); %>
  
<ul class="pager">
  <li><a href="/projects">Regresar...</a>
  <li><a href="/projects/add">Registro</a>
</ul>
<div class="container" >
<form method="get" action="/projects/edit">
<h3>Editing a Project</h3>
<p></p>
<input type="hidden" name="id" readonly="readonly" value="<%=project.getId() %>">
  <div class="form-group row">
    <label for="inputEmail3" class="col-sm-2 col-form-label">Name</label>
    <div class="col-sm-10">
      <input type="text" name="name" class="form-control" pattern="[a-Z]{5,40}" placeholder="Name" required value="<%=project.getName()%>">
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">Cost</label>
    <div class="col-sm-10">
      <input type="text"  class="form-control" name="cost" pattern="[0-9.]*" placeholder="Cost" required value="<%=project.getValue()%>">
    </div>
  </div>
  <div class="col-xs-2">
	<div class="form-group row">
	<label class="checkbox-inline">
	<%if(project.getState()){%>
	  <input type="checkbox" name="status" value="" checked>Status
	<%}else{%>
      <input type="checkbox" name="status" value="">Status
      <%}%>
    </label>
    </div>
	</div>
  <div class="form-group row">
    <div class="col-sm-10">
      <button type="submit" class="btn btn-primary" name="enviar">Submit</button>
    </div>
  </div>
</form>
</div>
</body>
</html>