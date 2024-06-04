package controlador;


import com.google.gson.Gson;
import dao.SalaDAO;
import entity.Sala;
import fabricas.Fabrica;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/consultaSala")
public class ConsultaSalaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       String cnum = req.getParameter("numero");
       String cpis = req.getParameter("piso");
       String crec= req.getParameter("recursos");
       String cest = req.getParameter("estado");
       String cids = req.getParameter("sede");

        Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
        SalaDAO daoSala = subFabrica.getSalaDAO();

        int sede = -1; // Valor predeterminado en caso de que pai sea nulo o no se pueda convertir a entero
        int estado = 0; // Valor predeterminado en caso de que est sea nulo o no se pueda convertir a entero
        int npiso = -1;

        if (cids != null && !cids.isEmpty()) {
            sede = Integer.parseInt(cids);
        }

        if (cest != null && !cest.isEmpty()) {
            estado = Integer.parseInt(cest);
        }
        if (cpis != null && !cpis.isEmpty()) {
            npiso = Integer.parseInt(cpis);
        }

        List<Sala> lstSalida = daoSala.listaSalaCompleja("%"+cnum+"%", npiso ,"%"+crec+"%",estado ,sede);



        //2 Se convierte a JSON
        Gson gson = new Gson();
        String json = gson.toJson(lstSalida);

        //3 se envía al json al browser
        resp.setContentType("application/json;charset=UTF-8");

        PrintWriter out = resp.getWriter();
        out.println(json);
    }
}
