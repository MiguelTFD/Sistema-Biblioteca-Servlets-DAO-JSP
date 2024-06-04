package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import com.google.gson.Gson;

import dao.AlumnoDAO;
import entity.Alumno;
import entity.Pais;
import entity.Respuesta;
import fabricas.Fabrica;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/crudAlumno")

public class CrudAlumnoServlet extends HttpServlet {

	
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String metodo = req.getParameter("metodo");
        switch (metodo) {
        case "paramLista": {lista (req, resp); break;}
        case "paramInserta": {inserta (req, resp); break;}
        case "paramActualiza": {actualiza (req, resp); break;}
        case "paramELogica": {elogica (req, resp); break;}
        case "paramEFisica": {efisica (req, resp);}
        }
    }

	private void lista(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("[ini] lista");

        String filtro  = req.getParameter("filtro");

        Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
        AlumnoDAO daoAlumno = subFabrica.getAlumnoDAO();

        List<Alumno> lstSalida = daoAlumno.listaPorNombre("%" + filtro + "%");

        Gson gson = new Gson();
        String json = gson.toJson(lstSalida);
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.println(json);
        System.out.println("[fin] lista");
		
	}

	private void inserta(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		
		
		System.out.println("[ini] inserta");

        Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
       AlumnoDAO daoAlumno = subFabrica.getAlumnoDAO();

        String vnom = req.getParameter("nombres");
        String vape = req.getParameter("apellidos");
        String vtel = req.getParameter("telefono");
        String vdni = req.getParameter("dni");
        String vcor = req.getParameter("correo");
        String vnac= req.getParameter("fechaNacimiento");
        String vpai = req.getParameter("pais");

       Pais objPais= new Pais();
        objPais.setIdPais(Integer.parseInt(vpai));

        Alumno objAlumno = new Alumno();

        objAlumno = new Alumno();
        objAlumno.setNombres(vnom);
        objAlumno.setApellidos(vape);
        objAlumno.setTelefono(vtel);
        objAlumno.setDni(vdni);
        objAlumno.setCorreo(vcor);
        objAlumno.setFechaNacimiento(Date.valueOf(vnac));
        objAlumno.setFechaRegistro(new  Date(System.currentTimeMillis()));
        objAlumno.setFechaActualizacion(new  Date(System.currentTimeMillis()));
        objAlumno.setEstado(1);
        objAlumno.setPais(objPais);
        
        
        Respuesta objRespuesta = new Respuesta();
        int salida = daoAlumno.insertarAlumno(objAlumno);
        if (salida>0) {
            List<Alumno> lstDatos = daoAlumno.listaPorNombre("%");
            objRespuesta.setDatos(lstDatos);
            objRespuesta.setMensaje("Registro Exitoso");
        }

        Gson gson = new Gson();
        String json = gson.toJson(objRespuesta);
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.println(json);

        System.out.println("[fin] inserta");

    }

	private void actualiza(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		
		
		System.out.println("[ini] actualiza");

        Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
        AlumnoDAO daoAlumno = subFabrica.getAlumnoDAO();

        String vida = req.getParameter("idAlumno");
        String vnom = req.getParameter("nombres");
        String vape = req.getParameter("apellidos");
        String vtel = req.getParameter("telefono");
        String vdni = req.getParameter("dni");
        String vcor = req.getParameter("correo");
        String vnac= req.getParameter("fechaNacimiento");
        String vpai = req.getParameter("pais");
        String vest = req.getParameter("estado");

        Pais objPais = new Pais();
        objPais.setIdPais(Integer.parseInt(vpai));

        Alumno objAlumno = new Alumno();
        objAlumno.setIdAlumno(Integer.parseInt(vida));
        objAlumno.setNombres(vnom);
        objAlumno.setApellidos((vape));
        objAlumno.setTelefono(vtel);
        objAlumno.setDni(vdni);
        objAlumno.setCorreo(vcor);
        objAlumno.setFechaNacimiento(Date.valueOf(vnac));
        objAlumno.setFechaRegistro(new Date(System.currentTimeMillis()));
        objAlumno.setFechaActualizacion(new Date(System.currentTimeMillis()));
        objAlumno.setPais(objPais);
        objAlumno.setEstado(Integer.parseInt(vest));

        Respuesta objResupeta = new Respuesta();
        int salida = daoAlumno.actualizaAlumno(objAlumno);
        if (salida>0) {
            List<Alumno>  lstDatos = daoAlumno.listaPorNombre("%");
            objResupeta.setDatos(lstDatos);
            objResupeta.setMensaje("Actualizaci\u00f3n existoso");
        }

        Gson gson = new Gson();
        String json = gson.toJson(objResupeta);
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.println(json);

        System.out.println("[fin] actualiza");
    }
	private void elogica(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		
		
		System.out.println("[ini] elogica");

        Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
        AlumnoDAO daoAlumno = subFabrica.getAlumnoDAO();

        String idAlumno = req.getParameter("idAlumno");
        Alumno objAlumno = daoAlumno.buscaAlumno(Integer.parseInt(idAlumno));
        int estadoNuevo = objAlumno.getEstado() == 0 ? 1 : 0;
        objAlumno.setEstado(estadoNuevo);
        daoAlumno.actualizaAlumno(objAlumno);

        Respuesta objResupeta = new Respuesta();
        List<Alumno>  lstDatos = daoAlumno.listaPorNombre("%");
        objResupeta.setDatos(lstDatos);

        Gson gson = new Gson();
        String json = gson.toJson(objResupeta);
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.println(json);

        System.out.println("[fin] elogica");

    }

	private void efisica(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
	
		System.out.println("[ini] efisica");

        Fabrica subFabrica = Fabrica.getFabrica(Fabrica.MYSQL);
        AlumnoDAO daoAlumno = subFabrica.getAlumnoDAO();

        String idAlumno = req.getParameter("idAlumno");

        Respuesta objResupeta = new Respuesta();
        int salida =daoAlumno.eliminaAlumno(Integer.parseInt(idAlumno));
        if (salida>0) {
            List<Alumno>  lstDatos = daoAlumno.listaPorNombre("%");
            objResupeta.setDatos(lstDatos);
            objResupeta.setMensaje("Eliminaci\u00f3n existosa");
        }

        Gson gson = new Gson();
        String json = gson.toJson(objResupeta);
        resp.setContentType("application/json;charset=UTF-8");
        PrintWriter out = resp.getWriter();
        out.println(json);

        System.out.println("[fin] efisica");
    }

}



