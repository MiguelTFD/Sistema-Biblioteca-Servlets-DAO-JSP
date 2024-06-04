package entity;

public class UsuarioHasRol {

	private UsuarioHasRolPK usuarioHasRolPk;
	private Usuario usuario;
	private Rol rol;
	public UsuarioHasRolPK getUsuarioHasRolPk() {
		return usuarioHasRolPk;
	}
	public void setUsuarioHasRolPk(UsuarioHasRolPK usuarioHasRolPk) {
		this.usuarioHasRolPk = usuarioHasRolPk;
	}
	public Usuario getUsuario() {
		return usuario;
	}
	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}
	public Rol getRol() {
		return rol;
	}
	public void setRol(Rol rol) {
		this.rol = rol;
	}

	
}
