<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreacionUsuarios.aspx.cs" Inherits="privado_CreacionUsuarios" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>
<html lang="en">
  
<head>
    <meta charset="utf-8">
    <title>Crea Usuario</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">    
    
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/bootstrap-responsive.min.css" rel="stylesheet">
    
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600" rel="stylesheet">
    <link href="../css/font-awesome.css" rel="stylesheet">
    
    <link href="../css/style.css" rel="stylesheet">
   
    <link href="../js/guidely/guidely.css" rel="stylesheet"> 

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
				Bootstrap Admin Template				
			</a>		
			
			<div class="nav-collapse">
				<ul class="nav pull-right">
					<li class="dropdown">						
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-cog"></i>
							Account
							<b class="caret"></b>
						</a>
						
						<ul class="dropdown-menu">
							<li><a href="javascript:;">Settings</a></li>
							<li><a href="javascript:;">Help</a></li>
						</ul>						
					</li>
			
					<li class="dropdown">						
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-user"></i> 
							EGrappler.com
							<b class="caret"></b>
						</a>
						
						<ul class="dropdown-menu">
							<li><a href="javascript:;">Profile</a></li>
							<li><a href="javascript:;">Logout</a></li>
						</ul>						
					</li>
				</ul>
			
				<form class="navbar-search pull-right">
					<input type="text" class="search-query" placeholder="Search">
				</form>
				
			</div><!--/.nav-collapse -->	
	
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> <!-- /navbar -->
    



    
<div class="subnavbar">

	<div class="subnavbar-inner">
	
		<div class="container">

			<ul class="mainnav">
			
				<li>
					<a href="index.html">
						<i class="icon-dashboard"></i>
						<span>Dashboard</span>
					</a>	    				
				</li>
				
				
				
				<li>
					<a href="reports.html">
						<i class="icon-list-alt"></i>
						<span>Reports</span>
					</a>    				
				</li>
				
				<li>					
					<a href="guidely.html">
						<i class="icon-facetime-video"></i>
						<span>App Tour</span>
					</a>  									
				</li>
                
                
                <li>					
					<a href="charts.html">
						<i class="icon-bar-chart"></i>
						<span>Charts</span>
					</a>  									
				</li>
                
                
                <li class="active">					
					<a href="shortcodes.html">
						<i class="icon-code"></i>
						<span>Shortcodes</span>
					</a>  									
				</li>
				
				<li class="dropdown">					
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown">
						<i class="icon-long-arrow-down"></i>
						<span>Drops</span>
						<b class="caret"></b>
					</a>	
				
					<ul class="dropdown-menu">
                        <li><a href="icons.html">Icons</a></li>
						<li><a href="faq.html">FAQ</a></li>
                        <li><a href="pricing.html">Pricing Plans</a></li>
                        <li><a href="login.html">Login</a></li>
						<li><a href="signup.html">Signup</a></li>
						<li><a href="error.html">404</a></li>
                    </ul>    				
				</li>
			
			</ul>

		</div> <!-- /container -->
	
	</div> <!-- /subnavbar-inner -->

</div> <!-- /subnavbar -->
    
    

