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
    <h4>Registra Alumno</h4>

    <div class="container">
        <form action=" "  id="id_form">
            <div class="row" style="margin-top: 5%">
                <!-- Primera columna -->
                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="id_nombres" class="control-label">Nombres</label> <input
                            class="form-control" type="text" id="id_nombres" name="nombres"
                            placeholder="Ingrese el Nombre" maxlength="30">
                    </div>
                    <div class="form-group">
                        <label for="id_apellidos" class="control-label">Apellidos</label> <input
                            class="form-control" type="text" id="id_apellidos" name="apellidos"
                            placeholder="Ingrese los apellidos" maxlength="30">
                    </div>
                    <div class="form-group">
                        <label for="id_telefono" class="control-label">Tel&eacute;fono</label> <input
                            class="form-control" type="text" id="id_telefono" name="telefono"
                            placeholder="Ingrese el tel&eacute;fono" maxlength="9">
                    </div>
                    <div class="form-group">
                        <label for="id_pais" class="control-label">Pa&iacute;s</label>
                        <select class="form-control" id="id_pais" name="pais">
                            <option value="">[Seleccione]</option>
                        </select>
                    </div>
                </div>

                <!-- Segunda columna -->
                <div class="col-sm-6">
                    <div class="form-group">
                        <label for="id_dni" class="control-label">DNI</label> <input
                            class="form-control" type="text" id="id_dni" name="dni"
                            placeholder="Ingrese el DNI" maxlength="8">
                    </div>

                    <div class="form-group">
                        <label for="id_correo" class="control-label">Correo</label> <input
                            class="form-control" type="text" id="id_correo" name="correo"
                            placeholder="Ingrese el correo" maxlength="50">
                    </div>
                    <div class="form-group">
                        <label for="id_fechaNacimiento" class="control-label">Fecha
                            Nacimiento</label> <input class="form-control" type="date"
                                                      id="id_fechaNacimiento" name="fechaNacimiento">
                    </div>

                </div>
            </div>

            <div class="row" style="margin-top: 2%" align="center">
                <button id="id_btn_registrar" type="button" class="btn btn-primary">Crear Alumno</button>
            </div>
        </form>
    </div>
</div>

<script type="text/javascript">
    $(document)
        .ready(
            function() {
                $('#id_form')
                    .bootstrapValidator(
                        {
                            message : 'This value is not valid',
                            feedbackIcons : {
                                valid : 'glyphicon glyphicon-ok',
                                invalid : 'glyphicon glyphicon-remove',
                                validating : 'glyphicon glyphicon-refresh'
                            },
                            fields: {
                                nombres: {
                                    validators: {
                                        notEmpty: {
                                            message: 'Los Nombres son requeridos'
                                        },
                                        regexp: {
                                            regexp: /^[a-zA-Z\s·ÈÌÛ˙¡…Õ”⁄Ò—¸‹}]{3,30}$/,
                                            message: 'Los Nombres tienen de 4 a 40 caracteres'
                          ††††††††††††††},
                          				remote :{
                          				delay   : 1000,
                          				url     : 'validarAlumno',
                          				message : 'El nombre ya existe'
                         				}
                                    }
                                },
                                apellidos: {
                                    validators: {
                                        notEmpty: {
                                            message: 'Los Apellidos son requeridos'
                                        },
                                        regexp: {
                                            regexp: /^[a-zA-Z\s·ÈÌÛ˙¡…Õ”⁄Ò—¸‹}]{3,30}$/,
                                            message: 'Los Apellidos tienen de 4 a 40 caracteres'
                          ††††††††††††††},
                          				remote :{
                          				delay   : 1000,
                          				url     : 'validarAlumno',
                          				message : 'El apellido ya existe'
                         				}
                                    }
                                },
                                telefono:{
                                    selector: "#id_telefono",
                                    validators:{
                                        notEmpty: {
                                            message: 'El tel&eacute;fono es obligatorio'
                                        },
                                        regexp: {
                                            regexp: /^9[0-9]{8}$/,
                                            message: 'El tel&eacute;fono es 9 d&iacute;gitos'
                                        },
                                        remote :{
                              				delay   : 1000,
                              				url     : 'validarAlumno',
                              				message : 'El telefono ya existe'
                             				}
                                    }
                                },
                                dni:{
                                    selector: "#id_dni",
                                    validators:{
                                        notEmpty: {
                                            message: 'El DNI es obligatorio'
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
                                correo: {
                                    validators: {
                                        notEmpty: {
                                            message: 'Debe ingresar un correo v&aacute;lido'
                                        },
                               			 regexp: {
                                			regexp: /^i[0-9]+@cibertec\.edu\.pe$/,
                                    		message: 'El correo debe ser de Cibertec'
                               			 },
                                    }
                                },
                                fechaNacimiento: {
                                    selector : "#id_fechaNacimiento",
                                    validators : {
                                        notEmpty : {
                                            message : 'La fecha de nacimiento es requerida'
                                        },
                                        regexp: {
                                            regexp: /^(?:19\d\d|20(?:0[0-9]|1[0-9]))-(?:0[1-4]|1[0-2])-(?:0[1-9]|[12][0-9]|30)$/,
                                            message: 'La fecha debe ser mayor de edad'
                          ††††††††††††††},
                                    }
                                },
                                pais: {
                                    validators: {
                                        notEmpty: {
                                            message: 'Debe seleccionar un pa&iacute;s'
                                        }
                                    }
                                }
                            }
                        });
            });

    $("#id_btn_registrar").click(function() {
        var validator = $('#id_form').data('bootstrapValidator');
        validator.validate();

        if (validator.isValid()) {
            $.ajax({
                type: "POST",
                url: "registraAlumno",
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

    $.getJSON("cargaPais", {}, function(data) {
        $.each(data, function(index, item) {
            $("#id_pais").append(
                "<option value=" +  item.idPais +" >" + item.nombre + "</option>"
            );
        });
    });

    /*Lizarraga*/
    function limpiarFormulario() {
        $('#id_nombres').val('');
        $('#id_apellidos').val('');
        $('#id_telefono').val('');
        $('#id_dni').val('');
        $('#id_correo').val('');
        $('#id_fechaNacimiento').val('');
        $('#id_pais').val('');
    }
</script>
</body>
</html>