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
	<h4>Consulta editorial</h4>
	
		<div class="row" style="margin-top: 5%">
			<div class="col-md-4">
				<label class="control-label" for="id_rasonSocial">Razón Social</label> 
			</div>	
			<div class="col-md-5">
				<input	class="form-control" type="text" id="id_rasonSocial" placeholder="Ingrese el Razón Social">
			</div>
		</div>
		
		<div class="row" style="margin-top: 1%">
			<div class="col-md-4">
				<label class="control-label" for="id_direccion">Dirección</label> 
			</div>	
			<div class="col-md-5">
				<input	class="form-control" type="text" id="id_direccion" placeholder="Ingrese la Direección">
			</div>
		</div>
		
		<div class="row" style="margin-top: 1%">
			<div class="col-md-4">
				<label class="control-label" for="id_ruc">RUC</label> 
			</div>	
			<div class="col-md-5">
				<input	class="form-control" type="text" id="id_ruc" placeholder="Ingrese el RUC">
			</div>
		</div>
		
		
		
		<div class="row" style="margin-top: 1%">
				<div class="col-md-4">
					<label class="control-label" for="id_pais">Pais</label>
				</div>
				<div class="col-md-5">
					<select	class="form-control" id="id_pais">
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
                        <th>Razón social</th>
                        <th>Dirección</th>
                        <th>Teléfono</th>
                        <th>Fecha Creación</th>
                        <th>RUC</th>
                        <th>Estado</th>
                        <th>País</th>
                    </tr>
                </thead>
                <tbody>
                
                
                </tbody>
            </table>
        </div>
</div>

<script type="text/javascript">

$.getJSON("cargaPais", {}, function (data){
	console.log(data);
	$.each(data, function(index, item){
		$("#id_pais").append("<option value=" +  item.idPais +" >" +  item.nombre + "</option>");
	});	
});		

$("#id_btn_filtro").click(function () {
	var vras = $("#id_rasonSocial").val();
	var vdirec = $("#id_direccion").val();
	var vpais= $("#id_pais").val();
	var vruc= $("#id_ruc").val();
	var vest = $("#id_estado").is(":checked") ?  1 : 0;
	
	$.getJSON("consultaEditorial", {"rasonSocial":vras,"direccion":vdirec,"idPais": vpais, "estado": vest, "ruc": vruc}, function(data) {
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
				{data: "idEditorial",className:'text-center'},
				{data: "razonSocial",className:'text-center'},
				{data: "direccion",className:'text-center'},
				{data: "telefono",className:'text-center'},
				{data: "fechaCreacion",className:'text-center'},
				{data: "ruc",className:'text-center'},
				{data: function(row, type, val, meta){
					return row.estado == 1 ? "Activo" : "Inactivo";  
				},className:'text-center'},
				{data: "pais.nombre",className:'text-center'},
	          ]
	    });
}


</script>

</body>
</html>
