package controlador;

import com.google.gson.Gson;
import dao.SedeDAO;
import entity.Sede;
import fabricas.Fabrica;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/cargaSede")
public class CargaComboSedeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
        SedeDAO daoSede = subFabrica.getSedeDAO();
        List<Sede> lista = daoSede.lista();


        //convertir a json
        Gson gson = new Gson();
        String json = gson.toJson(lista);

        //enviar json al bowser
        resp.setContentType("application/json;charset=UTF-8");

        PrintWriter out = resp.getWriter();
        out.print(json);

    }




}
