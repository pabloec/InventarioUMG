<%@ Page Language="VB" AutoEventWireup="false" CodeFile="OrdenCompra.aspx.vb" Inherits="OrdenCompra" %>

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

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
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
					<%--<li class="dropdown">						
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="icon-cog"></i>
							Account
							<b class="caret"></b>
						</a>
						
						<ul class="dropdown-menu">
							<li><a href="javascript:;">Settings</a></li>
							<li><a href="javascript:;">Help</a></li>
						</ul>						
					</li>	--%>
		
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" id="ausuario" runat="server">
          <i class="icon-user"></i> <b class="caret"></b></a>
            <ul class="dropdown-menu">
              
              <li><a href="logout.aspx">Desconectar</a></li>
            </ul>
          </li>
				</ul>
			
				<form class="navbar-search pull-right">
					<%--<input type="text" class="search-query" placeholder="Search">--%>
                    
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
					<a href="index.aspx">
						<i class="icon-dashboard"></i>
						<span>Inicio</span>
					</a>	    				
				</li>
				
				
				
				<li >
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
                
                
                <li class="active">					
					<a href="OrdenCompra.aspx">
						<i class="icon-list-alt"></i>
						<span>Orden de Compra</span>
					</a>  									
				</li>
			
			</ul>

		</div> <!-- /container -->
	
	</div> <!-- /subnavbar-inner -->

</div> <!-- /subnavbar -->
    
    <form runat="server">
