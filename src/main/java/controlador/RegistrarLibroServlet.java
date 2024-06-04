package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

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

@WebServlet("/registrarLibro")
public class RegistrarLibroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String tit = req.getParameter("titulo");
		String ani = req.getParameter("anio");
		String ser = req.getParameter("serie");
		String tem = req.getParameter("tema");
		String cat = req.getParameter("categoria");

		Categoria objCategoria = new Categoria();
		objCategoria.setIdCategoria(Integer.parseInt(cat));

		Libro objLibro = new Libro();
		objLibro.setTitulo(tit);
		objLibro.setAnio(Integer.parseInt(ani));
		objLibro.setSerie(ser);
		objLibro.setTema(tem);
		objLibro.setFechaRegistro(new Date(System.currentTimeMillis()));
		objLibro.setFechaActualizacion(new Date(System.currentTimeMillis()));
		objLibro.setEstado(1);
		objLibro.setCategoria(objCategoria);

		Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		LibroDAO daoLibro = subFabrica.getLibroDAO();

		int insertados = daoLibro.insertarLibro(objLibro);

		Respuesta objRespuesta = new Respuesta();

		if (insertados > 0) {
			objRespuesta.setMensaje("Registro exitoso");
		} else {
			objRespuesta.setMensaje("Error en el registro");
		}

		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);

		resp.setContentType("application/json;charset=UTF-8");

		PrintWriter out = resp.getWriter();
		out.println(json);
	}

}
