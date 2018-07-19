<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>buscador</title>
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
  <li><a href="/invoices">Regresar...</a>
  <li><a href="/invoices/add">Registro</a>
  
</ul>
 
<div class="container" >
<form name="formulario" method="get" action="/invoices/report" >
<h3>Reporte de Facturas (por fechas)</h3>
<br>
<p></p>
  <div class="form-group row">
    <label for="inputEmail3" class="col-sm-2 col-form-label">Fecha Inicial</label>
    <div class="col-sm-10">
      <input type="date" name="inicio" class="form-control" required>
    </div>
  </div>
  <div class="form-group row">
    <label for="inputPassword3" class="col-sm-2 col-form-label">Fecha Final</label>
    <div class="col-sm-10">
      <input type="date"  class="form-control" name="fin" required >
    </div>
  </div>
  <div class="form-group row">
    <div class="col-sm-10">
      <button type="submit" class="btn btn-primary">Submit</button>
    </div>
  </div>
</form>
</div>
</body>
</html>