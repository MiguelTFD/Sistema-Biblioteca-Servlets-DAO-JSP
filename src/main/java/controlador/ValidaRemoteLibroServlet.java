package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import dao.LibroDAO;
import entity.Libro;
import fabricas.Fabrica;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/validaRemoteLibro")
public class ValidaRemoteLibroServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		////////TITULO////////
		
		String titulo = req.getParameter("titulo");
		
		Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		LibroDAO daoLibro = subFabrica.getLibroDAO();
		
		List<Libro> lstLista = daoLibro.listaPorTituloIgual(titulo);
		String msg = "";
		if (lstLista.isEmpty()) {
			msg = "{\"valid\":true}";
		}else {
			msg = "{\"valid\":false}";
		}
		
		resp.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println(msg);
	}
	
}