
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
<h4>Crud Autor</h4>

	<div class="container">

		<div class="row" style="margin-top: 5%">
			<div class="col-md-3">
				<label class="control-label" for="id_filtro">Nombre</label> 
			</div>	
			<div class="col-md-6">
				<input	class="form-control" type="text" id="id_filtro" placeholder="Ingrese el nombre">
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
						<th>Nombres</th>
						<th>Apellidos</th>
						<th>Fecha de Nacimiento</th>
						<th>Fecha de Actualización</th>
						<th>Teléfono</th>
						<th>Fecha de Registro</th>
						<th>Estado</th>
						<th>Grado</th>
						<th></th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>


				</tbody>
			</table>
		</div>
		
		<div class="modal fade" id="id_div_modal_registra" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Autor</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_registra">
			                   			<input type="hidden" name="metodo" value="paramInserta">
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombres</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="100"/>
		                                        </div>
		                                    </div> 	
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apellido">Apellidos</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_apellido" name="apellido" placeholder="Ingrese el Apellido" type="text" maxlength="100"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_fechaNacimiento">Fecha de Nacimiento</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_fechaNacimiento" type="date" name="fechaNacimiento"/>
		                                        </div>
		                                    </div> 
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_telefono">Teléfono</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_telefono" name="telefono" placeholder="Ingrese el Teléfono" type="text" maxlength="9"/>
		                                        </div>
		                                    </div>
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_grado">Grado</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_reg_grado" name="grado">
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

		<div class="modal fade" id="id_div_modal_actualiza" >
			<div class="modal-dialog" style="width: 60%">
					<div class="modal-content">
					<div class="modal-header" >
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza de Autor</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_actualiza">
			                   			<input type="hidden" name="metodo" value="paramActualiza">
			                   			<input type="hidden" name="idAutor" id="idAutor">
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_nombre">Nombres</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="100"/>
		                                        </div>
		                                    </div> 	
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_apellido">Apellidos</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_apellido" name="apellido" placeholder="Ingrese el Apellido" type="text" maxlength="100"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_fechaNacimiento">Fecha de Nacimiento</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_fechaNacimiento" type="date" name="fechaNacimiento"/>
		                                        </div>
		                                    </div> 
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_telefono">Teléfono</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_telefono" name="telefono" placeholder="Ingrese el Teléfono" type="text" maxlength="9"/>
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
		                                        <label class="col-lg-3 control-label" for="id_act_grado">Grado</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_grado" name="grado">
														<option value=" ">[Selecione]</option>
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
	</div>
</div>

