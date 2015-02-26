<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="privado_login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
  
<head>
    <meta charset="utf-8">
    <title>Login - SCB</title>

	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes"> 
    
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css" />

<link href="css/font-awesome.css" rel="stylesheet">
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
    
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/pages/signin.css" rel="stylesheet" type="text/css">
<script src="js/script.js"></script>
</head>

<body>
	
	<div class="navbar navbar-fixed-top">
	
	<div class="navbar-inner">
		
		<div class="container">
			
			<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</a>
			
			<a class="brand" href="index.html">
				Control de Inventario			
			</a>		
			
			<div class="nav-collapse">
				<ul class="nav pull-right">
					
					<li class="">						
						<a  class="">
							Bienvenido
						</a>
						
					</li>
					
				</ul>
				
			</div><!--/.nav-collapse -->	
	
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> <!-- /navbar -->



<div class="account-container">
	
	<div class="content clearfix">
		
		<form runat="server">
		
			<h1>Ingreso</h1>		
			
			<div class="login-fields">
				
				<p>Ingresa tus datos</p>
				
				<div class="field">
					<label for="username">Usuario</label>
					<input type="text" id="txtusuario" runat="server" name="username" value="" placeholder="Usuario" class="login username-field" />
				</div> <!-- /field -->
				
				<div class="field">
					<label for="password">Contraseña:</label>
					<input type="password" id="txtpass" runat="server" name="password" value="" placeholder="Contraseña" class="login password-field"/>
				</div> <!-- /password -->
				
			</div> <!-- /login-fields -->
			
			<div class="login-actions">
				
				<span class="login-checkbox">
					<%--<input id="Field" name="Field" type="checkbox" class="field login-checkbox" value="First Choice" tabindex="4" />
					<label class="choice" for="Field">Keep me signed in</label>--%>
				</span>
									
				<%--<button class="button btn btn-success btn-large" id="btningresar" onclick="$(location).attr('href','privado/index.aspx');">Ingresar</button>--%>

				<asp:Button ID="LnkConectar" runat="server" Text="Ingresar" CssClass="button btn btn-success btn-large"  />
                              
                 <label id="lblestado" runat="server"></label>
			</div> <!-- .actions -->
			
			
			
		</form>
		
	</div> <!-- /content -->
	
</div> <!-- /account-container -->



<div class="login-extra">
	<a href="#">Reiniciar Contraseña</a>
</div> <!-- /login-extra -->


<script src="js/jquery-1.7.2.min.js"></script>
<script src="js/bootstrap.js"></script>

<script src="js/signin.js"></script>

<script>

    $(document).ready(function () {
        // Handler for .ready() called.
               
    });


</script>


</body>

</html>
