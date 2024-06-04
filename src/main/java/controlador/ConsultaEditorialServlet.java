package controlador;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;

import dao.EditorialDAO;
import entity.Editorial;
import fabricas.Fabrica;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/consultaEditorial")
public class ConsultaEditorialServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String raz = req.getParameter("rasonSocial");
		String direc = req.getParameter("direccion");
		String pais = req.getParameter("idPais");
		String est = req.getParameter("estado");
		String ruc = req.getParameter("ruc");
		
		Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		EditorialDAO daoEditorial = subFabrica.getEditorialDAO();
		
		List<Editorial> lstSalida = daoEditorial.listaEditorialCompleja("%"+raz+"%", "%"+direc+"%", Integer.parseInt(pais), Integer.parseInt(est), "%"+ruc+"%");
		
		System.out.print(lstSalida);
		
		Gson gson = new Gson();
		String json = gson.toJson(lstSalida);
		
		resp.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println(json);
	}
}