<script type="text/javascript">
		$("#id_btn_filtro").click(function() {
			var vfiltro = $("#id_filtro").val();
			$.getJSON("crudAutor", {"metodo":"paramLista","filtro":vfiltro}, function(data) {
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
						{data: "idAutor",className:'text-center'},
						{data: "nombres",className:'text-center'},
						{data: "apellidos",className:'text-center'},
						{data: "fechaNacimiento",className:'text-center'},
						{data: "fechaActualizacion",className:'text-center'},
						{data: "telefono",className:'text-center'},
						{data: "fechaRegistro",className:'text-center'},
						{data: function(row, type, val, meta){
							return row.estado == 1 ? "Activo" : "Inactivo";  
						},className:'text-center'},
						{data: "grado.descripcion",className:'text-center'},
						
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-info btn-sm" onClick="verFormularioActualiza(\'' + row.idAutor + '\',\'' +  row.nombres   + '\',\'' +  row.apellidos  + '\',\'' +  row.fechaNacimiento  + '\',\'' +  row.telefono   + '\',\'' +  row.estado   + '\',\'' +  row.grado.idGrado +'\');">Editar</button>';  
						},className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-warning btn-sm" onClick="eliminacionLogica(\'' + row.idAutor +'\');" >E.Lógica</button>';
						},className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-danger btn-sm"  onClick="eliminacionFisica(\'' + row.idAutor+'\');" >E.Física</button>';
						},className:'text-center'},
					]                                     
			    });
		}
		
		function verFormularioActualiza(idAutor, nombres, apellidos, fechaNacimiento, telefono, estado, grado){
			console.log(">> verFormularioActualiza >> " + idAutor);
			$("#id_div_modal_actualiza").modal("show");
			$("#idAutor").val(idAutor);
			$("#id_act_nombre").val(nombres);
			$("#id_act_apellido").val(apellidos);
			$("#id_act_fechaNacimiento").val(fechaNacimiento);
			$("#id_act_telefono").val(telefono);
			$("#id_act_estado").val(estado);
			$("#id_act_grado").val(grado);
		}
		
		$.getJSON("cargaGrado",{}, function (data){
			$.each(data, function(index, item){
				$("#id_reg_grado").append("<option value='"+ item.idGrado +"'>"+ item.descripcion+"</option>");
				$("#id_act_grado").append("<option value='"+ item.idGrado +"'>"+ item.descripcion+"</option>");
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
			          url: "crudAutor", 
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
		
		function eliminacionFisica(idAutor){	
			var array = [idAutor];
			mostrarMensajeConfirmacion(MSG_ELIMINAR, accionEliminacionFisica,null,array);
		}
		
		function accionEliminacionFisica(array){
			 $.ajax({
		          type: "POST",
		          url: "crudAutor", 
		          data: {"metodo":"paramEFisica", "idAutor":array[0]},
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
			          url: "crudAutor", 
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
		
		
		function eliminacionLogica(idAutor){
			 $.ajax({
		          type: "POST",
		          url: "crudAutor", 
		          data: {"metodo":"paramELogica", "idAutor":idAutor},
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
		        	nombre : {  
		        		selector: "#id_reg_nombre",
		        		validators : {
		        			notEmpty: {
		                        message: 'El nombre es requerido'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 30,
		                        message: 'El nombre tiene de 3 a 30 caracteres'
		                    },
		        		}
		        	},
		        	apellido : {  
		        		selector: "#id_reg_apellido",
		        		validators : {
		        			notEmpty: {
		                        message: 'El apellido es requerido'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 30,
		                        message: 'El apellido tiene de 3 a 30 caracteres'
		                    },
		        		}
		        	},
		        	fecha : {
		        		selector: "#id_reg_fechaNacimiento",
		        		validators : {
		        			notEmpty: {
		                        message: 'La fecha de nacimiento es requerida'
		                    },
		        		}
		        	},
		        	telefono:{
		                selector: "#id_reg_telefono",
		                validators:{
		                    notEmpty: {
		                         message: 'El teléfono es obligatorio'
		                    },
		                    regexp: {
		                        regexp: /^[0-9]{9}$/,
		                        message: 'El teléfono es 9 dígitos'
		                    }
		                }
		            },
		        	grado : {
		        		selector: "#id_reg_grado",
		        		validators : {
		        			notEmpty: {
		                        message: 'El grado es requerido'
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
		        	nombre : {  
		        		selector: "#id_act_nombre",
		        		validators : {
		        			notEmpty: {
		                        message: 'El nombre es requerido'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 30,
		                        message: 'El nombre tiene de 3 a 30 caracteres'
		                    },
		        		}
		        	},
		        	apellido : {  
		        		selector: "#id_act_apellido",
		        		validators : {
		        			notEmpty: {
		                        message: 'El apellido es requerido'
		                    },
		                    stringLength: {
		                        min: 3,
		                        max: 30,
		                        message: 'El apellido tiene de 3 a 30 caracteres'
		                    },
		        		}
		        	},
		        	fecha : {
		        		selector: "#id_act_fechaNacimiento",
		        		validators : {
		        			notEmpty: {
		                        message: 'La fecha de nacimiento es requerida'
		                    },
		        		}
		        	},
		        	telefono:{
		                selector: "#id_act_telefono",
		                validators:{
		                    notEmpty: {
		                         message: 'El teléfono es obligatorio'
		                    },
		                    regexp: {
		                        regexp: /^[0-9]{9}$/,
		                        message: 'El teléfono es 9 dígitos'
		                    }
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
		        	grado : {
		        		selector: "#id_act_grado",
		        		validators : {
		        			notEmpty: {
		                        message: 'El grado es requerido'
		                    },
		        		}
		        	},    
		        }
		    });
		});
		function limpiarFormulario(){	
			$('#id_reg_nombre').val("");
			$('#id_reg_apellido').val("");
			$('#id_reg_fechaNacimiento').val(" ");
			$('#id_reg_telefono').val("");
			$('#id_reg_grado').val("");
			
			$('#id_act_nombre').val("");
			$('#id_act_apellido').val("");
			$('#id_act_fechaNacimiento').val(" ");
			$('#id_act_telefono').val("");
			$('#id_act_grado').val("");
		}
	</script>

</body>
</html>



