package controlador;			

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;

import dao.CategoriaDAO;
import entity.Categoria;
import fabricas.Fabrica;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//Ruiz Bryan

@WebServlet("/cargaCategoria")
public class CargaComboCategoriaServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		CategoriaDAO daoCategoria = subFabrica.getCategoriaDAO();
		List<Categoria> lista = daoCategoria.listaCategorias();

		Gson gson = new Gson();
		String json = gson.toJson(lista);

		resp.setContentType("application/json;charset=UTF-8");

		PrintWriter out = resp.getWriter();
		out.println(json);
	}
}		
