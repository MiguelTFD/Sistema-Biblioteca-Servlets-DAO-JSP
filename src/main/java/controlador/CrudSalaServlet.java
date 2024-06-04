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
import java.util.List;

@WebServlet("/crudSala")
public class CrudSalaServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String metodo = req.getParameter("metodo");
        switch (metodo){
            case "crLista": {lista(req,resp);break;}
            case "crELogica": {eliLog(req,resp);break;}
            case "crEFisica": {eliFis(req,resp);break;}
            case "crInserta": {inserta(req,resp);break;}
            case "crActualiza": {actualiza(req,resp);}
        }
    }

    protected void lista(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        System.out.println("[ini] lista");
        String filtro = req.getParameter("filtro"); //capturamos el parametro('filtro') de nuestro cliente

        Fabrica subFab = Fabrica.getFabrica(Fabrica.MYSQL);
        SalaDAO daoSala = subFab.getSalaDAO();

        List<Sala> lstSala = daoSala.listaPorNumero("%"+ filtro +"%");

        Gson gson = new Gson();
        String json = gson.toJson(lstSala);
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.println(json);
        System.out.println("[fin] lista");

    }

    protected void eliLog(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        System.out.println("[start] Eliminacion logica");

        Fabrica subFab = Fabrica.getFabrica(Fabrica.MYSQL);
        SalaDAO daoSala = subFab.getSalaDAO();

        String idSala = req.getParameter("idSala");

        Sala objSala = daoSala.buscaSala(Integer.parseInt(idSala));
        int actEst = objSala.getEstado() == 0 ? 1 : 0;
        objSala.setEstado(actEst);
        daoSala.actualizaSala(objSala);

        Respuesta objRespuesta = new Respuesta();
        List<Sala> lstSala = daoSala.listaPorNumero("%");
        objRespuesta.setDatos(lstSala);

        //Gson -> Json
        Gson gson = new Gson();
        String json = gson.toJson(objRespuesta);
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter pw = resp.getWriter();
        pw.println(json);

        System.out.println("[end] Eliminacion logica");


    }

    protected void eliFis(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
        System.out.println("[start] Eliminacion Fisica");

        Fabrica subFab = Fabrica.getFabrica(Fabrica.MYSQL);
        SalaDAO daoSala = subFab.getSalaDAO();
        String idSala = req.getParameter("idSala");
        Respuesta objRespuesta = new Respuesta();
        int out = daoSala.eliminaSala(Integer.parseInt(idSala));
        if(out>0){
            List<Sala> lstSala=daoSala.listaPorNumero("%");
            objRespuesta.setDatos(lstSala);
            objRespuesta.setMensaje("Eliminaci\u00f3n existosa");
        }

        Gson g = new Gson();
        String j = g.toJson(objRespuesta);
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter pw = resp.getWriter();
        pw.println(j);

        System.out.println("[end] Eliminacion Fisica");



    }

    protected void inserta(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
        System.out.println("[ini] inserta");
        String num = req.getParameter("numero");
        int pis = Integer.parseInt(req.getParameter("piso"));
        int nal = Integer.parseInt(req.getParameter("nalumnos"));
        String rec = req.getParameter("recursos");
        String prevEst= req.getParameter("estado");
        String sed = req.getParameter("sede");
        String ltr = req.getParameter("letra");
        int est;
        if (prevEst == null) {
            est = 0;
        } else if ("1".equals(prevEst)) {
            est = 1;
        } else {
            est = 0; // Otra acción por defecto en caso de un valor inesperado
        }
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

            List<Sala> lstSala = daoSala.listaPorNumero("%");
            objRespuesta.setDatos(lstSala);
            objRespuesta.setMensaje("Sala registrado exitosamente");
            System.out.println("salida consolsa");
        }

        Gson gson = new Gson();
        String json = gson.toJson(objRespuesta);
        //enviar json al bowser
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.print(json);

        System.out.println("[fin] Inserta");

    }

    protected void actualiza(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException{
        System.out.println("[ini] actualiza");
        //==========Capturar Datos del cliente========//
        String idSal = req.getParameter("idSala");
        String num = req.getParameter("numero");
        int pis = Integer.parseInt(req.getParameter("piso"));
        int nal = Integer.parseInt(req.getParameter("nalumnos"));
        String rec = req.getParameter("recursos");
        String prevEst= req.getParameter("estado");
        String sed = req.getParameter("sede");
        String ltr = req.getParameter("letra");
        int est;
        if (prevEst == null) {
            est = 0;
        } else if ("1".equals(prevEst)) {
            est = 1;
        } else {
            est = 0; // Otra acción por defecto en caso de un valor inesperado
        }

        //Usamos estos datos para crear 2 objetos relacionados(INNER JOIN salaxsede)
        //Sala
        Sala objSala = new Sala();
        objSala.setIdSala(Integer.parseInt(idSal));
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

        //estado de la implementacion
        int salida = daoSala.actualizaSala(objSala);
        Respuesta objRespuesta = new Respuesta();
        System.out.println("Valor salida"+salida);
        if (salida > 0) {
            List<Sala>  lstSala = daoSala.listaPorNumero("%");
            objRespuesta.setDatos(lstSala);
            objRespuesta.setMensaje("Actualizaci\u00f3n existoso");
        }else{
            System.out.println("Problemas al ejecutar actualizacion");
        }

        //Gson -> Json
        Gson gson = new Gson();
        String json = gson.toJson(objRespuesta);

        //enviar json al browser
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.print(json);


    }



}


