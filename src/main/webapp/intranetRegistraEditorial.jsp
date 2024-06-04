
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
<h4>Registra Editorial</h4>
<form id="id_form"> 
	<div class="row">
		<div class="form-group col-md-6">
				<label class="control-label" for="id_nombre">Razón social</label>
				<input class="form-control" type="text" id="id_razonSocial" name="razonSocial" placeholder="Ingrese la rozón social">
		</div>
		<div class="form-group col-md-6">
				<label class="control-label" for="id_apellido">Dirección</label>
				<input class="form-control" type="text" id="id_direccion" name="direccion" placeholder="Ingrese la dirección">
		</div>
	</div>	
	<div class="row">
		<div class="form-group col-md-6">
				<label class="control-label" for="id_telefono">Teléfono</label>
				<input class="form-control" type="text" id="id_telefono" name="telefono" placeholder="Ingrese el teléfono">
		</div>
		<div class="form-group col-md-6">
				<label class="control-label" for="id_fechaCreacion">Fecha Creación</label>
				<input class="form-control" type="date" id="id_fechaCreacion" name="fechaCreacion" placeholder="Ingrese la fecha de creación">
		</div>
	</div>
	<div class="row">
		<div class="form-group col-md-6">
				<label class="control-label" for="id_ruc">RUC</label>
				<input class="form-control" type="text" id="id_ruc" name="ruc" placeholder="Ingrese el RUC">
		</div>

		<div class="form-group col-md-6">
				<label class="control-label" for="id_pais">País</label> 
				<select
					class="form-control" id="id_pais" name="pais" >
					<option value=" ">[Seleccione]</option>
				</select>
		</div>
	</div>
	<div class="row" align="center" style="margin-top: 2%">				
			<button type="button" class="btn btn-primary" id="id_btn_registra_editorial">Crea editorial</button>
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
        	razonSocial : {  
        		selector: "#id_razonSocial",
        		validators : {
        			notEmpty: {
                        message: 'la razón social es requerida'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z\sáéíóúÁÉÍÓÚñÑüÜ}]{4,40}$/,
                        message: 'El nombre tiene de 4 a 40 caracteres'
                    },
                    remote :{
                    	delay   : 1000,
                    	url     : 'validaRemoteEditorialRazonSocial',
                    	message : 'La razón social ya existe'
                    }
        		}
        	},
        	direccion : {  
        		selector: "#id_direccion",
        		validators : {
        			notEmpty: {
                        message: 'la dirección es requerida'
                    },
                    stringLength: {
                        min: 4,
                        max: 40,
                        message: 'la dirección deve de tener entre 4-40 Caracteres (Av. Lima Limón 78487)'
                    },
        		}
        	},
        	fecha : {
        		selector: "#id_fechaCreacion",
        		validators : {
        			notEmpty: {
                        message: 'La fecha de creación es requerida'
                    },
                    regexp: {
                        regexp: /^(1980|19[89]\d|20\d{2})-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])$/,
                        message: 'La fecha tiene que ser del año 1980 para arriba'
                    },
        		}
        	},
        	telefono:{
                selector: "#id_telefono",
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
            ruc : {  
        		selector: "#id_ruc",
        		validators : {
        			notEmpty: {
                        message: 'el ruc es requerido'
                    },
                    stringLength: {
                        max: 11,
                        message: 'El ruc deve de tener entre 11 Caracteres'
                    },
                    regexp: {
                        regexp: /^10\d{9}$/,
                        message: 'El nombre tiener 11 caracteres y empesar en 10'
                    },
                    remote :{
                    	delay   : 1000,
                    	url     : 'validaRemoteEditorialRUC',
                    	message : 'el ruc ya existe'
                    }
        		}
        	},
        	estado : {  
        		selector: "#id_estado",
        		validators : {
        			notEmpty: {
                        message: 'el estado es requerido'
                    },
        		}
        	},
        	pais : {
        		selector: "#id_pais",
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
	$("#id_btn_registra_editorial").click(function(){
		var validator = $('#id_form').data('bootstrapValidator');
		console.log(validator)
	    validator.validate();
		
	    if (validator.isValid()) {
	        $.ajax({
	          type: "POST",
	          url: "registraEditorial", 
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

	$.getJSON("cargaPais", {}, function (data){
		$.each(data, function(index, item){
			$("#id_pais").append("<option value=" +  item.idPais +" >" +  item.nombre + "</option>");
		});	
	});		

	
	function limpiarFormulario(){	
		$('#id_razonSocial').val('');
		$('#id_direccion').val('');
		$('#id_fechaCreacion').val('');
		$('#id_telefono').val(' ');
		$('#id_ruc').val(' ');
		$('#id_estado').val(' ');
	}
</script>
</body>
</html>



