package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import java.util.List;

import com.google.gson.Gson;

import dao.LibroDAO;
import entity.Categoria;
import entity.Libro;
import entity.Respuesta;
import fabricas.Fabrica;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/crudLibro")
public class CrudLibroServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String metodo = req.getParameter("metodo");
		switch (metodo) {
		case "paramLista": {lista (req, resp); break;}
		case "paramInserta": {inserta (req, resp); break;}
		case "paramActualiza": {actualiza (req, resp); break;}
		case "paramELogica": {elogica (req, resp); break;}
		case "paramEFisica": {efisica (req, resp);}
		}
	}

	private void lista(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("[ini] lista");
		
		String filtro  = req.getParameter("filtro");
		
		Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		LibroDAO daoLibro = subFabrica.getLibroDAO();
		
		List<Libro> lstSalida = daoLibro.listaPorTitulo("%" + filtro + "%");
		
		Gson gson = new Gson();
		String json = gson.toJson(lstSalida);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
		System.out.println("[fin] lista");
	}
	
	private void inserta(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("[ini] inserta");
		
		Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		LibroDAO daoLibro = subFabrica.getLibroDAO();
		
		String vtit = req.getParameter("titulo");
		String vani = req.getParameter("anio");
		String vser = req.getParameter("serie");
		String vtem = req.getParameter("tema");
		String vcat = req.getParameter("categoria");
		
		Categoria objCategoria = new Categoria();
		objCategoria.setIdCategoria(Integer.parseInt(vcat));
		
		Libro objLibro = new Libro();
		
		objLibro.setTitulo(vtit);
		objLibro.setAnio(Integer.parseInt(vani));
		objLibro.setSerie(vser);
		objLibro.setTema(vtem);
		objLibro.setFechaRegistro(new Date(System.currentTimeMillis()));
		objLibro.setFechaActualizacion(new Date(System.currentTimeMillis()));
		objLibro.setEstado(1);
		objLibro.setCategoria(objCategoria);
		
		Respuesta objRespuesta = new Respuesta();
		int salida = daoLibro.insertarLibro(objLibro);
		if (salida>0) {
			List<Libro> lstDatos = daoLibro.listaPorTitulo("%");
			objRespuesta.setDatos(lstDatos);
			objRespuesta.setMensaje("Registro Exitoso");
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
		
		System.out.println("[fin] inserta");
		
	}
	
	private void actualiza(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("[ini] actualiza");
		
		Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		LibroDAO daoLibro = subFabrica.getLibroDAO();

		String vidl = req.getParameter("idLibro");
		String vtit = req.getParameter("titulo");
		String vani = req.getParameter("anio");
		String vser = req.getParameter("serie");
		String vtem = req.getParameter("tema");
		String vcat = req.getParameter("categoria");
		String vest = req.getParameter("estado");
		
		Categoria objCategoria = new Categoria();
		objCategoria.setIdCategoria(Integer.parseInt(vcat));
		
		Libro objLibro = new Libro();
		objLibro.setIdLibro(Integer.parseInt(vidl));
		objLibro.setTitulo(vtit);
		objLibro.setAnio(Integer.parseInt(vani));
		objLibro.setSerie(vser);
		objLibro.setTema(vtem);
		objLibro.setFechaRegistro(new Date(System.currentTimeMillis()));
		objLibro.setFechaActualizacion(new Date(System.currentTimeMillis()));
		objLibro.setCategoria(objCategoria);
		objLibro.setEstado(Integer.parseInt(vest));
		
		Respuesta objResupeta = new Respuesta();
		int salida = daoLibro.actualizaLibro(objLibro);
		if (salida>0) {
			List<Libro>  lstDatos = daoLibro.listaPorTitulo("%");
			objResupeta.setDatos(lstDatos);
			objResupeta.setMensaje("Actualizaci\u00f3n existoso");
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(objResupeta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
		
		System.out.println("[fin] actualiza");
	}
	
	private void elogica(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("[ini] elogica");
		
		Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		LibroDAO daoLibro = subFabrica.getLibroDAO();
		
		String idLibro = req.getParameter("idLibro");
		Libro objLibro = daoLibro.buscaLibro(Integer.parseInt(idLibro));
		int estadoNuevo = objLibro.getEstado() == 0 ? 1 : 0;
		objLibro.setEstado(estadoNuevo);
		daoLibro.actualizaLibro(objLibro);
		
		Respuesta objResupeta = new Respuesta();
		List<Libro>  lstDatos = daoLibro.listaPorTitulo("%");
		objResupeta.setDatos(lstDatos);
		
		Gson gson = new Gson();
		String json = gson.toJson(objResupeta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
		
		System.out.println("[fin] elogica");
		
	}
	
	private void efisica(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		System.out.println("[ini] efisica");
		
		Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		LibroDAO daoLibro = subFabrica.getLibroDAO();
		
		String idLibro = req.getParameter("idLibro");
		
		Respuesta objResupeta = new Respuesta();
		int salida =daoLibro.eliminaLibro(Integer.parseInt(idLibro));
		if (salida>0) {
			List<Libro>  lstDatos = daoLibro.listaPorTitulo("%");
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
