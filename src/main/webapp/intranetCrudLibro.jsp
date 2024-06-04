
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Sistemas - Jorge Jacinto Gutarra</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h4>Crud Libro</h4>
<div class="container">

		<div class="row" style="margin-top: 5%">
			<div class="col-md-3">
				<label class="control-label" for="id_filtro">Título</label> 
			</div>	
			<div class="col-md-6">
				<input	class="form-control" type="text" id="id_filtro" placeholder="Ingrese el título">
			</div>	
			<div class="col-md-1">
				<button type="button" class="btn btn-primary" id="id_btn_filtro">Filtra</button>
			</div>	
			<div class="col-md-1">
				<button type="button" class="btn btn-primary"  data-toggle='modal' data-target="#id_div_modal_registra" >Registra</button>
			</div>	
		</div>


		<div class="row" style="margin-top: 4%">
			<table id="id_table" class="table table-bordered table-hover table-condensed" >
				<thead style='background-color:#337ab7; color:white'>
					<tr>
						<th>Código</th>
						<th>Título</th>
						<th>Año</th>
						<th>Serie</th>
						<th>Tema</th>
						<th>Estado</th>
						<th>Categoría</th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>


				</tbody>
			</table>
		</div>
		
		<!-- INICIO MODAL DE REGISTRO -->
		<div class="modal fade" id="id_div_modal_registra" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Revista</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_registra">
			                   			<input type="hidden" name="metodo" value="paramInserta">
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_titulo">Título</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_titulo" name="titulo" placeholder="Ingrese el Título" type="text" maxlength="60"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_anio">Año</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_anio" name="anio" placeholder="Ingrese el Año" type="text" maxlength="4"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_serie">Serie</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_serie" name="serie" placeholder="Ingrese la Serie" type="text" maxlength="16"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_tema">Tema</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_tema" name="tema" placeholder="Ingrese el Tema" type="text" maxlength="70"/>
		                                        </div>
		                                    </div> 
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_categoria">Categoría</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_reg_categoria" name="categoria">
														<option value=" ">[Selecione]</option>
													</select>
		                                        </div>
		                                    </div> 	 
		                                    <div class="form-group">
		                                        <div class="col-lg-12" align="center">
		                                        	<button type="button" style="width: 80px" id="id_btn_registra" class="btn btn-primary btn-sm">Registrar</button>
		                                        	<button type="button" style="width: 80px" id="id_btn_reg_cancelar" class="btn btn-primary btn-sm" data-dismiss="modal">Cancelar</button>
		                                        </div>
		                                    </div>   
			                             </div>
			                             </form>
			                        </div>
			                   </div>
			              </div>
					</div>
				</div>
			</div>
		</div>
 
		<!-- FIN MODAL DE REGISTRO -->
		
		<!-- FIN MODAL DE REGISTRO -->
		
		<!-- INICIO MODAL DE ACTUALIZA -->
		<div class="modal fade" id="id_div_modal_actualiza" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza de Revista</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_actualiza">
			                   			<input type="hidden" name="metodo" value="paramActualiza">
			                   			<input type="hidden" name="idLibro" id="idLibro">
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_titulo">Título</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_titulo" name="titulo" placeholder="Ingrese el Título" type="text" maxlength="60"/>
		                                        </div>
		                                    </div> 	
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_anio">Año</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_anio" name="anio" placeholder="Ingrese el Año" type="text" maxlength="4"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_serie">Serie</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_serie" name="serie" placeholder="Ingrese la Serie" type="text" maxlength="16"/>
		                                        </div>
		                                    </div> 
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_tema">Tema</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_tema" name="tema" placeholder="Ingrese el Tema" type="text" maxlength="70"/>
		                                        </div>
		                                    </div> 
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_estado">Estado</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_estado" name="estado">
														<option value=" ">[Seleccione]</option>
														<option value="1">Activo</option>
														<option value="0">Inactivo</option>
													</select>
		                                        </div>
		                                    </div> 	 
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_categoria">Categoría</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_categoria" name="categoria">
														<option value=" ">[Seleccione]</option>
													</select>
		                                        </div>
		                                    </div> 	 
		                                    <div class="form-group">
		                                        <div class="col-lg-12" align="center">
		                                        	<button type="button" style="width: 80px" id="id_btn_actualiza" class="btn btn-primary btn-sm">Actualizar</button>
		                                        	<button type="button" style="width: 80px" id="id_btn_act_cancelar" class="btn btn-primary btn-sm" data-dismiss="modal">Cancelar</button>
		                                        </div>
		                                    </div>   
			                             </div>
			                             </form>
			                        </div>
			                   </div>
			              </div>
					</div>
				</div>
			</div>
		</div>	
		<!-- FIN MODAL DE ACTUALIZA -->
		
	</div>
