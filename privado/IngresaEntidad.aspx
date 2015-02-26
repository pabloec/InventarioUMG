<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IngresaEntidad.aspx.cs" Inherits="privado_IngresaEntidad" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html lang="en">
  
<head>
    <meta charset="utf-8">
    <title>Ordenes - SCB</title>
    
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
				SISTEMA DE CONTROL DE BODEGA				
			</a>		
			
			<div class="nav-collapse">
				<ul class="nav pull-right">
				
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" id="ausuario" runat="server">
          <i class="icon-user"></i> <b class="caret"></b></a>
            <ul class="dropdown-menu">
              
              <li><a href="logout.aspx">Desconectar</a></li>
            </ul>
          </li>
				</ul>			
			
				
			</div><!--/.nav-collapse -->	
	
		</div> <!-- /container -->
		
	</div> <!-- /navbar-inner -->
	
</div> <!-- /navbar -->
    



    
<div class="subnavbar">

	<div class="subnavbar-inner">
	
		<div class="container">

			<ul class="mainnav">
			
				<li>
					<a href="index.aspx">
						<i class="icon-dashboard"></i>
						<span>Inicio</span>
					</a>	    				
				</li>
				
				
				
				<li class="active">
					<a href="IngresaEntidad.aspx">
						<i class="icon-list-alt"></i>
						<span>Entidad</span>
					</a>    				
				</li>
				
				<li>					
					<a href="IngresaUsuario.aspx">
						<i class="icon-list-alt"></i>
						<span>Usuario</span>
					</a>  									
				</li>
                
                
                <li>					
					<a href="OrdenCompra.aspx">
						<i class="icon-list-alt"></i>
						<span>Orden de Compra</span>
					</a>  									
				</li>
			
			</ul>

		</div> <!-- /container -->
	
	</div> <!-- /subnavbar-inner -->

</div> <!-- /subnavbar -->
    
    <form id="Form1" runat="server">
<div class="main">
	
	<div class="main-inner">

	    <div class="container">

            
            <div class="alert alert-success" id="ALertaMensj" runat="server" visible="false">
	         <asp:Label ID="lbMensaje" runat="server" Font-Size="Large" Visible="False"  ForeColor="#00CC66"></asp:Label>
             <asp:Button ID="btnMensaje" runat="server" Text="x" CssClass="close" Visible="false" OnClick="btnMensaje_Click"  />
            </div>
            
            <div class="alert" id="ALerta" runat="server" visible="false">
              <asp:Label ID="lbError" runat="server" Font-Size="Large" Visible="False" ForeColor="#CC0000"></asp:Label> 
              <asp:Button ID="btnSalirMsg" runat="server" Text="x" CssClass="close" Visible="false" OnClick="btnSalirMsg_Click"/>
           
           </div>

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
                            <asp:FilteredTextBoxExtender ID="controlcantidad" 
                               runat="server" Enabled="True" TargetControlID="txtTelefono" 
                               FilterType="Numbers,Custom" validChars="">
                            </asp:FilteredTextBoxExtender>
                        <br />
			        	Celular <br /> 
                            <asp:TextBox ID="txtCelular" runat="server"></asp:TextBox>
                            <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" 
                               runat="server" Enabled="True" TargetControlID="txtCelular" 
                               FilterType="Numbers,Custom" validChars="">
                            </asp:FilteredTextBoxExtender>
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
                                    onclick="btnBuscar_Click" class="btn btn-info" />
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
    
	</div> <!-- /main-inner -->
	    
</div> <!-- /main -->
    
    </form>

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
    

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="../js/jquery-1.7.2.min.js"></script>

<script src="../js/bootstrap.js"></script>
<script src="../js/base.js"></script>

<script src="../js/guidely/guidely.min.js"></script>

<script>


    $(document).ready(function () {

        /*INICIO CARGAR # ORDEN DE COMPRA*/
        $.ajax({
            type: "POST",
            url: "wsconsultas.asmx/Validar",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            error: numordenerror,

            async: false,
            success: numordencorrecto
        });

        function numordencorrecto(msg) {

            $.each(msg.d, function () {
                document.getElementById('txtorden').value = this.NumeroOrden;

            });

        }

        function numordenerror(msg) {
            alert(msg)

        }
        /*FIN CARGAR # ORDEN DE COMPRA*/



        function validarCantidad() {
            var idproducto = document.getElementById('dropprodu');
            var idproveedor = document.getElementById('dropprov');
            var cantidad = document.getElementById('txtcantidad');

            $.ajax({
                type: "POST",
                url: "wscaja.asmx/guardarcaja",
                data: '{descripcion: "' + descripcion + '",resolucion: "' + resolucion + '", serie: "' + serie + '", inicio: "' + inicio + '", final: "' + final + '", fecharesolucion: "' + fecharesolucion + '", dropagencia: "' + dropagencia + '", dropempresa: "' + dropempresa + '"}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                error: guardarerror,

                async: false,
                success: guardarcorrecto
            });



        }
    });
</script>
  </body>

</html>

