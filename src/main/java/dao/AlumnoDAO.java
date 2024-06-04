package dao;

import java.util.List;

import entity.Alumno;

public interface AlumnoDAO {

	public abstract int  insertarAlumno(Alumno obj);
	
	public abstract List<Alumno> listaAlumnocompleja(String nombres, String apellidos, String telefono, String dni, int estado, int idPais);
	
	public abstract List<Alumno> listaPorNombre(String filtro);
	
	
	public abstract int actualizaAlumno(Alumno obj); 
	
	
	public abstract int eliminaAlumno(int idAlumno);
	
	
	public abstract Alumno buscaAlumno(int idAlumno);
	/*Validacion*/
	public abstract List<Alumno> listaXNombresIguales(String nombres);
	public abstract List<Alumno> listaXApellidosIguales(String apellidos);
	public abstract List<Alumno> listaXTelefonoIguales(String telefono);
	public abstract List<Alumno> listaXDNIIguales(String dni);
}

