package entity;

import java.util.List;

public class Respuesta {
	
	private String mensaje;
	private List<?> datos;
	
	public String getMensaje() {
		return mensaje;
	}
	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}
	public List<?> getDatos() {
		return datos;
	}
	public void setDatos(List<?> datos) {
		this.datos = datos;
	}
	
	
}
