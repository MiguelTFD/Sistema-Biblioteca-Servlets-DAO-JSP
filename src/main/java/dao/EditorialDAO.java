package dao;

import java.util.List;

import entity.Editorial;

public interface EditorialDAO {

	public abstract int insetaEditorial(Editorial obj);
	
	
	
	
	public abstract List<Editorial> listaPorNombre(String filtro);
	public abstract int actualizaEditorial(Editorial obj);
	public abstract int eliminaEditorial(int idEditorial);
	public abstract Editorial buscaEditorial(int idEditorial);

	public abstract List<Editorial> listaEditorialCompleja(String rasonSocial, String direccion, int idPais, int estado, String ruc);

	public abstract List<Editorial> listaPorRazonSocialIgual(String razonSocial);
	
	public abstract List<Editorial> listaPorRazonRUCIgual(String ruc);
}