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
<h4>Crud Alumno</h4>

<div class="container">

		<div class="row" style="margin-top: 5%">
			<div class="col-md-3">
				<label class="control-label" for="id_filtro">Nombres</label> 
			</div>	
			<div class="col-md-6">
				<input	class="form-control" type="text" id="id_filtro" placeholder="Ingrese los nombres">
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
						<th>C�digo</th>
						<th>Nombres</th>
						<th>Apellidos</th>
						<th>Tel�fono</th>
						<th>DNI</th>
						<th>Correo</th>
						<th>Fecha de Nacimiento</th>
						<th>Estado</th>
						<th>Pa�s</th>
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
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Alumnos</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_registra">
			                   			<input type="hidden" name="metodo" value="paramInserta">
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_reg_nombres">Nombres</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_nombres" name="nombres" placeholder="Ingrese los Nombres" type="text" maxlength="50"/>
		                                        </div>
		                                    </div> 	
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apellidos">Apellidos</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_apellidos" name="apellidos" placeholder="Ingrese los Apellidos" type="text" maxlength="50"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_telefono">Tel�fono</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_telefono" name="telefono" placeholder="Ingrese el tel�fono" type="text" maxlength="9"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_dni">DNI</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_dni" name="dni" placeholder="Ingrese el dni" type="text" maxlength="8"/>
		                                        </div>
		                                    </div> 	
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_correo">Correo</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_correo" name="correo" placeholder="Ingrese el correo" type="text" maxlength="50"/>
		                                        </div>
		                                    </div> 	
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_fechaNacimiento">Fecha de Nacimiento</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_reg_fechaNacimiento" type="date" name="fechaNacimiento"/>
		                                        </div>
		                                    </div>
			                                <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_pais">Pa�s</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_reg_pais" name="pais">
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
						<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualizaci�n de Alumnos</h4>
					</div>
					<div class="modal-body" >
						 <div class="panel-group" id="steps">
			                   <div class="panel panel-default">
			                   		<div id="stepOne" class="panel-collapse collapse in">
			                   			<form id="id_form_actualiza">
			                   			<input type="hidden" name="metodo" value="paramActualiza">
			                   			<input type="hidden" name="idAlumno" id="idAlumno">
			                   			<div class="panel-body">
			                                <div class="form-group" >
		                                        <label class="col-lg-3 control-label" for="id_act_nombres">Nombres</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_nombres" name="nombres" placeholder="Ingrese los Nombres" type="text" maxlength="50"/>
		                                        </div>
		                                    </div> 	
											<div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_apellidos">Apellidos</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_apellidos" name="apellidos" placeholder="Ingrese los Apellidos" type="text" maxlength="50"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_telefono">Tel�fono</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_telefono" name="telefono" placeholder="Ingrese el Tel�fono" type="text" maxlength="9"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_dni">DNI</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_dni" name="dni" placeholder="Ingrese el Dni" type="text" maxlength="8"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_correo">Correo</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_correo" name="correo" placeholder="Ingrese el Correo" type="text" maxlength="50"/>
		                                        </div>
		                                    </div> 	
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_fechaNacimiento">Fecha de Nacimiento</label>
		                                        <div class="col-lg-8">
													<input class="form-control" id="id_act_fechaNacimiento" type="date" name="fechaNacimiento"/>
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
		                                        <label class="col-lg-3 control-label" for="id_act_pais">Pa�s</label>
		                                        <div class="col-lg-8">
													<select class="form-control" id="id_act_pais" name="pais">
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
			$.getJSON("crudAlumno", {"metodo":"paramLista","filtro":vfiltro}, function(data) {
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
						{data: "idAlumno",className:'text-center'},
						{data: "nombres",className:'text-center'},
						{data: "apellidos",className:'text-center'},
						{data: "telefono",className:'text-center'},
						{data: "dni",className:'text-center'},
						{data: "correo",className:'text-center'},
						{data: "fechaNacimiento", className:'text-center'},
						{data: function(row, type, val, meta){
							return row.estado == 1 ? "Activo" : "Inactivo";  
						},className:'text-center'},
						{data: "pais.nombre",className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-info btn-sm" onClick="verFormularioActualiza(\'' + row.idAlumno + '\',\'' +  row.nombres   + '\',\'' +  row.apellidos   + '\',\'' +  row.telefono   + '\',\''+  row.dni   + '\',\'' +  row.correo   + '\',\''+row.fechaNacimiento   + '\',\'' +  row.estado   + '\',\'' +  row.pais.idPais +'\');">Editar</button>';  
						},className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-warning btn-sm" onClick="eliminacionLogica(\'' + row.idAlumno +'\');" >E.L�gica</button>';
						},className:'text-center'},
						{data: function(row, type, val, meta){
							return '<button type="button" class="btn btn-danger btn-sm"  onClick="eliminacionFisica(\'' + row.idAlumno +'\');" >E.F�sica</button>';
						},className:'text-center'},
					]                                     
			    });
		}
		
		function verFormularioActualiza(idAlumno, nombres, apellidos, telefono, dni, correo, fechaNacimiento, estado, pais){
			console.log(">> verFormularioActualiza >> " + idAlumno);
			$("#id_div_modal_actualiza").modal("show");
			$("#idAlumno").val(idAlumno);
			$("#id_act_nombres").val(nombres);
			$("#id_act_apellidos").val(apellidos);
			$("#id_act_telefono").val(telefono);
			$("#id_act_dni").val(dni);
			$("#id_act_correo").val(correo);
			$("#id_act_fechaNacimiento").val(fechaNacimiento);
			$("#id_act_estado").val(estado);
			$("#id_act_pais").val(pais);
		}
		
		$.getJSON("cargaPais",{}, function (data){
			$.each(data, function(index, item){
				$("#id_reg_pais").append("<option value='"+ item.idPais +"'>"+ item.nombre+"</option>");
				$("#id_act_pais").append("<option value='"+ item.idPais +"'>"+ item.nombre+"</option>");
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
			          url: "crudAlumno", 
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
		
		function eliminacionFisica(idAlumno){	
			var array = [idAlumno];
			mostrarMensajeConfirmacion(MSG_ELIMINAR, accionEliminacionFisica,null,array);
		}
		
		function accionEliminacionFisica(array){
			 $.ajax({
		          type: "POST",
		          url: "crudAlumno", 
		          data: {"metodo":"paramEFisica", "idAlumno":array[0]},
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
			          url: "crudAlumno", 
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
		
		
		function eliminacionLogica(idAlumno){
			 $.ajax({
		          type: "POST",
		          url: "crudAlumno", 
		          data: {"metodo":"paramELogica", "idAlumno":idAlumno},
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
		        	nombres : {  
		        		selector: "#id_reg_nombres",
		        		validators : {
		        			notEmpty: {
		                        message: 'Los nombres son requeridos'
		                    },
		                    regexp: {
                                regexp: /^[a-zA-Z\s��������������}]{3,30}$/,
                                message: 'Los Nombres tienen de 4 a 40 caracteres'
              ��������������},
              				remote :{
              				delay   : 1000,
              				url     : 'validarAlumno',
              				message : 'El nombre ya existe'
             				}
		        		}
		        	},
		        	apellidos : {
		        		selector: "#id_reg_apellidos",
		        		validators : {
		        			regexp: {
                                regexp: /^[a-zA-Z\s��������������}]{3,30}$/,
                                message: 'Los Apellidos tienen de 4 a 40 caracteres'
              ��������������},
              				remote :{
              				delay   : 1000,
              				url     : 'validarAlumno',
              				message : 'El apellido ya existe'
             				}
		        		}
		        	},
		        	telefono : {
		        		selector: "#id_reg_telefono",
		        		validators : {
		        			notEmpty: {
		                        message: 'El tel�fono es requerido'
		                    },
		                    regexp: {
                                regexp: /^9[0-9]{8}$/,
                                message: 'El tel&eacute;fono es 9 d&iacute;gitos'
                            },
                            remote :{
                  				delay   : 1000,
                  				url     : 'validarAlumno',
                  				message : 'El tel�fono ya existe'
                 				}
		        		}
		        	},
		        	dni : {
		        		selector: "#id_reg_dni",
		        		validators : {
		        			notEmpty: {
		                        message: 'El dni es requerido'
		                    },
		                    regexp: {
                                regexp: /^[0-9]{8}$/,
                                message: 'El DNI es 8 d&iacute;gitos'
                            },
                            remote :{
                  				delay   : 1000,
                  				url     : 'validarAlumno',
                  				message : 'El DNI ya existe'
                 				}
		        		}
		        	},
		        	correo : {
		        		selector: "#id_reg_correo",
		        		validators : {
		        			notEmpty: {
		                        message: 'El correo es requerido'
		                    },
		                    regexp: {
                    			regexp: /^i[0-9]+@cibertec\.edu\.pe$/,
                        		message: 'El correo debe ser de Cibertec'
                   			 },
		        		}
		        	},
		        	fechaNacimiento : {
		        		selector: "#id_reg_fechaNacimiento",
		        		validators : {
		        			notEmpty: {
		                        message: 'La fecha de creaci�n es requerida'
		                    },
		                    regexp: {
                                regexp: /^(?:19\d\d|20(?:0[0-9]|1[0-9]))-(?:0[1-4]|1[0-2])-(?:0[1-9]|[12][0-9]|30)$/,
                                message: 'La fecha debe ser mayor de edad'
              ��������������},
		        		}
		        	},
		        	pais : {
		        		selector: "#id_reg_pais",
		        		validators : {
		        			notEmpty: {
		                        message: 'El pa�s es requerido'
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
		        	nombres : {  
		        		selector: "#id_act_nombres",
		        		validators : {
		        			notEmpty: {
		                        message: 'Los nombres son requeridos'
		                    },
		                    regexp: {
                                regexp: /^[a-zA-Z\s��������������}]{3,30}$/,
                                message: 'Los Nombres tienen de 4 a 40 caracteres'
              ��������������},
              				remote :{
              				delay   : 1000,
              				url     : 'validarAlumno',
              				message : 'El nombre ya existe'
             				}
		        		}
		        	},
		        	apellidos : {
		        		selector: "#id_act_apellidos",
		        		validators : {
		        			notEmpty: {
		                        message: 'Los apellidos son requeridos'
		                    },
		                    regexp: {
                                regexp: /^[a-zA-Z\s��������������}]{3,30}$/,
                                message: 'Los Apellidos tienen de 4 a 40 caracteres'
              ��������������},
              				remote :{
              				delay   : 1000,
              				url     : 'validarAlumno',
              				message : 'El apellido ya existe'
             				}   
		        		}
		        	},
		        	
		        	telefono : {
		        		selector: "#id_act_telefono",
		        		validators : {
		        			notEmpty: {
		                        message: 'El tel�fono es requerido'
		                    },
		                    regexp: {
                                regexp: /^9[0-9]{8}$/,
                                message: 'El tel&eacute;fono es 9 d&iacute;gitos'
                            },
                            remote :{
                  				delay   : 1000,
                  				url     : 'validarAlumno',
                  				message : 'El tel�fono ya existe'
                 				}
		        		}
		        	},
		        	dni : {
		        		selector: "#id_act_dni",
		        		validators : {
		        			notEmpty: {
		                        message: 'El DNI es requerido'
		                    },
		                    regexp: {
                                regexp: /^[0-9]{8}$/,
                                message: 'El DNI es 8 d&iacute;gitos'
                            },
                            remote :{
                  				delay   : 1000,
                  				url     : 'validarAlumno',
                  				message : 'El DNI ya existe'
                 				}
		        		}
		        	},
		        	correo : {
		        		selector: "#id_act_correo",
		        		validators : {
		        			notEmpty: {
		                        message: 'El correo es requerido'
		                    },
		                    regexp: {
                    			regexp: /^i[0-9]+@cibertec\.edu\.pe$/,
                        		message: 'El correo debe ser de Cibertec'
                   			 },
		        		}
		        	},
		        	fechaNacimiento : {
		        		selector: "#id_act_fechaNacimiento",
		        		validators : {
		        			notEmpty: {
		                        message: 'La fecha de creaci�n es requerida'
		                    },
		                    regexp: {
                                regexp: /^(?:19\d\d|20(?:0[0-9]|1[0-9]))-(?:0[1-4]|1[0-2])-(?:0[1-9]|[12][0-9]|30)$/,
                                message: 'La fecha debe ser mayor de edad'
              ��������������},
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
		        	pais : {
		        		selector: "#id_act_pais",
		        		validators : {
		        			notEmpty: {
		                        message: 'El pais es requerido'
		                    },
		        		}
		        	},        	
		        }
		    });
		});
		
		/*Lizarraga*/
		function limpiarFormulario(){	
			$('#id_reg_nombres').val("");
			$('#id_reg_telefono').val("");
			$('#id_reg_fechaNacimiento').val(" ");
		
			$('#id_reg_pais').val("");
			$('#id_act_nombres').val("");
			$('#id_act_telefono').val("");
			$('#id_act_fechaNacimiento').val(" ");
			
			$('#id_act_pais').val(" ");
		}
	</script>
</body>
</html>