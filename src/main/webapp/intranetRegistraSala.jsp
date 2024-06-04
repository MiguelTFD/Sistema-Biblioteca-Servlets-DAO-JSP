
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
<style>
    .flex-container {
        display: flex;
    }

    .flex-item {
        flex-grow: 1;
        flex-shrink: 1;
        flex-basis: 0;
        padding: 0.5rem;
    }

    .flex-item-shrink {
        flex-grow: 0;
        flex-shrink: 1;
        flex-basis: auto;
        padding: 0.5rem;
    }
</style>

<% String at = "&aacute"; %>
<% String et = "&eacute"; %>
<% String it = "&iacute"; %>
<% String ot = "&oacute"; %>
<% String ut = "&uacute"; %>

<body>

<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
    <h4>Registra Sala</h4>

    <form id="id_form">
        <div class="row">

            <div class="form-group" style="padding: 0 15px 0 15px ">
                <div >
                    <label class="control-label" for="id_aula">aul</label>
                    <input class="form-control" type="text" id="id_aula" name="aula" value="">
                </div>

                <label class="control-label" for="id_numero">Numero de aula</label>

                <div class="form-group flex-container">

                    <div class="flex-item-shrink">
                        <label class="control-label" for="id_letra" hidden="hidden"></label>
                        <select class="form-control " id="id_letra" name="letra">
                            <option value=" ">Letra</option>
                        </select>
                    </div>

                    <div class="flex-item">
                        <input class="form-control " type="text" id="id_numero" name="numero" placeholder="Ingresa el numero de sala">
                    </div>

                </div>

            </div>

            <div class="form-group col-md-6">
                <label class="control-label" for="id_piso">Numero de piso</label>
                <input class="form-control" type="text" id="id_piso" name="piso" placeholder="Ingresa el numero de piso">
            </div>
            <div class="form-group col-md-6">

                <label class="control-label" for="id_nalumnos">Numero de Alumnos</label>
                <input class="form-control" type="text" id="id_nalumnos" name="nalumnos" placeholder="Ingresa el numero de Alumnos">

            </div>
            <div class="form-group col-md-6">

                <label class="control-label" for="id_recursos">Recursos</label>
                <input class="form-control" type="text" id="id_recursos" name="recursos" placeholder="Ingresa el recurso">

            </div>
            <div class="form-group col-md-6">
                <div style="display: inline-block">
                <label class="control-label" for="id_estado">Estado</label>
                <input class="form-control" type="checkbox" id="id_estado" name="estado" onchange="this.value = this.checked ? 1 : 0;">
                </div>
            </div>
        </div>

        <div class="form-group">
            <label for="id_sede" class="control-label" >Sede</label>
            <select class="form-control" id="id_sede" name="sede" >
                <option value=" ">[Seleccione]</option>
            </select>
        </div>
        <div class="row" align="center" style="margin-top: 2%">
            <button type="button" class="btn btn-primary" id="id_btn_registrar">Crea Sala</button>
            <button type="button" class="btn btn-warning" id="id_btn_limpiar" onclick="limpiarFormulario()">Limpiar Formulario</button>
        </div>
<!-- no concatenar, validator no valida datos autogenerados-->

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

                aula:{
                    selector: "#id_aula",
                    validators:{
                        remote:{
                            delay:1000,
                            url: 'validarNumeroExistente',
                            message: 'En Numero de sala ya existe',
                            type:  'POST'
                        }
                    },
                },
                letra: {
                    selector: "#id_letra",
                    validators: {
                        notEmpty: {
                            message: 'Se necesita la letra del aula'
                        }
                    },
                },
                numero: {
                    selector: "#id_numero",
                    validators: {
                        notEmpty: {
                            message: 'El número de sala es requerido'
                        },
                        regexp: {
                            regexp: /^\d{3}$/,
                            message: 'El N&#8203<%=ut%>&#8203mero de Alumnos debe contener solo d&#8203<%=it%>&#8203gitos y deben tener 3 caracteres de longitud'
                        }
                    }
                },

                piso : {
                    selector: "#id_piso",
                    validators : {
                        notEmpty: {
                            message: 'El numero de piso es requerido'
                        },
                        stringLength: {
                            min: 1,
                            max: 30,
                            message: 'El numero de piso debe tener entre 1-30 caracteres'
                        }
                    }
                },
                nalumnos : {
                    selector: "#id_nalumnos",
                    validators : {
                        notEmpty: {
                            message: 'La cantidad de alumnos es requerida'
                        },
                        stringLength: {
                            min: 1,
                            max: 30,
                            message: 'El numero de Alumnos debe ser entre 1-30 caracteres'
                        }
                    }
                },
                recursos:{
                    selector: "#id_recursos",
                    validators:{
                        notEmpty: {
                            message: 'Definir recursos es obligatorio'
                        },
                        stringLength: {
                            min: 3,
                            max: 30,
                            message: 'La longitud de los recursos debe ser entre 1-30 caracteres'
                        }
                    }
                },
                fregistro : {
                    selector: "#id_fregistro",
                    validators : {
                        notEmpty : {
                            message : 'La fecha de registro es requerida'
                        },
                        date : {
                            format : 'YYYY-MM-DD',
                            message : 'Ingrese una fecha v&aacute;ida en formato AAAA-MM-DD'
                        }
                    }
                },
                sede : {
                    selector: "#id_sede",
                    validators : {
                        notEmpty: {
                            message: 'el ID de la Sede es necesaria'
                        },
                    }
                },


            }

        });
        function actualizarAula() {
            var letra = $('#id_letra').val().trim(); // Obtener el valor de letra y quitar espacios en blanco
            var numero = $('#id_numero').val().trim(); // Obtener el valor de numero y quitar espacios en blanco
            $('#id_aula').val(letra + numero);

            // Imprimir el valor de #id_aula en la consola
            var aulaValue = $('#id_aula').val();
            console.log(aulaValue);
        }
        $('#id_letra, #id_numero').on('input', actualizarAula);
    });





    $("#id_btn_registrar").click(function(){
        var validator = $('#id_form').data('bootstrapValidator');
        validator.validate();

        if (validator.isValid()) {
            console.log("ga nomas")
            $.ajax({
                type: "POST",
                url: "registraSala",
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

    $.getJSON("cargaSede", {}, function (data){
        $.each(data, function(index, item){
            console.log("holaaaaaaaaaaaaa")
            $("#id_sede").append("<option value=" +  item.idSede +" >" +  item.nombre + "</option>");
        });
    });

    $(document).ready(function() {
        function cargarLetras(){
            const abc = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","U","V","W","X","Y","Z"];
            abc.forEach((xyz)=>{
                $("#id_letra").append("<option value="+xyz+">"+xyz+"</option>");
            });
        }
        cargarLetras();
    });

    function limpiarFormulario(){
        $('#id_numero').val('');
        $('#id_piso').val('');
        $('#id_nalumnos').val('');
        $('#id_recursos').val('');
        $('#id_fregistro').val('');
        $('#id_estado').val('');
        $('#id_sede').val('');
    }
</script>



</body>
</html>



