package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import com.google.gson.Gson;

import dao.EditorialDAO;
import entity.Editorial;
import entity.Pais;
import entity.Respuesta;
import fabricas.Fabrica;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/registraEditorial")
public class RegistraEditorialControlador extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String rasoSo = req.getParameter("razonSocial");
		String direc = req.getParameter("direccion");
		String telf = req.getParameter("telefono");
		String fechCre = req.getParameter("fechaCreacion");
		String ruc = req.getParameter("ruc");
		String pais = req.getParameter("pais");
		
		Editorial objEditorial = new Editorial();
		objEditorial.setRazonSocial(rasoSo);
		objEditorial.setDireccion(direc);
		objEditorial.setTelefono(Integer.parseInt(telf));
		objEditorial.setFechaCreacion(Date.valueOf(fechCre));
		objEditorial.setRuc(ruc);
		objEditorial.setEstado(1);
		objEditorial.setFechaRegistro(new Date(System.currentTimeMillis()));
		objEditorial.setFechaActualizacion(new Date(System.currentTimeMillis()));

		
		Pais objPais = new Pais();
		objPais.setIdPais(Integer.parseInt(pais));
		objEditorial.setPais(objPais);
		
		Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		EditorialDAO daoEditorial = subFabrica.getEditorialDAO();
		
		int salida = daoEditorial.insetaEditorial(objEditorial);
		
		Respuesta objRespuesta = new Respuesta();
		
		if (salida > 0) {
			objRespuesta.setMensaje("Registro exitoso");
		}else {
			objRespuesta.setMensaje("Error en el registro");
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		
		resp.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println(json);
	}
}