<div class="main">
	
	<div class="main-inner">

	    <div class="container">
	
	      <div class="row">
	      	
	      	<div class="span12">      		
	      		
	      		<div class="widget ">
	      			
	      			<div class="widget-header">
	      				<i class="icon-user"></i>
	      				<h3>Creacion Usuarios</h3>
	  				</div> <!-- /widget-header -->
					
					<div class="widget-content">
						
						
						
						<div class="tabbable">
						<ul class="nav nav-tabs">
						  <li>
						    <a href="#CraUsuario" data-toggle="tab">Usuario</a>
						  </li>
						  <li  class="active"><a href="#CreaEntidad" data-toggle="tab">Entidad</a></li>
						</ul>
						
						<br>
						
							<div class="tab-content">
								<div class="tab-pane" id="CraUsuario">
								<form id="edit-profile" class="form-horizontal">
									<fieldset>
										
									
										 <br />

										<div class="form-actions">
											<button type="submit" class="btn btn-primary">Save</button> 
											<button class="btn">Cancel</button>
										</div> <!-- /form-actions -->
									</fieldset>
								</form>
								</div>
								
								
                                
                                <div class="tab-pane active" id="CreaEntidad"> <!--Formulario de Entidad-->
									<form id="edit-profile2" class="form-vertical">
										<fieldset>

                                                <form id="Form1" runat="server">
                                                <div class="main">
	
	                                            <div class="main-inner">
                                                <div class="container">
	                                             <asp:Label ID="lbMensaje" runat="server" Font-Size="Large" Visible="False" ForeColor="#00CC66"></asp:Label>
                                                  <asp:Label ID="lbError" runat="server" Font-Size="Large" Visible="False" ForeColor="#CC0000"></asp:Label>
	                                              
                                                    <div class="row">	
	      	
      		                                       <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"> 

      		                                       </asp:ToolkitScriptManager> 
	      	
	      	                                        <div class="span6">
	      		
	      		                                        <div class="widget">
	      			
	      			                                        <div class="widget-content">
	      				  
			      		                                        <h1>INGRESO DE ENTIDAD</h1>
                                                                <br />
                                                                Nombre: <br /> 
                                                                  <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                                                                <br />
			      		                                        Apellido <br /> 
                                                                  <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
                                                                <br />
			      		                                        Direccion: 
                                                                <br />
                                                                   <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                                                                <br />
                                                                Nit: <br /> 
                                                                  <asp:TextBox ID="txtNit" runat="server"></asp:TextBox>
                                                                <br />
                                                                Telefono:
                                                                  <br />
                                                                    <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
                                                                <br />
			        	                                        Celular <br /> 
                                                                    <asp:TextBox ID="txtCelular" runat="server"></asp:TextBox>
                                                                <br />
                                                                <br /> 
                                                                  <asp:Button ID="btnAgregar" runat="server" Text="Agregar" 
                                                                     class="btn btn-primary" onclick="btnAgregar_Click"/>
                                                            </div> <!-- /widget-content -->
		      		
	      		                                        </div> <!-- /widget -->
	      		
      		                                        </div> <!-- /span6 -->
      		 	
	      	
	      	                                        <div class="span6">
	      		
	      		                                        <div id="target-2" class="widget">
	      			
	      			                                        <div class="widget-content">
	      				
			      		                                        <h1>Buscar Entidades</h1>
			      		
			      	                                        <table class="table table-striped table-bordered">
                                                                <thead>
                                                                  <tr >
                                                                    <td> 
                                                                        <asp:TextBox ID="txtBuscarEntidad" runat="server" Width="90%"></asp:TextBox></td>
                                                                    <td>
                                                                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" 
                                                                            onclick="btnBuscar_Click" />
                                                                    </td>
                                                                  </tr>
                                                                </thead>
                                                                <tbody id="compra">
                                                                  <tr >
                                                                    <td colspan="3">
                                                                      <asp:GridView ID="GridEntidad" runat="server" CellPadding="4" ForeColor="#333333" 
                                                                            GridLines="None"  PageSize="8" Width="90%" 
                                                                            onselectedindexchanged="GridEntidad_SelectedIndexChanged">
                                                                          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                          <EditRowStyle BackColor="#999999" />
                                                                          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                                          <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                          <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                                          <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                                          <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                                          <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                                      </asp:GridView>
                                                                    </td>
                                                                  </tr>
                                                            </tbody>
                                                        </table>
			      		
		      		                                        </div> <!-- /widget-content -->
		      		
	      		                                        </div> <!-- /widget -->
	      		
      		                                        </div> <!-- /span6 -->
      		
	                                              </div> <!-- /row -->
	
	                                            </div> <!-- /container -->    
                                       
                                            </div>
										  </div>
                                        </div>
										</fieldset>
									</form>
								</div>

								
							</div>
						  
						</div>
						
						
						
						
						
					</div> <!-- /widget-content -->
						
				</div> <!-- /widget -->
	      		
		    </div> <!-- /span8 -->
	      	
	      	
	      	
	      	
	      </div> <!-- /row -->
	
	    </div> <!-- /container -->
	    
	</div> <!-- /main-inner -->
    
</div> <!-- /main -->
    
    
    


    
<div class="footer">
	
	<div class="footer-inner">
		
		<div class="container">
			
			<div class="row">
				
    			<div class="span12">
    				&copy; 2014 <a href="menu.aspx">SCB S.A.</a>
    			</div> <!-- /span12 -->
    			
    		</div> <!-- /row -->
    		
		</div> <!-- /container -->
		
	</div> <!-- /footer-inner -->
	
</div> <!-- /footer -->
    


<script src="../js/jquery-1.7.2.min.js"></script>
	
<script src="../js/bootstrap.js"></script>
<script src="../js/base.js"></script>


  </body>

</html>
