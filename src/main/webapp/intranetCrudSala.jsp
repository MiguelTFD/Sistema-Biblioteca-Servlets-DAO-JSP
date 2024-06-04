
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

<body>
<% String at = "&aacute"; %>
<% String et = "&eacute"; %>
<% String it = "&iacute"; %>
<% String ot = "&oacute"; %>
<% String ut = "&uacute"; %>



<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h4>Crud Sala</h4>

    <div class="container">
        <div class="row" style="margin-top: 5%">
            <div class="col-md-3">
                <label class="control-label" for="id_filtro">N<%=ut%>mero de Sala</label>
            </div>
            <div class="col-md-6">
                <input	class="form-control" type="text" id="id_filtro" placeholder="Ingrese el N&#8203<%=ut%>&#8203mero de Sala">
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
                    <th>C<%=ot%>digo</th>
                    <th>N<%=ut%>></th>
                    <th>Piso</th>
                    <th>Alumnos</th>
                    <th>Recurso</th>
                    <th>Fecha registro</th>
                    <th>Estado</th>
                    <th>Fecha actualizaci<%=ot%>n</th>
                    <th>sede</th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>


                </tbody>
            </table>
        </div>

        <!-- APARTADO REGISTRAR-SALA -->
        <div class="modal fade" id="id_div_modal_registra" >
            <div class="modal-dialog" style="width: 60%">
                <div class="modal-content">
                <div class="modal-header" >
                     <button type="button" class="close" data-dismiss="modal">&times;</button>
                     <h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Sala</h4>
                </div>
                    <div class="modal-body" >
                        <div class="panel-group" id="steps">
                            <div class="panel panel-default">
                                <div id="stepOne" class="panel-collapse collapse in">

                                    <form id="id_form_registra">
                                        <input type="hidden" name="metodo" value="crInserta">
                                        <div class="panel-body">

                                            <!--Letra Y Numero de sala-->
                                            <div class="form-group" >
                                                <label class="control-label" for="id_reg_numero">N<%=ut%>mero de aula </label>
                                                <div class="form-group flex-container">

                                                    <div class="flex-item-shrink">
                                                        <label class="control-label" for="id_reg_letra" hidden="hidden"></label>
                                                        <select class="form-control " id="id_reg_letra" name="letra">
                                                            <option value=" ">Letra</option>
                                                        </select>
                                                    </div>
                                                    <div class="flex-item">
                                                        <input class="form-control " type="text" id="id_reg_numero" name="numero" placeholder="Ingresa el N&#8203<%=ut%>&#8203mero de sala">
                                                    </div>
                                                </div>
                                            </div>

                                            <!--Numero de piso-->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label" for="id_reg_piso">N<%=ut%>mero de piso</label>
                                                <div class="col-lg-8">
                                                    <input class="form-control" id="id_reg_piso" name="piso" placeholder="ingresa el N&#8203<%=ut%>&#8203mero de piso" type="text" maxlength="100"/>
                                                </div>
                                            </div>

                                            <!--Cantidad de alumnos-->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label" for="id_reg_nalumnos">Cantidad de Alumnos</label>
                                                <div class="col-lg-8">
                                                    <input class="form-control" id="id_reg_nalumnos" type="text" name="nalumnos"/>
                                                </div>
                                            </div>

                                            <!--Recursos-->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label" for="id_reg_recursos">Recursos</label>
                                                <div class="col-lg-8">
                                                    <input class="form-control" id="id_reg_recursos" type="text" name="recursos"/>
                                                </div>
                                            </div>

                                            <!--Estado
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label" for="id_reg_estado">Estado</label>
                                                <input class="form-control" id="id_reg_estado" type="checkbox" name="estado" onchange="this.value = this.checked ? 1 : 0;"/>
                                            </div>-->

                                            <!--Sedes-->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label" for="id_reg_sede">Sede</label>
                                                <div class="col-lg-8">
                                                    <select class="form-control" id="id_reg_sede" name="sede">
                                                        <option value=" ">[Seleccione]</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <!--Botones-->
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
                                        <input type="hidden" name="metodo" value="crActualiza">
                                        <input type="hidden" name="idSala" id="idSala">
                                        <div class="panel-body">

                                            <!--Letra Y Numero de sala-->
                                            <div class="form-group" >
                                                <label class="control-label" for="id_act_numero">N<%=ut%>mero de aula</label> <label id="frost"> </label>
                                                <div class="form-group flex-container">

                                                    <div class="flex-item-shrink">
                                                        <label class="control-label" for="id_act_letra" hidden="hidden"></label>
                                                        <select class="form-control " id="id_act_letra" name="letra">
                                                            <option value=" ">Letra</option>
                                                        </select>
                                                    </div>
                                                    <div class="flex-item">
                                                        <input class="form-control " type="text" id="id_act_numero" name="numero" placeholder="Ingresa el N&#8203<%=ut%>&#8203mero de sala">
                                                    </div>
                                                </div>
                                            </div>

                                            <!--Numero de piso-->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label" for="id_act_piso">N<%=ut%>mero de piso</label>
                                                <div class="col-lg-8">
                                                    <input class="form-control" id="id_act_piso" name="piso" placeholder="Ingrese el N&#8203<%=ut%>&#8203mero de Piso" type="text" maxlength="100"/>
                                                </div>
                                            </div>

                                            <!--Cantidad de alumnos-->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label" for="id_act_nalumnos">Cantidad de Alumnos</label>
                                                <div class="col-lg-8">
                                                    <input class="form-control" id="id_act_nalumnos" type="text" name="nalumnos"/>
                                                </div>
                                            </div>

                                            <!--Recursos-->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label" for="id_act_recursos">Recursos</label>
                                                <div class="col-lg-8">
                                                    <input class="form-control" id="id_act_recursos" type="text" name="recursos"/>
                                                </div>
                                            </div>
                                            <!--FRegistro-->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label" for="id_act_fechaRegistro">Fecha de Registro</label>
                                                <div class="col-lg-8">
                                                    <input class="form-control" id="id_act_fechaRegistro" type="date" name="fechaRegistro"/>
                                                </div>
                                            </div>


                                            <!--Estado-->
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

                                            <!--FActu-->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label" for="id_act_fechaActualizacion">Fecha de Actualizacion</label>
                                                <div class="col-lg-8">
                                                    <input class="form-control" id="id_act_fechaActualizacion" type="date" name="fechaActualizacion"/>
                                                </div>
                                            </div>

                                            <!--Sedes-->
                                            <div class="form-group">
                                                <label class="col-lg-3 control-label" for="id_act_sede">Sede</label>
                                                <div class="col-lg-8">
                                                    <select class="form-control" id="id_act_sede" name="sede">
                                                        <option value=" ">[Seleccione]</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="col-lg-12" align="center">
                                                    <button type="button" style="width: 80px" id="id_btn_actualiza"  onclick='$("#frost").empty();' class="btn btn-primary btn-sm ">Actualizar</button>
                                                    <button type="button" style="width: 80px" id="id_btn_act_cancelar" class="btn btn-primary btn-sm" data-dismiss="modal" onclick='$("#frost").empty();'>Cancelar</button>
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

        <!--Working ++ -->
        <script type="text/javascript">
            $("#id_btn_filtro").click(function(){
                let vfil = $("#id_filtro").val();

                $.getJSON("crudSala", {"metodo":"crLista", "filtro":vfil},function(data){
                    agregarGrilla(data);
                    console.log(data);
                });

            });

            $(document).ready(function() {
                function cargarLetras(){
                    const abc = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","U","V","W","X","Y","Z"];
                    abc.forEach((xyz)=>{
                        $("#id_reg_letra").append("<option value="+xyz+">"+xyz+"</option>");
                        $("#id_act_letra").append("<option value="+xyz+">"+xyz+"</option>");
                    });
                }
                cargarLetras();
            });

            <!--Working ++ -->
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
                    info: true,
                    scrollY: 305,
                    scroller:{ loadingIndicator: true},
                    columns: [
                        {data: "idSala", className:'text-center'},
                        {data: "numero", className:'text-center'},
                        {data: "piso", className:'text-center'},
                        {data: "numAlumnos", className:'text-center'},
                        {data: "recursos", className:'text-center'},
                        {data: "fechaRegistro", className:'text-center'},
                        {data: function (row, type, val, meta){return row.estado==1? "Activo":"Inactivo"}, className:'text-center'},
                        {data: "fechaActualizacion", className:'text-center'},
                        {data: "sede.nombre", className:'text-center'},
                        {data: function(row, type, val, meta)
                            {
                                return '<button type="button" class="btn btn-info btn-sm" onClick="verFormularioActualiza(\'' + row.idSala + '\',\'' +  row.numero   + '\',\'' +  row.piso   + '\',\'' +  row.numAlumnos   + '\',\'' +  row.recursos   + '\',\'' +  row.fechaRegistro +'\',\'' +  row.estado   + '\',\'' +  row.fechaActualizacion +'\',\'' +  row.sede.idSede +'\');">Editar</button>';
                            },className:'text-center'
                        },
                        {data: function(row, type, val, meta)
                            {
                                return '<button type="button" class="btn btn-warning btn-sm" onClick="eliminacionLogica(\'' + row.idSala +'\');">E.L<%=ot%>gica</button>';
                            },className:'text-center'
                        },
                        {data: function(row, type, val, meta){
                                return '<button type="button" class="btn btn-danger btn-sm"  onClick="eliminacionFisica(\'' + row.idSala +'\') ;">E.F<%=it%>sica</button>';
                            },className:'text-center'},
                    ]
                });
            }

            <!--Working ++ -->
            function verFormularioActualiza(idSala, numero, piso, numAlumnos, recursos, fechaRegistro, estado, fechaActualizacion, sede){
                console.log(">> verFormularioActualiza >> " + idSala);
                $("#id_div_modal_actualiza").modal("show");
                $("#idSala").val(idSala);
                $("#frost").append(numero); //eliminar osea resetar se guarda estos datos
                $("#id_act_piso").val(piso);
                $("#id_act_nalumnos").val(numAlumnos);
                $("#id_act_recursos").val(recursos);
                $("#id_act_fechaRegistro").val(fechaRegistro);
                $("#id_act_estado").val(estado);
                $("#id_act_fechaActualizacion").val(fechaActualizacion);
                $("#id_act_sede").val(sede);
                $("#id_act_numero").val(numero.slice(1));
                $("#id_act_letra").val(numero.charAt(0));
            }

            <!--Working ++ -->
            $.getJSON("cargaSede", {}, function (data){
                $.each(data, function(index, item){
                    $("#id_reg_sede").append("<option value=" +  item.idSede +" >" +  item.nombre + "</option>");
                    $("#id_act_sede").append("<option value=" +  item.idSede +" >" +  item.nombre + "</option>");
                });
            });


            $("#id_btn_registra").click(function() {
                console.log(">>> [ini] >> inserta ");
                console.log($('#id_form_registra').serialize());

                let validator = $('#id_form_registra').data('bootstrapValidator');
                validator.validate();

                if (validator.isValid()) {
                    $.ajax({
                        type: "POST",
                        url: "crudSala",
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

            <!--Working ++ -->
            function eliminacionFisica(idSala){
                let array = [idSala];
                mostrarMensajeConfirmacion(MSG_ELIMINAR, accionEliminacionFisica,null,array);
            }
            <!--Working ++ -->
            function accionEliminacionFisica(array){
                $.ajax({
                    type: "POST",
                    url: "crudSala",
                    data: {"metodo":"crEFisica", "idSala":array[0]},
                    success: function(data){
                        mostrarMensaje(data.mensaje);
                        agregarGrilla(data.datos);
                    },
                    error: function(){
                        mostrarMensaje(MSG_ERROR);
                    }
                });
            }




            <!--Working ++ -->
            $("#id_btn_actualiza").click(function() {
                let validator = $('#id_form_actualiza').data('bootstrapValidator');
                validator.validate();

                if (validator.isValid()) {
                    $.ajax({
                        type: "POST",
                        url: "crudSala",
                        data: $('#id_form_actualiza').serialize(),
                        success: function(data){
                            console.log("accion btn actualiza")
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


            function eliminacionLogica(idSala){
                $.ajax({
                    type: "POST",
                    url: "crudSala",
                    data: {"metodo":"crELogica", "idSala":idSala},
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

                        letra:{
                            selector:"#id_reg_letra",
                            validators:{
                                notEmpty: {
                                    message: 'Debes Seleccionar una Letra de sala'
                                },
                            }
                        },
                        numero : {
                            selector: "#id_reg_numero",
                            validators : {
                                notEmpty: {
                                    message: 'El N&#8203<%=ut%>&#8203mero de sala es requerido'
                                },
                                stringLength: {
                                    min: 1,
                                    max: 3,
                                    message: 'El N&#8203<%=ut%>&#8203mero de Sala debe tener entre 1 y 3 caracteres'
                                },
                                regexp: {
                                    regexp: /^[0-9]+$/,
                                    message: 'El N&#8203<%=ut%>&#8203mero de sala debe contener solo d&#8203<%=it%>&#8203gitos'
                                }
                            }
                        },
                        piso : {
                            selector: "#id_reg_piso",
                            validators : {
                                notEmpty: {
                                    message: 'El N&#8203<%=ut%>&#8203mero de piso es requerido'
                                },
                                stringLength: {
                                    min: 1,
                                    max: 3,
                                    message: 'El N&#8203<%=ut%>&#8203mero de piso debe tener entre 1 y 3 caracteres'
                                },
                                regexp: {
                                    regexp: /^[0-9]+$/,
                                    message: 'El N&#8203<%=ut%>&#8203mero de piso debe contener solo d&#8203<%=it%>&#8203gitos'
                                }
                            }
                        },
                        nalumnos : {
                            selector: "#id_reg_nalumnos",
                            validators : {
                                notEmpty: {
                                    message: 'La cantidad de alumnos es requerida'
                                },

                                stringLength: {
                                    min: 1,
                                    max: 3,
                                    message: 'El N&#8203<%=ut%>&#8203mero de Alumnos debe tener entre 1 y 3 caracteres'
                                },
                                regexp: {
                                    regexp: /^[0-9]+$/,
                                    message: 'El N&#8203<%=ut%>&#8203mero de Alumnos debe contener solo d&#8203<%=it%>&#8203gitos'
                                }
                            }
                        },
                        recursos:{
                            selector: "#id_reg_recursos",
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
                        fechaRegistro : {
                            selector: "#id_reg_fregistro",
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
                            selector: "#id_reg_sede",
                            validators : {
                                notEmpty: {
                                    message: 'el ID de la Sede es necesaria'
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

                        letra:{
                            selector:"#id_reg_letra",
                            validators:{
                                notEmpty: {
                                    message: 'La letra de Sala no puede ser vac&#8203<%=it%>&#8203a'
                                },
                            }
                        },
                        numero : {
                            selector: "#id_act_numero",
                            validators : {
                                notEmpty: {
                                    message: 'El N&#8203<%=ut%>&#8203mero de sala es requerido'
                                },
                                stringLength: {
                                    min: 1,
                                    max: 3,
                                    message: 'El N&#8203<%=ut%>&#8203mero de Sala debe tener entre 1 y 3 caracteres'
                                },
                                regexp: {
                                    regexp: /^[0-9]+$/,
                                    message: 'El N&#8203<%=ut%>&#8203mero de sala debe contener solo d&#8203<%=it%>&#8203gitos'
                                }
                            }
                        },
                        piso : {
                            selector: "#id_act_piso",
                            validators : {
                                notEmpty: {
                                    message: 'El N&#8203<%=ut%>&#8203mero de piso es requerido'
                                },
                                stringLength: {
                                    min: 1,
                                    max: 3,
                                    message: 'El N&#8203<%=ut%>&#8203mero de piso debe tener entre 1 y 3 caracteres'
                                },
                                regexp: {
                                    regexp: /^[0-9]+$/,
                                    message: 'El N&#8203<%=ut%>&#8203mero de piso debe contener solo d&#8203<%=it%>&#8203gitos'
                                }
                            }
                        },
                        nalumnos : {
                            selector: "#id_act_nalumnos",
                            validators : {
                                notEmpty: {
                                    message: 'La cantidad de alumnos es requerida'
                                },

                                stringLength: {
                                    min: 1,
                                    max: 3,
                                    message: 'El N&#8203<%=ut%>&#8203mero de Alumnos debe tener entre 1 y 3 caracteres'
                                },
                                regexp: {
                                    regexp: /^[0-9]+$/,
                                    message: 'El N&#8203<%=ut%>&#8203mero de Alumnos debe contener solo d&#8203<%=it%>&#8203gitos'
                                }
                            }
                        },
                        recursos:{
                            selector: "#id_act_recursos",
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
                        fechaRegistro : {
                            selector: "#id_act_fregistro",
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
                            selector: "#id_act_sede",
                            validators: {
                                notEmpty: {
                                    message: 'el ID de la Sede es necesaria'
                                },
                            }
                        }
                    }
                });
            });



        </script>





   </div>


	
</div>
</body>
</html>