</div>


	<script type="text/javascript">
		$("#id_btn_filtro").click(function() {
			var vfiltro = $("#id_filtro").val();
			$.getJSON("crudLibro", {"metodo":"paramLista","filtro":vfiltro}, function(data) {
				agregarGrilla(data);
			});
		});
		
		function agregarGrilla(lista){
			 $('#id_table').DataTable().clear();
			 $('#id_table').DataTable().destroy();
			 $('#id_table').DataTable({
					data: lista,
					language: IDIOMA,
					searching: true,
					ordering: true,
					processing: true,
					pageLength: 10,
					lengthChange: false,
					info:true,
					scrollY: 305,
			        scroller: {
			            loadingIndicator: true
			        },
					columns:[
						{data: "idLibro", className:'text-center'},
			            {data: "titulo", className:'text-center'},
			            {data: "anio", className:'text-center'},
			            {data: "serie", className:'text-center'},
			            {data: "tema", className:'text-center'},
						{data: function(row, type, val, meta){
							return row.estado == 1 ? "Activo" : "Inactivo";  
						},className:'text-center'},
						{data: "categoria.descripcion", className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-info btn-sm" onClick="verFormularioActualiza(\'' + row.idLibro + '\',\'' +  row.titulo   + '\',\'' +  row.anio   + '\',\'' + row.serie   + '\',\''  +  row.tema   + '\',\'' +  row.estado   + '\',\'' +  row.categoria.idCategoria +'\');">Editar</button>';  
						},className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-warning btn-sm" onClick="eliminacionLogica(\'' + row.idLibro +'\');" >E.Lógica</button>';
						},className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-danger btn-sm"  onClick="eliminacionFisica(\'' + row.idLibro +'\');" >E.Física</button>';
						},className:'text-center'},
					]                                     
			    });
		}
		
		function verFormularioActualiza(idLibro, titulo, anio, serie, tema, estado, categoria){
			console.log(">> verFormularioActualiza >> " + idLibro);
			$("#id_div_modal_actualiza").modal("show");
			$("#idLibro").val(idLibro);
			$("#id_act_titulo").val(titulo);
			$("#id_act_anio").val(anio);
			$("#id_act_serie").val(serie);
			$("#id_act_tema").val(tema);
			$("#id_act_estado").val(estado);
			$("#id_act_categoria").val(categoria);
		}
		
		$.getJSON("cargaCategoria",{}, function (data){
			$.each(data, function(index, item){
				$("#id_reg_categoria").append("<option value='"+ item.idCategoria +"'>"+ item.descripcion+"</option>");
				$("#id_act_categoria").append("<option value='"+ item.idCategoria +"'>"+ item.descripcion+"</option>");
			})
		});
		
		
		$("#id_btn_registra").click(function() {
			console.log(">>> [ini] >> inserta ");
			console.log($('#id_form_registra').serialize());
			
			var validator = $('#id_form_registra').data('bootstrapValidator');
		    validator.validate();
			
		    if (validator.isValid()) {
		    	 $.ajax({
			          type: "POST",
			          url: "crudLibro", 
			          data: $('#id_form_registra').serialize(),
			          success: function(data){
			        	  mostrarMensaje(data.mensaje);
			        	  agregarGrilla(data.datos);
			        	  validator.resetForm();
			        	  $('#id_div_modal_registra').modal("hide");
			          },
			          error: function(){
			        	  mostrarMensaje(MSG_ERROR);
			          }
			    });
		    }
		});
		
		function eliminacionFisica(idLibro){	
			var array = [idLibro];
			mostrarMensajeConfirmacion(MSG_ELIMINAR, accionEliminacionFisica,null,array);
		}
		
		function accionEliminacionFisica(array){
			 $.ajax({
		          type: "POST",
		          url: "crudLibro", 
		          data: {"metodo":"paramEFisica", "idLibro":array[0]},
		          success: function(data){
		        	  mostrarMensaje(data.mensaje);
		        	  agregarGrilla(data.datos);
		          },
		          error: function(){
		        	  mostrarMensaje(MSG_ERROR);
		          }
		    });
		}
		
		$("#id_btn_actualiza").click(function() {
			var validator = $('#id_form_actualiza').data('bootstrapValidator');
		    validator.validate();
			
		    if (validator.isValid()) {
		        $.ajax({
			          type: "POST",
			          url: "crudLibro", 
			          data: $('#id_form_actualiza').serialize(),
			          success: function(data){
			        	  mostrarMensaje(data.mensaje);
			        	  agregarGrilla(data.datos);
			        	  validator.resetForm();
			        	  $('#id_div_modal_actualiza').modal("hide");
			          },
			          error: function(){
			        	  mostrarMensaje(MSG_ERROR);
			          }
			    });
		    }
		});
		
		
		function eliminacionLogica(idLibro){
			 $.ajax({
		          type: "POST",
		          url: "crudLibro", 
		          data: {"metodo":"paramELogica", "idLibro":idLibro},
		          success: function(data){
		        	  agregarGrilla(data.datos);
		          },
		          error: function(){
		        	  mostrarMensaje(MSG_ERROR);
		          }
		    });
		}
		
		$(document).ready(function() {
		    $('#id_form_registra').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        
		        fields:{
		        	titulo : {  
		        		selector: "#id_reg_titulo",
		        		validators : {
		        			notEmpty: {
		                        message: 'El título es requerido'
		                    },
		                    regexp: {
		                        regexp: /^[a-zA-Z\sáéíóúÁÉÍÓÚñÑüÜ}]{3,50}$/,
		                        message: 'El título tiene de 3 a 50 caracteres'
		                    },
		                    remote :{
		                    	delay   : 1000,
		                    	url     : 'validaRemoteLibro',
		                    	message : 'El título ya existe'
		                    }
		        		}
		        	},
		        	anio : {
		        		selector: "#id_reg_anio",
		        		validators : {
		        			notEmpty: {
		                        message: 'El anio es requerido'
		                    },
		                    stringLength: {
		                        min: 4,
		                        max: 4,
		                        message: 'El anio debe tener 4 caracteres'
		                    },
		        		}
		        	},
		        	serie : {
		        		selector: "#id_reg_serie",
		        		validators : {
		        			notEmpty: {
		                        message: 'La serie es requerida'
		                    },
		                    regexp: {
		                        regexp: /^[A-Z]{3}\d{7}$/,
		                        message: 'La serie tiene 10 caracteres'
		                    },
		        		}
		        	},
		        	tema : {
		        		selector: "#id_reg_tema",
		        		validators : {
		        			notEmpty: {
		                        message: 'El tema es requerido'
		                    },
		                    regexp: {
		                        regexp: /^(?=.*\S)[\s\S]{3,60}$/,
		                        message: 'El tema tiene de 3 a 60 caracteres'
		                    },
		        		}
		        	},
		        	estado : {
		        		selector: "#id_reg_estado",
		        		validators : {
		        			notEmpty: {
		                        message: 'El estado es requerido'
		                    },
		        		}
		        	},     
		        	categoria : {
		        		selector: "#id_reg_categoria",
		        		validators : {
		        			notEmpty: {
		                        message: 'La categoría es requerida'
		                    },
		        		}
		        	},        	
		        }
		    });
		});
		
		$(document).ready(function() {
		    $('#id_form_actualiza').bootstrapValidator({
		        message: 'This value is not valid',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        
		        fields:{
		        	titulo : {  
		        		selector: "#id_act_titulo",
		        		validators : {
		        			notEmpty: {
		                        message: 'El título es requerido'
		                    },
		                    regexp: {
		                        regexp: /^[a-zA-Z\sáéíóúÁÉÍÓÚñÑüÜ}]{3,50}$/,
		                        message: 'El título tiene de 3 a 50 caracteres'
		                    },
		                    remote :{
		                    	delay   : 1000,
		                    	url     : 'validaRemoteLibro',
		                    	message : 'El título ya existe'
		                    }
		        		}
		        	},
		        	anio : {
		        		selector: "#id_act_anio",
		        		validators : {
		        			notEmpty: {
		                        message: 'El anio es requerido'
		                    },
		                    stringLength: {
		                        min: 4,
		                        max: 4,
		                        message: 'El anio debe tener 4 caracteres'
		                    },
		        		}
		        	},
		        	serie : {
		        		selector: "#id_act_serie",
		        		validators : {
		        			notEmpty: {
		                        message: 'La serie es requerida'
		                    },
		                    regexp: {
		                        regexp: /^[A-Z]{3}\d{7}$/,
		                        message: 'La serie tiene 10 caracteres'
		                    },
		        		}
		        	},
		        	tema : {
		        		selector: "#id_act_tema",
		        		validators : {
		        			notEmpty: {
		                        message: 'El tema es requerido'
		                    },
		                    regexp: {
		                        regexp: /^(?=.*\S)[\s\S]{3,60}$/,
		                        message: 'El tema tiene de 3 a 60 caracteres'
		                    },
		        		}
		        	},
		        	estado : {
		        		selector: "#id_act_estado",
		        		validators : {
		        			notEmpty: {
		                        message: 'El estado es requerido'
		                    },
		        		}
		        	},     
		        	categoria : {
		        		selector: "#id_act_categoria",
		        		validators : {
		        			notEmpty: {
		                        message: 'La categoría es requerida'
		                    },
		        		}
		        	},        	
		        }
		    });
		});
		function limpiarFormulario(){	
			$('#id_reg_titulo').val("");
			$('#id_reg_anio').val("");
			$('#id_reg_serie').val(" ");
			$('#id_reg_tema').val(" ");
			$('#id_reg_categoria').val("");
			$('#id_act_titulo').val("");
			$('#id_act_anio').val("");
			$('#id_act_serie').val(" ");
			$('#id_act_tema').val(" ");
			$('#id_act_categoria').val(" ");
		}
	</script>
</body>
</html>



