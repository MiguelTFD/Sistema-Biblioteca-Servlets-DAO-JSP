package entity;

import java.io.Serializable;


public class DevolucionHasLibroPK  implements Serializable{
	
	private static final long serialVersionUID = 1L;

	private int idDevolucion;
	private int idLibro;
	public int getIdDevolucion() {
		return idDevolucion;
	}
	public void setIdDevolucion(int idDevolucion) {
		this.idDevolucion = idDevolucion;
	}
	public int getIdLibro() {
		return idLibro;
	}
	public void setIdLibro(int idLibro) {
		this.idLibro = idLibro;
	}

	
}
