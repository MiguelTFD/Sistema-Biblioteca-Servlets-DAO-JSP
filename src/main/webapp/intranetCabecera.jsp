
<%@page import="entity.Opcion"%>
<%@page import="java.util.ArrayList"%>
<div class="container">
 <div class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    
    <div class="collapse navbar-collapse">
    <ul class="nav navbar-nav navbar-left">
       	<li><a href="intranetHome.jsp">Home</a></li>
    </ul>
    <ul class="nav navbar-nav">
    	<li class="dropdown">
	        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	          Registro (PC01)<b class="caret"></b>
	        </a>
	        <ul class="dropdown-menu">
	        	<%
	        		ArrayList<Opcion>	lista= (ArrayList<Opcion>)	session.getAttribute("objMenus");
	        		if(lista != null){
	        		for(Opcion opc : lista){
	        			if (opc.getTipo()== 1){
	        	%>	
	        		<li>
	        			<a href="<%=  opc.getRuta() %>">
	        				<%=  opc.getNombre() %>
	        			</a>
	        		</li>
	        	<%		
	        		}}}
	        	
	        	%>
	        </ul>
     	</li>
     </ul>
    <ul class="nav navbar-nav">
    	<li class="dropdown">
	        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	          CRUD(PC02)<b class="caret"></b>
	        </a>
	        <ul class="dropdown-menu">
	        	<%
	        		ArrayList<Opcion>	lista2= (ArrayList<Opcion>)	session.getAttribute("objMenus");
	        	if(lista != null){
	        		for(Opcion opc : lista2){
	        			if (opc.getTipo()== 2){
	        	%>	
	        		<li>
	        			<a href="<%=  opc.getRuta() %>">
	        				<%=  opc.getNombre() %>
	        			</a>
	        		</li>
	        	<%		
	        		}}}
	        	
	        	%>
	        </ul>
     	</li>
     </ul>
     <ul class="nav navbar-nav">
    	<li class="dropdown">
	        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	          Consultas(PC03)<b class="caret"></b>
	        </a>
	        <ul class="dropdown-menu">
	        		        	<%
	        		ArrayList<Opcion>	lista3= (ArrayList<Opcion>)	session.getAttribute("objMenus");
	        	if(lista != null){
	        		for(Opcion opc : lista3){
	        			if (opc.getTipo()== 3){
	        	%>	
	        		<li>
	        			<a href="<%=  opc.getRuta() %>">
	        				<%=  opc.getNombre() %>
	        			</a>
	        		</li>
	        	<%		
	        		}}}
	        	
	        	%>
	        </ul>
     	</li>
     </ul>
      <ul class="nav navbar-nav">
    	<li class="dropdown">
	        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	          Transacciones(PC03)<b class="caret"></b>
	        </a>
	        <ul class="dropdown-menu">
	        		        	<%
	        		ArrayList<Opcion>	lista4= (ArrayList<Opcion>)	session.getAttribute("objMenus");
	        	if(lista != null){
	        		for(Opcion opc : lista4){
	        			if (opc.getTipo()== 4){
	        	%>	
	        		<li>
	        			<a href="<%=  opc.getRuta() %>">
	        				<%=  opc.getNombre() %>
	        			</a>
	        		</li>
	        	<%		
	        		}}}
	        	
	        	%>
	        </ul>
     	</li>
     </ul>    
      
     <ul class="nav navbar-nav navbar-right">
       	<li><a href="logout">Salir</a></li>
     </ul>
      
    </div>
  </div>
</div>  
</div>