	
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
<h4>Consulta Libro</h4>

	<div class="row" style="margin-top: 5%">
			<div class="col-md-4">
				<label class="control-label" for="id_titulo">Título</label> 
			</div>	
			<div class="col-md-5">
				<input	class="form-control" type="text" id="id_titulo" placeholder="Ingrese el Título">
			</div>
		</div>
		
		<div class="row" style="margin-top: 1%">
			<div class="col-md-4">
				<label class="control-label" for="id_serie">Serie</label> 
			</div>	
			<div class="col-md-5">
				<input	class="form-control" type="text" id="id_serie" placeholder="Ingrese la Serie">
			</div>
		</div>
		
		<div class="row" style="margin-top: 1%">
			<div class="col-md-4">
				<label class="control-label" for="id_tema">Tema</label> 
			</div>	
			<div class="col-md-5">
				<input	class="form-control" type="text" id="id_tema" placeholder="Ingrese el Tema">
			</div>
		</div>
		
		<div class="row" style="margin-top: 1%">
				<div class="col-md-4">
					<label class="control-label" for="id_Categoria">Categoría</label>
				</div>
				<div class="col-md-5">
					<select	class="form-control" id="id_Categoria">
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
                        <th>Código</th>
                        <th>Título</th>
                        <th>Año</th>	
                        <th>Serie</th>
                        <th>Tema</th>
                        <th>Estado</th>
                        <th>Categoría</th>
                    </tr>
                </thead>
                <tbody>
                
                
                </tbody>
            </table>
        </div>
</div>
</body>

<script type="text/javascript">

//Ruiz Bryan

$.getJSON("cargaCategoria", {}, function (data){
    $.each(data, function(index, item){
        $("#id_Categoria").append("<option value=" +  item.idCategoria +" >" +  item.descripcion + "</option>");
    }); 
});         

$("#id_filtro").click(function(){
    var tit = $("#id_titulo").val();
    var ser = $("#id_serie").val();
    var tem = $("#id_tema").val();
    var cat = $("#id_Categoria").val();
    var est = $("#id_estado").is(":checked") ? 1 : 0;

    $.getJSON("consultaLibro", {"titulo": tit, "serie": ser, "tema": tem, "categoria": cat, "estado": est}, function(data){
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
            {data: "idLibro", className:'text-center'},
            {data: "titulo", className:'text-center'},
            {data: "anio", className:'text-center'},
            {data: "serie", className:'text-center'},
            {data: "tema", className:'text-center'},
            {data: function(row, type, val, meta){
                return row.estado == 1 ? "Activo" : "Inactivo";  
            }, className:'text-center'},
            {data: "categoria.descripcion", className:'text-center'},
          ]
    });
}
</script>
</html>



