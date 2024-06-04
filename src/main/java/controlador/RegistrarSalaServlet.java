package controlador;

import com.google.gson.Gson;
import dao.SalaDAO;
import entity.Respuesta;
import entity.Sala;
import entity.Sede;
import fabricas.Fabrica;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;

@WebServlet("/registraSala")
public class RegistrarSalaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String num = req.getParameter("numero");
        int pis = Integer.parseInt(req.getParameter("piso"));
        int nal = Integer.parseInt(req.getParameter("nalumnos"));
        String rec = req.getParameter("recursos");
        String prevEst= req.getParameter("estado");
        int est;

        if (prevEst == null) {
            est = 0;
        } else if ("1".equals(prevEst)) {
            est = 1;
        } else {
            est = 0; // Otra acción por defecto en caso de un valor inesperado
        }


        String sed = req.getParameter("sede");

        //Special parameter
        String ltr = req.getParameter("letra");

        //Sala

        Sala objSala = new Sala();
        objSala.setNumero(ltr+ String.format("%03d", Integer.parseInt(num))); //agregado para subir numero sala A001, A002, A00....
        objSala.setPiso(pis);
        objSala.setNumAlumnos(nal);
        objSala.setRecursos(rec);
        objSala.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
        objSala.setEstado(est);
        objSala.setFechaActualizacion(new Date(System.currentTimeMillis()));
        //sede
        Sede objSede = new Sede();

        objSede.setIdSede(Integer.parseInt(sed));
        objSala.setSede(objSede);

        //fabrica
        Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
        SalaDAO daoSala = subFabrica.getSalaDAO();

        int salida = daoSala.insertarSala(objSala);

        Respuesta objRespuesta = new Respuesta();

        if (salida > 0) {
            objRespuesta.setMensaje("Sala registrado exitosamente");
            System.out.printf("salida consolsa");
        }else {
            objRespuesta.setMensaje("Error al registrar sala");
            System.out.printf("Error salida");
        }

        Gson gson = new Gson();
        String json = gson.toJson(objRespuesta);

        //enviar json al bowser
        resp.setContentType("application/json;charset=UTF-8");

        PrintWriter out = resp.getWriter();
        out.print(json);


    }
}
