
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
	<h4>Consulta Autor</h4>
	
		<div class="row" style="margin-top: 5%">
			<div class="col-md-4">
				<label class="control-label" for="id_nombre">Nombre</label> 
			</div>	
			<div class="col-md-5">
				<input	class="form-control" type="text" id="id_nombre" placeholder="Ingrese el Nombre">
			</div>
		</div>
		
		<div class="row" style="margin-top: 1%">
			<div class="col-md-4">
				<label class="control-label" for="id_apellido">Apellido</label> 
			</div>	
			<div class="col-md-5">
				<input	class="form-control" type="text" id="id_apellido" placeholder="Ingrese el Apellido">
			</div>
		</div>
		
		<div class="row" style="margin-top: 1%">
			<div class="col-md-4">
				<label class="control-label" for="id_telefono">Teléfono</label> 
			</div>	
			<div class="col-md-5">
				<input	class="form-control" type="text" id="id_telefono" placeholder="Ingrese el Teléfono">
			</div>
		</div>
		
		<div class="row" style="margin-top: 1%">
				<div class="col-md-4">
					<label class="control-label" for="id_grado">Grado</label>
				</div>
				<div class="col-md-5">
					<select	class="form-control" id="id_grado">
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
					<button type="button" class="btn btn-primary" id="id_btn_filtro">Filtro</button>
				</div>
		
		</div>
		
		 <div class="row" style="margin-top: 4%">
            <table id="id_table" class="table table-bordered table-hover table-condensed">
                <thead style='background-color:#233d58; color:white'>
                    <tr>
                        <th>Código</th>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>Fecha Nacimiento</th>
                        <th>Fecha Actualización</th>
                        <th>Teléfono</th>
                        <th>Fecha Registro</th>
                        <th>Estado</th>
                        <th>Grado</th>
                    </tr>
                </thead>
                <tbody>
                
                
                </tbody>
            </table>
        </div>
</div>

<script type="text/javascript">

$.getJSON("cargaGrado", {}, function (data){
	$.each(data, function(index, item){
		$("#id_grado").append("<option value=" +  item.idGrado +" >" +  item.descripcion + "</option>");
	});	
});		

$("#id_btn_filtro").click(function () {
	var vnom = $("#id_nombre").val();
	var vfre = $("#id_apellido").val();
	var vtel = $("#id_telefono").val();
	var vgrad = $("#id_grado").val();
	var vest = $("#id_estado").is(":checked") ?  1 : 0;
	
	$.getJSON("consultaAutor", {"nombre":vnom,"apellido":vfre,"telefono":vtel,"grado": vgrad, "estado": vest}, function(data) {
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
	          ]
	    });
}


</script>

</body>
</html>





