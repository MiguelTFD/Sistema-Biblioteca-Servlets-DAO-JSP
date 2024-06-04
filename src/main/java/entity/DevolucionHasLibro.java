package entity;

public class DevolucionHasLibro {

	private DevolucionHasLibroPK devolucionHasProductoPK;
	private Devolucion devolucion;
	private Libro libro;
	public DevolucionHasLibroPK getDevolucionHasProductoPK() {
		return devolucionHasProductoPK;
	}
	public void setDevolucionHasProductoPK(DevolucionHasLibroPK devolucionHasProductoPK) {
		this.devolucionHasProductoPK = devolucionHasProductoPK;
	}
	public Devolucion getDevolucion() {
		return devolucion;
	}
	public void setDevolucion(Devolucion devolucion) {
		this.devolucion = devolucion;
	}
	public Libro getLibro() {
		return libro;
	}
	public void setLibro(Libro libro) {
		this.libro = libro;
	}

	

}
