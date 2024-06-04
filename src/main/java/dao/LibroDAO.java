package dao;

import java.util.List;

import entity.Libro;

//Ruiz Bryan

public interface LibroDAO {

	//Registro
	public int insertarLibro(Libro obj);
	
	//Consulta
	public abstract List<Libro> listaLibroCompleja(String titulo, String serie, String tema, int estado, int idCategoria);
	
	//CRUD
	
	public abstract List<Libro> listaPorTitulo(String filtro);
	public abstract int actualizaLibro(Libro obj);
	public abstract int eliminaLibro(int idLibro);
	public abstract Libro buscaLibro(int idLibro);		
	
	//Validacion
	
	public abstract List<Libro> listaPorTituloIgual(String titulo);
}