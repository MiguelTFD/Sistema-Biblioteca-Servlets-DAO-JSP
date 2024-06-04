package entity;

import java.util.Date;
import java.util.List;



public class Prestamo {

	private int idPrestamo;
	private Date fechaPrestamo;
	private Date fechaDevolucion;
	private Usuario usuario;
	private List<PrestamoHasLibro> detallesPrestamos;
	public int getIdPrestamo() {
		return idPrestamo;
	}
	public void setIdPrestamo(int idPrestamo) {
		this.idPrestamo = idPrestamo;
	}
	public Date getFechaPrestamo() {
		return fechaPrestamo;
	}
	public void setFechaPrestamo(Date fechaPrestamo) {
		this.fechaPrestamo = fechaPrestamo;
	}
	public Date getFechaDevolucion() {
		return fechaDevolucion;
	}
	public void setFechaDevolucion(Date fechaDevolucion) {
		this.fechaDevolucion = fechaDevolucion;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public List<PrestamoHasLibro> getDetallesPrestamos() {
		return detallesPrestamos;
	}
	public void setDetallesPrestamos(List<PrestamoHasLibro> detallesPrestamos) {
		this.detallesPrestamos = detallesPrestamos;
	}

	
}
