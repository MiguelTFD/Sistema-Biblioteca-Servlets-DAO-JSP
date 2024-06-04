package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;

import dao.AutorDAO;
import entity.Autor;
import fabricas.Fabrica;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/consultaAutor")
public class ConsultaAutorServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String nom = req.getParameter("nombre");
		String ape = req.getParameter("apellido");
		String tel = req.getParameter("telefono");
		String gra = req.getParameter("grado");
		String est = req.getParameter("estado");
		
		Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AutorDAO daoAutor = subFabrica.getAutorDAO();
		
		List<Autor> lstSalida = daoAutor.listaAutorCompleja("%"+nom+"%", "%"+ape+"%", "%"+tel+"%", Integer.parseInt(gra), Integer.parseInt(est));
		
		//2 Se convierte a JSON
		Gson gson = new Gson();
		String json = gson.toJson(lstSalida);

		//3 se envía al json al browser
		resp.setContentType("application/json;charset=UTF-8");

		PrintWriter out = resp.getWriter();
		out.println(json);
		
		
	}
}