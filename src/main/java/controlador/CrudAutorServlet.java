package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import com.google.gson.Gson;

import dao.AutorDAO;
import entity.Grado;
import entity.Respuesta;
import entity.Autor;
import fabricas.Fabrica;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/crudAutor")
public class CrudAutorServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String metodo = req.getParameter("metodo");	
		switch (metodo) {
			case "paramLista": 		{ lista(req, resp); break;}
			case "paramInserta": 	{ inserta(req, resp); break;}
			case "paramActualiza": 	{ actualiza(req, resp); break;}
			case "paramELogica": 	{ elogica(req, resp); break;}
			case "paramEFisica": 	{ efisica(req, resp);}
		}
	}

	protected void lista(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("[ini] lista");
		String filtro = req.getParameter("filtro");
		
		Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AutorDAO daoAutor = subFabrica.getAutorDAO();
		
		List<Autor> lstSalida = daoAutor.listaPorNombre("%" + filtro + "%");
		
		Gson gson = new Gson();
		String json = gson.toJson(lstSalida);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);

		System.out.println("[fin] lista");
	}
	
	protected void inserta(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("[ini] inserta");
		
		Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AutorDAO daoAutor = subFabrica.getAutorDAO();

		String vnombre = req.getParameter("nombre");
		String vapellido = req.getParameter("apellido");
		String vfechaNacimiento = req.getParameter("fechaNacimiento");
		String vtelefono = req.getParameter("telefono");
		String vgrado = req.getParameter("grado");
		
		Grado objGrado = new Grado();
		objGrado.setIdGrado(Integer.parseInt(vgrado));
;
		Autor objAutor = new Autor();
		objAutor.setNombres(vnombre);
		objAutor.setApellidos(vapellido);
		objAutor.setEstado(1);
		objAutor.setFechaNacimiento(Date.valueOf(vfechaNacimiento));
		objAutor.setTelefono(vtelefono);
		objAutor.setGrado(objGrado);
		objAutor.setFechaRegistro(new Date(System.currentTimeMillis()));
		objAutor.setFechaActualizacion(new Date(System.currentTimeMillis()));
		
		Respuesta objResupeta = new Respuesta();
		int salida =daoAutor.insertaAutor(objAutor);
		if (salida>0) {
			List<Autor>  lstDatos = daoAutor.listaPorNombre("%");
			objResupeta.setDatos(lstDatos);
			objResupeta.setMensaje("Registro existoso");
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(objResupeta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
		
		System.out.println("[fin] inserta");
	}
	protected void actualiza(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("[ini] actualiza");
		
		Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AutorDAO daoAutor = subFabrica.getAutorDAO();

		String vidAutor = req.getParameter("idAutor");
		String vnombre = req.getParameter("nombre");
		String vapellido = req.getParameter("apellido");
		String vfechaNacimiento = req.getParameter("fechaNacimiento");
		String vtelefono = req.getParameter("telefono");
		String vgrado = req.getParameter("grado");
		String vestado = req.getParameter("estado");
		
		Grado objGrado = new Grado();
		objGrado.setIdGrado(Integer.parseInt(vgrado));

		Autor objAutor = new Autor();
		objAutor.setIdAutor(Integer.parseInt(vidAutor));
		objAutor.setNombres(vnombre);
		objAutor.setApellidos(vapellido);
		objAutor.setEstado(Integer.parseInt(vestado));
		objAutor.setFechaNacimiento(Date.valueOf(vfechaNacimiento));
		objAutor.setTelefono(vtelefono);
		objAutor.setGrado(objGrado);
		
		Respuesta objResupeta = new Respuesta();
		int salida =daoAutor.actualizaAutor(objAutor);
		if (salida>0) {
			List<Autor>  lstDatos = daoAutor.listaPorNombre("%");
			objResupeta.setDatos(lstDatos);
			objResupeta.setMensaje("Actualización existoso");
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(objResupeta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
		
		System.out.println("[fin] actualiza");
	}
	protected void elogica(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("[ini] elogica");
		
		Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AutorDAO daoAutor = subFabrica.getAutorDAO();
		
		String idAutor = req.getParameter("idAutor");
		Autor objAutor = daoAutor.buscaAutor(Integer.parseInt(idAutor));
		int estadoNuevo = objAutor.getEstado() == 0 ? 1 : 0;
		objAutor.setEstado(estadoNuevo);
		daoAutor.actualizaAutor(objAutor);
		
		Respuesta objResupeta = new Respuesta();
		List<Autor>  lstDatos = daoAutor.listaPorNombre("%");
		objResupeta.setDatos(lstDatos);
		
		Gson gson = new Gson();
		String json = gson.toJson(objResupeta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
		
		System.out.println("[fin] elogica");
	}
	
	protected void efisica(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("[ini] efisica");
		
		Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AutorDAO daoAutor = subFabrica.getAutorDAO();
		
		String idAutor = req.getParameter("idAutor");
		
		Respuesta objResupeta = new Respuesta();
		int salida =daoAutor.eliminaAutor(Integer.parseInt(idAutor));
		if (salida>0) {
			List<Autor>  lstDatos = daoAutor.listaPorNombre("%");
			objResupeta.setDatos(lstDatos);
			objResupeta.setMensaje("Eliminaci\u00f3n existosa");
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(objResupeta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
		
		System.out.println("[fin] efisica");
	}

}