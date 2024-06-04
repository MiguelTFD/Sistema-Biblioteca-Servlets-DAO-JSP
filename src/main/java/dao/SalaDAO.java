package dao;

import entity.Sala;

import java.util.List;

public interface SalaDAO {

	public abstract int insertarSala(Sala obj);

	public abstract List<Sala> listaSalaCompleja(String numero, int piso,String recursos, int estado, int idSede);

	public abstract List<Sala> listaPorNumero(String filtro);
	public abstract int actualizaSala(Sala obj);
	public abstract int eliminaSala(int idSala);
	public abstract Sala buscaSala(int idSala);


	//validaciones
	public abstract List<Sala> validacionNumeroSala(String numero);
}

