package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;

import dao.AlumnoDAO;
import entity.Alumno;
import fabricas.Fabrica;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/consultaAlumno")
public class ConsultaAlumnoServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nom = req.getParameter("nombres");
        String ape = req.getParameter("apellidos");
        String tel = req.getParameter("telefono");
        String dni = req.getParameter("dni");
        String pai = req.getParameter("pais");
        String est = req.getParameter("estado");

        int pais = -1; // Valor predeterminado en caso de que pai sea nulo o no se pueda convertir a entero
        int estado = 0; // Valor predeterminado en caso de que est sea nulo o no se pueda convertir a entero

        if (pai != null && !pai.isEmpty()) {
            pais = Integer.parseInt(pai);
        }

        if (est != null && !est.isEmpty()) {
            estado = Integer.parseInt(est);
        }

        Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
        AlumnoDAO daoAlumno = subFabrica.getAlumnoDAO();

        List<Alumno> lstSalida = daoAlumno.listaAlumnocompleja("%" + nom + "%", "%" + ape + "%", "%" + tel + "%", "%" + dni + "%", estado, pais);
        Gson gson = new Gson();

        String json = gson.toJson(lstSalida);

        resp.setContentType("aplication/json;charset=UTF-8");

        PrintWriter out = resp.getWriter();
            out.println(json);


    }


}