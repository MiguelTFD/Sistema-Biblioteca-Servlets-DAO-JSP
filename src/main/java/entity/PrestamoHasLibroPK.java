package entity;

import java.io.Serializable;


public class PrestamoHasLibroPK  implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private int idPrestamo;
	private int idLibro;
	public int getIdPrestamo() {
		return idPrestamo;
	}
	public void setIdPrestamo(int idPrestamo) {
		this.idPrestamo = idPrestamo;
	}
	public int getIdLibro() {
		return idLibro;
	}
	public void setIdLibro(int idLibro) {
		this.idLibro = idLibro;
	}

	
	
}
