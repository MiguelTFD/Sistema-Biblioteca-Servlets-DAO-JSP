
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
<h4>Consulta Sala</h4>

    <div class="row" style="margin-top: 5%">
        <div class="col-md-4">
            <label class="control-label" for="id_numero">Numero</label>
        </div>
        <div class="col-md-5">
            <input	class="form-control" type="text" id="id_numero" placeholder="Ingrese el Numero">
        </div>
    </div>

    <div class="row" style="margin-top: 1%">
        <div class="col-md-4">
            <label class="control-label" for="id_piso">Piso</label>
        </div>
        <div class="col-md-5">
            <input	class="form-control" type="text" id="id_piso"  placeholder="Ingrese el piso">
        </div>
    </div>


    <div class="row" style="margin-top: 1%">
        <div class="col-md-4">
            <label class="control-label" for="id_recurso">Recurso</label>
        </div>
        <div class="col-md-5">
            <input	class="form-control" type="text" id="id_recurso" placeholder="Ingrese el Recurso">
        </div>
    </div>


    <div class="row" style="margin-top: 1%">
        <div class="col-md-4">
            <label class="control-label" for="id_sede">Modalidad</label>
        </div>
        <div class="col-md-5">
            <select	class="form-control" id="id_sede">
                <option value="-1">[Todos]</option>
            </select>
        </div>
    </div>
    <div class="row" style="margin-top: 1%">
        <div class="col-md-4">
            <label class="control-label" for="id_estado">Estado</label>
        </div>
        <div class="col-md-5">
            <input type="checkbox" class="custom-control-input" id="id_estado" checked="checked" />
        </div>
        <div class="col-md-2">
            <button type="button" class="btn btn-primary" id="id_filtro">Filtro</button>
        </div>
    </div>

    <div class="row" style="margin-top: 4%">
        <table id="id_table" class="table table-bordered table-hover table-condensed">
            <thead style='background-color:#233d58; color:white'>
            <tr>
                <th>Codigo</th>
                <th>Numero</th>
                <th>Piso</th>
                <th>Alumnos</th>
                <th>Recurso</th>
                <th>Fecha registro</th>
                <th>Estado</th>
                <th>Fecha actualizacion</th>
                <th>Sede</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>



</div>

<script type="text/javascript">

    $.getJSON("cargaSede", {}, function (data){
        $.each(data, function(index, item){
            $("#id_sede").append("<option value=" +  item.idSede +" >" +  item.nombre + "</option>");
        });
    });

    $("#id_filtro").click(function () {
        let vnum = $("#id_numero").val();
        let vpis = $("#id_piso").val();
        let vrec = $("#id_recurso").val();
        let vsed = $("#id_sede").val();
        let vest = $("#id_estado").is(":checked") ? 1 : 0;


        $.getJSON("consultaSala", {"numero":vnum,"piso":vpis,"recursos": vrec, "estado": vest, "sede": vsed }, function(data) {
            console.log(data);
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
                    {data: "sede.nombre", className:'text-center'}
                ]
            });
    }

</script>

</body>
</html>



