<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/global.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Sistemas - Jorge Jacinto Gutarra</title>
</head>
<body>

<jsp:include page="intranetCabecera.jsp" />

<div class="container" style="margin-top: 5%">
	<h4>Registro Autor</h4>
</div>

<div class="container" style="margin-top: 2%">
<form id="id_form"> 
	<div class="row">
		<div class="form-group col-md-6">
				<label class="control-label" for="id_nombre">Nombres</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
		</div>
		<div class="form-group col-md-6">
				<label class="control-label" for="id_apellido">Apellidos</label>
				<input class="form-control" type="text" id="id_apellido" name="apellido" placeholder="Ingrese el apellido">
		</div>
	</div>	
	<div class="row">
		<div class="form-group col-md-6">
				<label class="control-label" for="id_fechaNacimiento">Fecha Nacimiento</label>
				<input class="form-control" type="date" id="id_fechaNacimiento" name="fechaNacimiento">
		</div>
		<div class="form-group col-md-6">
				<label class="control-label" for="id_telefono">Teléfono</label>
				<input class="form-control" type="text" id="id_telefono" name="telefono" placeholder="Ingrese el tel&eacute;fono" maxlength="9">
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-6">
				<label class="control-label" for="id_grado">Grado</label> 
				<select
					class="form-control" id="id_grado" name="grado" >
					<option value=" ">[Seleccione]</option>
				</select>
		</div>
	</div>
	<div class="row" align="center" style="margin-top: 2%">				
			<button type="button" class="btn btn-primary" id="id_btn_registra_autor">Crea Autor</button>
	</div>	
</form>			
</div>


<script type="text/javascript">
$(document).ready(function() {
    $('#id_form').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        
        fields:{
        	nombre : {  
        		selector: "#id_nombre",
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
        		selector: "#id_apellido",
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
        		selector: "#id_fechaNacimiento",
        		validators : {
        			notEmpty: {
                        message: 'La fecha de nacimiento es requerida'
                    },
        		}
        	},
        	telefono:{
                selector: "#id_telefono",
                validators:{
                    notEmpty: {
                         message: 'El tel&eacute;fono es obligatorio'
                    },
                    regexp: {
                        regexp: /^[0-9]{9}$/,
                        message: 'El tel&eacute;fono es 9 dígitos'
                    }
                }
            },
        	grado : {
        		selector: "#id_grado",
        		validators : {
        			notEmpty: {
                        message: 'La grado es requerida'
                    },
        		}
        	},    
        	
        }
  
    });

});
</script>


<script type="text/javascript">
	$("#id_btn_registra_autor").click(function(){
		var validator = $('#id_form').data('bootstrapValidator');
	    validator.validate();
		
	    if (validator.isValid()) {
	        $.ajax({
	          type: "POST",
	          url: "registraAutor", 
	          data: $('#id_form').serialize(),
	          success: function(data){
	        	  mostrarMensaje(data.mensaje);
	        	  limpiarFormulario();
	        	  validator.resetForm();
	          },
	          error: function(){
	        	  mostrarMensaje(MSG_ERROR);
	          }
	        });
	        
	    }
	});

	$.getJSON("cargaGrado", {}, function (data){
		$.each(data, function(index, item){
			$("#id_grado").append("<option value=" +  item.idGrado +" >" +  item.descripcion + "</option>");
		});	
	});		

	
	function limpiarFormulario(){	
		$('#id_nombre').val('');
		$('#id_apellido').val('');
		$('#id_fechaNacimiento').val('');
		$('#id_telefono').val(' ');
		$('#id_grado').val(' ');
	}
</script>
	
</body>
