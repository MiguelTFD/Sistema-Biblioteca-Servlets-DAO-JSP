package entity;

public class PrestamoHasLibro {

	private PrestamoHasLibroPK prestamoHasProductoPK;
	private Prestamo prestamo;
	private Libro libro;
	public PrestamoHasLibroPK getPrestamoHasProductoPK() {
		return prestamoHasProductoPK;
	}
	public void setPrestamoHasProductoPK(PrestamoHasLibroPK prestamoHasProductoPK) {
		this.prestamoHasProductoPK = prestamoHasProductoPK;
	}
	public Prestamo getPrestamo() {
		return prestamo;
	}
	public void setPrestamo(Prestamo prestamo) {
		this.prestamo = prestamo;
	}
	public Libro getLibro() {
		return libro;
	}
	public void setLibro(Libro libro) {
		this.libro = libro;
	}

	

}
