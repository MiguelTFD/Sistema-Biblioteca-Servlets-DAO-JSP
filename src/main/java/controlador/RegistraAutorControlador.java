package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import com.google.gson.Gson;

import dao.AutorDAO;
import entity.Autor;
import entity.Grado;
import entity.Respuesta;
import fabricas.Fabrica;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/registraAutor")
public class RegistraAutorControlador extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		String nom = req.getParameter("nombre");
		String ape = req.getParameter("apellido");
		String fecNac = req.getParameter("fechaNacimiento");
		String tel = req.getParameter("telefono");
		String gra = req.getParameter("grado");

		Autor objAutor = new Autor();
		objAutor.setNombres(nom);
		objAutor.setApellidos(ape);
		objAutor.setFechaNacimiento(Date.valueOf(fecNac));
		objAutor.setFechaActualizacion(new Date(System.currentTimeMillis()));
		objAutor.setTelefono(tel);
		objAutor.setEstado(1);
		objAutor.setFechaRegistro(new Date(System.currentTimeMillis()));
		
		Grado objGrado = new Grado();
		objGrado.setIdGrado(Integer.parseInt(gra));
		
		objAutor.setGrado(objGrado);
		
		Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AutorDAO daoAutor = subFabrica.getAutorDAO();
		
		int salida = daoAutor.insertaAutor(objAutor);
	
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