package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;

import dao.PaisDAO;

import entity.Pais;
import fabricas.Fabrica;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cargaPais")
public class CargaComboPaisServlet extends HttpServlet{

	
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		PaisDAO daoPais = subFabrica.getPaisDAO();
		List<Pais> lista = daoPais.lista();
		
		//2 Se convierte a JSON
		Gson gson = new Gson();
		String json = gson.toJson(lista);

		//3 se envía al json al browser
		resp.setContentType("application/json;charset=UTF-8");

		PrintWriter out = resp.getWriter();
		out.println(json);
	}
}