<div class="main">
	 <asp:HiddenField ID="husuario" runat="server" />
	<div class="main-inner">

	    <div class="container">
	<div class="alert alert-success" id="MensajeCorrecto" runat="server" style="display:none">
	         <asp:Label ID="lblCorrecto" runat="server" Font-Size="Large"   ForeColor="#00CC66">Agregado</asp:Label>
             <asp:Button ID="btnCorrecto" runat="server" Text="x" CssClass="close"  />
            </div>
            
            <div class="alert" id="MensajeError" runat="server" visible="false">
              <asp:Label ID="lbError" runat="server" Font-Size="Large" Visible="False" ForeColor="#CC0000"></asp:Label> 
              <asp:Button ID="btnSalirMsg" runat="server" Text="x" CssClass="close" Visible="false" />
           
           </div>
	      <div class="row">	      	
	      	
	      	
      		 <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
            </asp:ToolkitScriptManager>
	      	
	      	<div class="span6">
	      		
	      		<div class="widget">
	      			
	      			<div class="widget-content">
	      				  
			      		<h1>CREAR ORDEN DE COMPRA</h1>
                        <br />
                         <br />
                         # Orden: <br /> <input type="text" disabled=disabled id="txtorden"/>
                           <br />
			      		Proveedor: <br /> <select id="dropprov" ></select>
                        <br />
			      		Producto <br /> <select id="dropprodu" ></select>
                        <br />
			      		Cantidad: 
                        <br />
                       <%-- <input type="text" id="txtcantidad" />--%>

                <asp:TextBox ID="txtcantidad" runat="server" ></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="controlcantidad" 
                               runat="server" Enabled="True" TargetControlID="txtcantidad" 
                               FilterType="Numbers,Custom" validChars="">
                </asp:FilteredTextBoxExtender>

                         <br />
                        Precio:
                          <br />
                          <asp:TextBox ID="txtprecio" runat="server" ></asp:TextBox>
                <asp:FilteredTextBoxExtender ID="controlprecio" 
                               runat="server" Enabled="True" TargetControlID="txtprecio" 
                               FilterType="Numbers,Custom" validChars=".">
                </asp:FilteredTextBoxExtender>

                <br />
                <button class="btn btn-primary" id="btnagregar">Agregar</button>
		      		</div> <!-- /widget-content -->
		      		
	      		</div> <!-- /widget -->
	      		
      		</div> <!-- /span6 -->
      		 	
	      	
	      	<div class="span6">
	      		
	      		<div id="target-2" class="widget">
	      			
	      			<div class="widget-content">
	      				
			      		<h1>Detalle de Articulos</h1>
			      		<%--<div  align="right">
                        TOTAL Q.<label id="lbltotal">0.00</label>
                        </div>--%>
			      		<table id="tabladetalle" class="table table-striped table-bordered">
                <thead>
                  <tr >
                    <th> Cantidad </th>
                    <th> Descripcion</th>
                     <th> P/ Unitario</th>
                    <th> Total</th>
                    <th class="td-actions"> </th>
                  </tr>
                </thead>
                <tbody id="compra">
                  <tr>
                   <%-- <td> 1 </td>
                    <td> Samsung Galaxy 4 </td>
                     <td> Q.15.00 </td>
                    <td class="td-actions"><input type="button" value="X" class="btn btn-danger btn-small"></td>--%>
                  </tr>
                 
                
                </tbody>
              </table>
              <div>
			      		<input type="button" class="btn btn-small btn-success" id="btnguardar" value="Guardar">
                       
                        </div>
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
        var contadorTR = 0;
        var valorTotal = 0;
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


        /*INICIO CARGAR PROVEEDORES*/
        $.ajax({
            type: "POST",
            url: "wsconsultas.asmx/cargarProveedores",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            error: proveedornerror,

            async: false,
            success: proveedorcorrecto
        });

        function proveedorcorrecto(msg) {

            $('#dropprov').html("");
            $('#dropprov').append('<option value="0">Seleccione un proveedor</option>');
            $.each(msg.d, function () {

                $('#dropprov').append('<option value="' + this.id + '">' + this.descripcion + '</option>');
            });

        }

        function proveedornerror(msg) {
            alert(msg)

        }
        /*FIN CARGAR PROVEEDORES*/

        /*INICIO CARGAR PRODUCTOS*/
        $.ajax({
            type: "POST",
            url: "wsconsultas.asmx/cargarProductos",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            error: productoerror,

            async: false,
            success: productocorrecto
        });

        function productocorrecto(msg) {

            $('#dropprodu').html("");
            $('#dropprodu').append('<option value="0">Seleccione un producto</option>');
            $.each(msg.d, function () {

                $('#dropprodu').append('<option value="' + this.id + '">' + this.descripcion + '</option>');
            });

        }

        function productoerror(msg) {
            alert(msg)

        }
        /*FIN CARGAR PRODUCTOS*/


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


        //Agregar Tabla
        $('#btnagregar').click(function () {

            var proveedor = document.getElementById('dropprov');
            var producto = document.getElementById('dropprodu');
            var cantidad = document.getElementById('txtcantidad');
            var precio = document.getElementById('txtprecio');
            var totaldetalle = document.getElementById('lbltotal');


            if (proveedor.value == "0" || proveedor.selectedIndex < 1) {
                proveedor.focus();
                return false
            } else if (producto.value == "0" || producto.selectedIndex < 1) {
                producto.focus();
                return false
            } else if (!cantidad.value) {
                cantidad.focus();
                return false
            } else if (!precio.value) {
                precio.focus();
                return false
            } else {

                var total = parseFloat(precio.value) * parseFloat(cantidad.value);

                var contenedor = document.getElementById('tabladetalle');
                //            mensajecorrecto("Datos guardados exitosamente");
                var producto1 = $("#dropprodu option:selected").text();
                var trnew = document.createElement('tr');
                trnew.setAttribute('id', 'Linea' + contadorTR);
                //trnew.setAttribute('class', 'tr_dinamic');
                trnew.innerHTML = "<td>" + document.getElementById("txtcantidad").value + "</td><td id='" + producto.value + "' >" + producto1 + "</td><td>" + document.getElementById("txtprecio").value + "</td><td>" + total + "</td><td style='text-align: center;'>" + '<input type="button" class="btn btn-danger btn-small" id="' + contadorTR + '" value="X">' + "</td>";

                contenedor.appendChild(trnew);


                document.getElementById('dropprov').disabled = true;
                document.getElementById('txtcantidad').value = "";
                document.getElementById('txtprecio').value = "";
                document.getElementById('dropprodu').selectedIndex = 0;
                //document.getElementById('MensajeCorrecto').style.display = '' ;

                $("#MensajeCorrecto").fadeIn();
                $("#MensajeCorrecto").fadeOut(3000);
                contadorTR = contadorTR + 1;
                borralinea();

                return false


            }
        });


        //        $('#btnCorrecto').click(function () {
        //            document.getElementById('MensajeCorrecto').style.display = 'none';
        //            return false
        //        });

        function borralinea() {
            $(".btn-danger").click(function () {
                var nolinea = this.id;
                $("#Linea" + nolinea).remove();
                return false
            });
        }

        $('#btnguardar').click(function () {
            var arreglo
            var contador = 0
            var suma = 0
            var arreglototal
            var textosuma = ""
            var contadorsuma = 0
            var contadorcantidad = 0;
            var textocantidad = ""
            $('#tabladetalle tr').each(function (index) {

                $(this).children("td").each(function (index2) {
                    // console.log($(this).val());
                    switch (index2) {
                        case 1:
                            if (contador == 0)

                                arreglo = ($(this).attr('id'));
                            else
                                arreglo = arreglo + "," + ($(this).attr('id'));

                            contador++
                            break;

                        case 3:

                            suma = parseFloat(suma) + parseFloat(($(this).html()));
                            if (contadorsuma == 0)

                                textosuma = ($(this).html());
                                
                            else
                                textosuma = textosuma + "," + ($(this).html());

                            contadorsuma++

                            break;

                        case 0:

                            
                            if (contadorcantidad == 0)

                                textocantidad = ($(this).text());
                            else
                                textocantidad = textocantidad + "," + ($(this).html());

                            contadorcantidad++

                            break;
                    }

                });

            });

            arreglototal = arreglo + "|" + textosuma + "|" + textocantidad;
            alert(arreglototal)
            return false

            //console.log(arreglo);
            if (confirm('¿Desea Realizar Los Cobros?')) {
                if (arreglo == undefined) {
                    mensajeerror("No hay datos para guardar");

                } else {

                    $.ajax({
                        type: "POST",
                        url: "wscobros.asmx/guardarCobros",
                        data: '{arreglo: "' + arreglo + '"}',
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        error: guardarerror,
                        async: false,
                        success: guardarcorrecto
                    });
                }
            }

            function guardarcorrecto(msg) {

                $.each(msg.d, function () {

                    var respuesta = this.descripcion;
                    if (respuesta.substring(0, 5) == "ERROR")
                        mensajeerror('ERROR: ' + msg.ex);

                    else {
                        //$("#dropunidad").append($("<option></option>").attr("value", this.idunidad).text(idunidad));


                        document.getElementById("frboletos").reset();

                        $("#tablaseries").empty();

                        document.getElementById('txtfechainicial').disabled = false;
                        document.getElementById('txtfechafinal').disabled = false;
                        document.getElementById('txtfechainicial').focus();


                        mensajecorrecto("Datos Guardados Exitosamente");

                        // document.getElementById("txtnueva").focus();
                    }
                });
            }

            function guardarerror(msg) {
                mensajeerror(msg.responseText);
            }

        });


    });
</script>
  </body>

</html>
