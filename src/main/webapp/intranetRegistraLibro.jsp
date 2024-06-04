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
	<div class="container" style="margin-top: 4%">

		<div class="container">
			<h3>Registro Libro</h3>

			<form action="" id="id_form">
				<div class="row" style="margin-top: 5%">
					<!-- Primera columna -->
					<div class="col-sm-6">
						<div class="form-group">
							<label for="id_titulo" class="control-label">Título</label> <input
								class="form-control" type="text" id="id_titulo" name="titulo"
								placeholder="Ingrese el titulo" maxlength="60">
						</div>
						<div class="form-group">
							<label for="id_anio" class="control-label">Año</label> <input
								class="form-control" type="text" id="id_anio" name="anio"
								placeholder="Ingrese el año" maxlength="4">
						</div>
						<div class="form-group">
							<label for="id_serie" class="control-label">Serie</label> <input
								class="form-control" type="text" id="id_serie" name="serie"
								placeholder="Ingrese el serie" maxlength="16">
						</div>

					</div>

					<!-- Segunda columna -->
					<div class="col-sm-6">
						<div class="form-group">
							<label for="id_tema" class="control-label">Tema</label> <input
								class="form-control" type="text" id="id_tema" name="tema"
								placeholder="Ingrese el tema" maxlength="70">
						</div>

						<div class="form-group">
							<label class="control-label" for="id_categoria">Categoría</label>
							<select class="form-control" id="id_categoria" name="categoria">
								<option value=" ">[Seleccione]</option>
							</select>
						</div>
					</div>
				</div>

				<div class="row" style="margin-top: 2%" align="center">
					<button id="id_registrar" type="button" value="Enviar"
						class="btn btn-primary">Crear Libro</button>
				</div>
			</form>
		</div>
	</div>
</body>
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
        	titulo : {  
        		selector: "#id_titulo",
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
        		selector: "#id_anio",
        		validators : {
        			notEmpty: {
                        message: 'El anio es requerido'
                    },
        		}
        	},
        	serie : {
        		selector: "#id_serie",
        		validators : {
        			notEmpty: {
                        message: 'El serie es requerido'
                    },
                    regexp: {
                        regexp: /^[A-Z]{3}\d{7}$/,
                        message: 'La serie tiene 10 caracteres'
                    },
        		}
        	},
        	tema : {
        		selector: "#id_tema",
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
        	categoria : {
        		selector: "#id_categoria",
        		validators : {
        			notEmpty: {
                        message: 'La categoria es requerido'
                    },
        		}
        	},
        }
  
    });

});
</script>


<script type="text/javascript">
	$("#id_registrar").click(function(){
		var validator = $('#id_form').data('bootstrapValidator');
	    validator.validate();
		
	    if (validator.isValid()) {
	        $.ajax({
	          type: "POST",
	          url: "registrarLibro", 
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

	$.getJSON("cargaCategoria", {}, function (data){
		$.each(data, function(index, item){
			$("#id_categoria").append("<option value=" +  item.idCategoria +" >" +  item.descripcion + "</option>");
		});	
	});		

	
	function limpiarFormulario(){	
		$('#id_titulo').val('');
		$('#id_anio').val('');
		$('#id_serie').val('');
		$('#id_tema').val(' ');
		$('#id_categoria').val(' ');
	}
</script>

</html>
