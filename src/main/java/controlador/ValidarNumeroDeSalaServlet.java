package controlador;

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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/validarNumeroExistente")
public class ValidarNumeroDeSalaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     String aula = req.getParameter("aula");
     System.out.println(aula);
     System.out.println("xddddddddddd");

        Fabrica fabric = Fabrica.getFabrica(Fabrica.MYSQL);

        SalaDAO snowflake = fabric.getSalaDAO();

        List<Sala> arSala = snowflake.validacionNumeroSala(aula);

        String notificacion = "";
        //creo que aca valida que el servidor de una respuesta de numero de sala vacia, osea que no existe actualmetne en la bd,creo
        if(arSala.isEmpty()){
            notificacion = "{\"valid\":true}";
        }else{
            notificacion = "{\"valid\":false}";
        }
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter output = resp.getWriter();
        output.println(notificacion);
    }
}
