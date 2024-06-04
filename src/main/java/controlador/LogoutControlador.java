package controlador;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/logout")
public class LogoutControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Se obtiene la session
		HttpSession session = request.getSession();
		
		//Se destruye la sesion
		session.invalidate();
		
		//elimina los elementos del cache del browser
		response.setHeader("Cache-control", "no-cache");
		response.setHeader("Expires", "0");
		response.setHeader("Pragma", "no-cache");

		//se envia un mensaje al login.jsp
		String mensaje = "El usuario salió de sesión";
		request.setAttribute("mensaje", mensaje);
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

}




