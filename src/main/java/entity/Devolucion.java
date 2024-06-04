package entity;

import java.util.Date;
import java.util.List;



public class Devolucion {

	private int idDevolucion;
	private Date fechaRegistro;
	private Date fechaDevolucion;
	private int estado;
	private Usuario usuario;
	private List<DevolucionHasLibro> detallesDevolucion;
	public int getIdDevolucion() {
		return idDevolucion;
	}
	public void setIdDevolucion(int idDevolucion) {
		this.idDevolucion = idDevolucion;
	}
	public Date getFechaRegistro() {
		return fechaRegistro;
	}
	public void setFechaRegistro(Date fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}
	public Date getFechaDevolucion() {
		return fechaDevolucion;
	}
	public void setFechaDevolucion(Date fechaDevolucion) {
		this.fechaDevolucion = fechaDevolucion;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public List<DevolucionHasLibro> getDetallesDevolucion() {
		return detallesDevolucion;
	}
	public void setDetallesDevolucion(List<DevolucionHasLibro> detallesDevolucion) {
		this.detallesDevolucion = detallesDevolucion;
	}

	
	
}
