package entity;

import java.sql.Date;



public class Revista {

	private int idRevista;
	private String nombre;
	private String frecuencia;
	private Date fechaCreacion;
	private Date fechaRegistro;
	private int estado;
	private Modalidad mmodalidad;
	public int getIdRevista() {
		return idRevista;
	}
	public void setIdRevista(int idRevista) {
		this.idRevista = idRevista;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getFrecuencia() {
		return frecuencia;
	}
	public void setFrecuencia(String frecuencia) {
		this.frecuencia = frecuencia;
	}
	public Date getFechaCreacion() {
		return fechaCreacion;
	}
	public void setFechaCreacion(Date fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}
	public Date getFechaRegistro() {
		return fechaRegistro;
	}
	public void setFechaRegistro(Date fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}
	public int getEstado() {
		return estado;
	}
	public void setEstado(int estado) {
		this.estado = estado;
	}
	public Modalidad getMmodalidad() {
		return mmodalidad;
	}
	public void setMmodalidad(Modalidad mmodalidad) {
		this.mmodalidad = mmodalidad;
	}
	
	
	

}
