<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="controller.*"%>
<%@ page import="model.entity.*"%>
<%@ page import="java.util.*"%>
<%@ page import= "com.google.appengine.api.users.UserService"%>
<%@ page import= "com.google.appengine.api.users.UserServiceFactory"%>
<html lang="en">
<head>
  <title>Coaquira hnos</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="../CSS/inicio.css">
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<%UserService us = UserServiceFactory.getUserService(); %>
<%com.google.appengine.api.users.User usuario = us.getCurrentUser(); %>

<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#myPage"><img src="../Img/logo.png" border="1"  width="150%" height="150%"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#about">INFORMACIÓN</a></li>
        <li><a href="#portfolio">ANUNCIOS</a></li>
		<li><a href="#services">SERVICIOS</a></li>
        <li><a href="#contact">CONTACTENOS</a></li>
        <%List<User> users = (List<User>) request.getAttribute("users"); %>
        <%if(users.isEmpty()){ %>
		<li><a href="#ini">NO REGISTRADO</a></li>
		<%}else{ %>
		<li><a href="/users/view">MI CUENTA</a></li>
		<%} %>
      </ul>
    </div>
  </div>
</nav>

<div class="jumbotron text-center">
  <h1>COAQUIRA HNOS.</h1> 
  <p>Laboratorio de Mecánica de Suelos y Pavimentos, Concretos y Asfaltos</p> 
  <br>
  <%if(usuario != null ){%>
  <p>Bienvenido a nuestra pagina <%=usuario.getEmail()%></p> 
  <%}else{ %>
  <p>Bienvenido a nuestra pagina</p> 
  <% }%>
</div>

<!-- Container (About Section) -->
<div id="about" class="container-fluid">
  <div class="row">
    <div class="col-sm-8">
      <h2>Información</h2><br>
      <h4>Control de Calidad en Obras Civiles en General para la Minería, inversiones publicas y privadas.
	  En los suelos se tiene no solo los problemas que se presentan en el acero y concreto (módulo de elasticidad y resistencia a la ruptura), y exagerados por la mayor complejidad del material, sino otros como su tremenda variabilidad y que los procesos naturales formadores de suelos están fuera del control del ingeniero.</h4><br>
	  <br><h3>Brindamos los siguientes servicios:</h3><br>
      <p>*Estudio de suelos para diseño de carreteras, puentes y edificaciones.</p>

      <p>*Análisis de suelos, agregados, agua y materiales para la construcción.</p>

      <p>*Diseño de Mezcla de Concreto, Asfalto en frio y caliente, extracción de Núcleos diamantinos, roturas de Probetas y cubos.</p>

      <p>*Análisis químicos de Suelos, agregados y Agua. </p>
      <br><button class="btn btn-default btn-lg">Mostrar mas</button>
    </div>
    <div class="col-sm-4">
      <br><img src="../Img/info1.jpg" border="1"  width="100%" height="100%"><br>
	  <br><br>
	  <br><img src="../Img/info2.jpg" border="1"  width="100%" height="100%"><br>
    </div>
  </div>
</div>

