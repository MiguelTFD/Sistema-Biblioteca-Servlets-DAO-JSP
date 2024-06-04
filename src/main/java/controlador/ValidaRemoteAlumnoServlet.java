package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import dao.AlumnoDAO;
import entity.Alumno;
import fabricas.Fabrica;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/validarAlumno")
public class ValidaRemoteAlumnoServlet extends HttpServlet{
	
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nombres = req.getParameter("nombres");
		String apellidos = req.getParameter("apellidos");
		String telefono = req.getParameter("telefono");
		String DNI = req.getParameter("dni");
		
		Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AlumnoDAO daoAlumno = subFabrica.getAlumnoDAO();
		
		List<Alumno> nom = daoAlumno.listaXNombresIguales(nombres);
		List<Alumno> ape = daoAlumno.listaXApellidosIguales(apellidos);
		List<Alumno> tel = daoAlumno.listaXTelefonoIguales(telefono);
		List<Alumno> dni = daoAlumno.listaXDNIIguales(DNI);
		String msg = "";
		if (nom.isEmpty() && ape.isEmpty() && tel.isEmpty() && dni.isEmpty()) {
			msg = "{\"valid\":true}";
		}else {
			msg = "{\"valid\":false}";
		}
		
		resp.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println(msg);
	}

}
