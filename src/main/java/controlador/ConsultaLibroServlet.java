package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;

import dao.LibroDAO;
import entity.Libro;
import fabricas.Fabrica;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//Ruiz Bryan

@WebServlet("/consultaLibro")
public class ConsultaLibroServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tit = req.getParameter("titulo");
        String ser = req.getParameter("serie");
        String tem = req.getParameter("tema");
        String cat = req.getParameter("categoria");
        String est = req.getParameter("estado");

        Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
        LibroDAO daoLibro = subFabrica.getLibroDAO();

        List<Libro> lstSalida = daoLibro.listaLibroCompleja("%" + tit + "%", "%" + ser + "%","%" + tem + "%", Integer.parseInt(est), Integer.parseInt(cat));

        // Convertir a JSON
        Gson gson = new Gson();
        String json = gson.toJson(lstSalida);

        // Enviar JSON al navegador
        resp.setContentType("application/json;charset=UTF-8");

        PrintWriter out = resp.getWriter();
        out.println(json);
    }
}