<!-- Container (Portfolio Section) -->
<div id="portfolio" class="container-fluid text-center bg-grey">
  <h2>Anuncios</h2><br>
  <h4>enlace de los videos</h4>
  <div class="row text-center slideanim">
    <div class="col-sm-3">
      <div class="thumbnail">
        <img src="nan.jpg" alt="vacio" width="400" height="300">
        <p><strong>Felix Montalico</strong></p>
        <p><li><a href="https://www.youtube.com/watch?v=zec4t3C4ecg&t=12s">Ingles</a></li></p>
        <p><li><a href="https://www.youtube.com/watch?v=OiYPwbdEge4&t=17s">Español</a></li></p>
        <p><li><a href="https://github.com/felix0821/proyecto-final">GitHub</a></li></p>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="thumbnail">
        <img src="nan.jpg" alt="vacio" width="400" height="300">
        <p><strong>Jose Mamani</strong></p>
        <p><li><a href="https://www.youtube.com/watch?v=ZJctf7aknMA">Ingles</a></li></p>
        <p><li><a href="https://www.youtube.com/watch?v=C-FkUo2hVZ0">Español</a></li></p>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="thumbnail">
        <img src="nan.jpg" alt="vacio" width="400" height="300">
        <p><strong>Rocio Peralta</strong></p>
        <p><li><a href="https://www.youtube.com/watch?v=lFayUWLA078&feature=youtu.be">Ingles</a></li></p>
        <p><li><a href="https://www.youtube.com/watch?v=ACcPAOdbmCU&feature=youtu.be">Español</a></li></p>
      </div>
    </div>
    <div class="col-sm-3">
      <div class="thumbnail">
        <img src="nan.jpg" alt="vacio" width="400" height="300">
        <p><strong>David Peña</strong></p>
        <p><li><a href="https://www.youtube.com/watch?v=2ET3rg6WQpM&feature=youtu.be">Ingles</a></li></p>
        <p><li><a href="https://www.youtube.com/watch?v=llXvQC6sGMA&feature=youtu.be">Español</a></li></p>
      </div>
    </div>
  </div><br>
  
  <h2>Noticias</h2>
  <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <h4>"Empieza el funcionamiento de la pagina"<br><span>hoy 16/07/2018</span></h4>
      </div>
      <div class="item">
        <h4>"Se vienen grandes sorpresas"<br><span>mas adelante</span></h4>
      </div>
      <div class="item">
        <h4>"Anuncio sin contenido"<br><span>sin contenido</span></h4>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>

<!-- Container (Services Section) -->
<div id="services" class="container-fluid text-center">
  <h2>SERVICIOS</h2>
  <h4>aplicaciones</h4>
  <br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-user logo-small"></span>
      <h4>USUARIOS</h4>
      <p>veamos cuantos usuarios o trabajadores tenemos..</p>
	  <li><a href="/usuario">Verificar</a></li>
    </div>
    <div class="col-sm-4">
      <span class=" glyphicon glyphicon-open-file  logo-small"></span>
      <h4>FACTURAS</h4>
      <p>veamos las facturas y transacciones de la empresa..</p>
	  <li><a href="/invoices">Verificar</a></li>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-lock logo-small"></span>
      <h4>MATERIALES</h4>
      <p>veamos con que recursos y materiales contamos..</p>
	  <li><a href="/materials">Verificar</a></li>
    </div>
  </div>
  <br><br>
  <div class="row slideanim">
  <div class="col-sm-4">
      <span class="glyphicon glyphicon-usd logo-small"></span>
      <h4>REPORTES</h4>
      <p>veamos con que reportes de gastos contamos..</p>
	  <li><a href="/report">Verificar</a></li>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-scale logo-small"></span>
      <h4>ACTIVIDADES</h4>
      <p>veamos los servicios y actividades que ofrecemos..</p>
	  <li><a href="/projects">Verificar</a></li>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-home logo-small"></span>
      <h4>ALMACEN</h4>
      <p>veamos el control del almacén..</p>
	  <li><a href="/materialsController">Verificar</a></li>
    </div>
</div>
</div>
<!-- Container (Contact Section) -->
<div id="contact" class="container-fluid bg-grey">
  <h2 class="text-center">CONTACT</h2>
  <div class="row">
    <div class="col-sm-5">
      <p>puede contactarnos aqui.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span> AREQUIPA, PERÚ</p>
      <p><span class="glyphicon glyphicon-phone"></span> (+51) 054 466587 , 959128655</p>
      <p><span class="glyphicon glyphicon-envelope"></span> coaquira_cace@hotmail.com</p>
    </div>
    <div class="col-sm-7 slideanim">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea><br>
      <div class="row">
        <div class="col-sm-12 form-group">
          <button class="btn btn-default pull-right" type="submit">Enviar</button>
        </div>
      </div>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <p>Gracias por visitarnos</p>
</footer>

<script src="../JS/mostrar.js"></script>

</body>
</html>
