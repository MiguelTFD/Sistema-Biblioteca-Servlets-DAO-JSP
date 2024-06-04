package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import com.google.gson.Gson;

import dao.EditorialDAO;
import entity.Editorial;
import entity.Modalidad;
import entity.Pais;
import entity.Respuesta;
import entity.Revista;
import fabricas.Fabrica;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/crudEditorial")
public class CrudEditorialServlet extends HttpServlet{

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
		EditorialDAO daoEditorial = subFabrica.getEditorialDAO();
		
		List<Editorial> lstSalida = daoEditorial.listaPorNombre("%" + filtro + "%");
		
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
		EditorialDAO daoEditorial = subFabrica.getEditorialDAO();

		String vras = req.getParameter("razonSocial");
		String vdirec = req.getParameter("direccion");
		String vtelef = req.getParameter("telefono");
		String vfechaCreacion = req.getParameter("fechaCreacion");
		String vruc = req.getParameter("ruc");
		String vpai = req.getParameter("pais");
		
		Pais objpais = new Pais();
		objpais.setIdPais(Integer.parseInt(vpai));
;
		Editorial objEditorial = new Editorial();
		objEditorial.setRazonSocial(vras);
		objEditorial.setDireccion(vdirec);
		objEditorial.setTelefono(Integer.parseInt(vtelef));
		objEditorial.setRuc(vruc);
		objEditorial.setEstado(1);
		objEditorial.setFechaRegistro(new Date(System.currentTimeMillis()));
		objEditorial.setFechaCreacion(Date.valueOf(vfechaCreacion));
		objEditorial.setFechaActualizacion(new Date(System.currentTimeMillis()));
		objEditorial.setPais(objpais);
		
		Respuesta objResupeta = new Respuesta();
		int salida =daoEditorial.insetaEditorial(objEditorial);
		if (salida>0) {
			List<Editorial>  lstDatos = daoEditorial.listaPorNombre("%");
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
		EditorialDAO daoEditorial = subFabrica.getEditorialDAO();

		String vidEditora= req.getParameter("idEditorial");
		String vraz = req.getParameter("razonSocial");
		String vdirec = req.getParameter("direccion");
		String vtelef = req.getParameter("telefono");
		String vruc = req.getParameter("ruc");
		String vfechaCreacion = req.getParameter("fechaCreacion");
		String vpai = req.getParameter("pais");
		String vestado = req.getParameter("estado");
		
		Pais objPais = new Pais();
		objPais.setIdPais(Integer.parseInt(vpai));

		Editorial objEditorial = new Editorial();
		objEditorial.setIdEditorial(Integer.parseInt(vidEditora));
		objEditorial.setRazonSocial(vraz);
		objEditorial.setDireccion(vdirec);
		objEditorial.setTelefono(Integer.parseInt(vtelef));
		objEditorial.setRuc(vruc);
		objEditorial.setEstado(Integer.parseInt(vestado));
		objEditorial.setFechaCreacion(Date.valueOf(vfechaCreacion));
		objEditorial.setPais(objPais);
		
		Respuesta objResupeta = new Respuesta();
		int salida =daoEditorial.actualizaEditorial(objEditorial);
		if (salida>0) {
			List<Editorial>  lstDatos = daoEditorial.listaPorNombre("%");
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
	protected void elogica(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("[ini] elogica");
		
		Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		EditorialDAO daoEditorial = subFabrica.getEditorialDAO();
		
		String idEditorial = req.getParameter("idEditorial");
		Editorial objEditorial = daoEditorial.buscaEditorial(Integer.parseInt(idEditorial));
		int estadoNuevo = objEditorial.getEstado() == 0 ? 1 : 0;
		objEditorial.setEstado(estadoNuevo);
		daoEditorial.actualizaEditorial(objEditorial);
		
		Respuesta objResupeta = new Respuesta();
		List<Editorial>  lstDatos = daoEditorial.listaPorNombre("%");
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
		EditorialDAO daoEditorial = subFabrica.getEditorialDAO();
		
		String idEditorial = req.getParameter("idEditorial");
		
		Respuesta objResupeta = new Respuesta();
		int salida =daoEditorial.eliminaEditorial(Integer.parseInt(idEditorial));
		if (salida>0) {
			List<Editorial>  lstDatos = daoEditorial.listaPorNombre("%");
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