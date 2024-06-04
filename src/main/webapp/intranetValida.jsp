<!-- Importar las librerías de etiquetas JSTL -->


<%
	if ( session.getAttribute("objUsuario") == null){
		request.setAttribute("mensaje", "Debe autenticarse para ingresar al sistema");
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}
%>

