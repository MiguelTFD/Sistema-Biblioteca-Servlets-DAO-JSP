package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import dao.EditorialDAO;
import dao.RevistaDAO;
import entity.Editorial;
import entity.Revista;
import fabricas.Fabrica;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/validaRemoteEditorialRazonSocial")
public class ValidacionRemotaEditorialRazonSocial extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String variable = req.getParameter("razonSocial");
		
		Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		EditorialDAO daoEditorial = subFabrica.getEditorialDAO();
		
		List<Editorial> lstLista = daoEditorial.listaPorRazonSocialIgual(variable);
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