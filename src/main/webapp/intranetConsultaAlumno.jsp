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
		<h4>Consulta Alumno</h4>

		<div class="row" style="margin-top: 5%">
			<div class="col-md-4">
				<label class="control-label" for="id_nombres">Nombres</label>
			</div>
			<div class="col-md-5">
				<input class="form-control" type="text" id="id_nombres"
					placeholder="Ingrese los Nombres">
			</div>
		</div>

		<div class="row" style="margin-top: 1%">
			<div class="col-md-4">
				<label class="control-label" for="id_apellidos">Apellidos</label>
			</div>
			<div class="col-md-5">
				<input class="form-control" type="text" id="id_apellidos"
					placeholder="Ingrese los Apellidos">
			</div>
		</div>

		<div class="row" style="margin-top: 1%">
			<div class="col-md-4">
				<label class="control-label" for="id_telefono">Teléfono</label>
			</div>
			<div class="col-md-5">
				<input class="form-control" type="text" id="id_telefono"
					placeholder="Ingrese el Teléfono">
			</div>
		</div>

		<div class="row" style="margin-top: 1%">
			<div class="col-md-4">
				<label class="control-label" for="id_dni">DNI</label>
			</div>
			<div class="col-md-5">
				<input class="form-control" type="text" id="id_dni"
					placeholder="Ingrese el DNI">
			</div>
		</div>


		<div class="row" style="margin-top: 1%">
			<div class="col-md-4">
				<label class="control-label" for="id_Pais">País</label>
			</div>
			<div class="col-md-5">
				<select class="form-control" id="id_Pais">
					<option value="-1">[Todos]</option>
				</select>
			</div>
		</div>
		<div class="row" style="margin-top: 1%">
			<div class="col-md-4">
				<label class="control-label" for="id_estado">Estado</label>
			</div>
			<div class="col-md-5">
				<input type="checkbox" class="custom-control-input" id="id_estado"
					checked="checked" />
			</div>
			<div class="col-md-2">
				<button type="button" class="btn btn-primary" id="id_filtro">Filtro</button>
			</div>

		</div>

		<div class="row" style="margin-top: 4%">
			<table id="id_table"
				class="table table-bordered table-hover table-condensed">
				<thead style='background-color: #233d58; color: white'>
					<tr>
					    <th>Código</th>
						<th>Nombres</th>
						<th>Apellidos</th>
						<th>Teléfonos</th>
						<th>DNI</th>
						<th>Correo</th>
						<th>Fecha de Nacimiento</th>
						<th>Fecha Registro</th>
						<th>Estado</th>
						<th>País</th>
					</tr>
				</thead>
				<tbody>


				</tbody>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">


$.getJSON("cargaPais", {}, function(data) {
    $.each(data, function(index, item) {
        $("#id_Pais").append(
            "<option value=" +  item.idPais +" >" + item.nombre + "</option>"
        );
    });
});


    $("#id_filtro").click(function(){
        var nom = $("#id_nombres").val();
        var ape = $("#id_apellidos").val();
        var tel = $("#id_telefono").val();
        var dni = $("#id_dni").val();
        var pai = $("#id_Pais").val();
        var est = $("#id_estado").is(":checked") ? 1 : 0;

        $.getJSON("consultaAlumno", {"nombres": nom, "apellidos": ape, "telefono": tel, "dni": dni, "pais":pai,  "estado": est}, function(data){
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
            scroller: {
                loadingIndicator: true
            },
            columns:[
                {data: "idAlumno", className:'text-center'},
                {data: "nombres", className:'text-center'},
                {data: "apellidos", className:'text-center'},
                {data: "telefono", className:'text-center'},
                {data: "dni", className:'text-center'},
                {data: "correo", className:'text-center'},
                {data: "fechaNacimiento", className:'text-center'},
                {data: "fechaRegistro", className:'text-center'},
                {data: function(row, type, val, meta){
                    return row.estado == 1 ? "Activo" : "Inactivo";
                }, className:'text-center'},
                {data: "pais.nombre", className:'text-center'},
            ]
        });
    };


</script>
</html>
