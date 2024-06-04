package dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.AutorDAO;
import entity.Autor;
import entity.Grado;
import util.MySqlDBConexion;

public class MySqlAutorDAO implements AutorDAO {
	
	@Override
	public int insertaAutor(Autor obj) {
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sqlSelect = "select idAutor from autor where nombres = ? and apellidos = ? and fechaNacimiento = ?";
		    pstm = conn.prepareStatement(sqlSelect);
		    pstm.setString(1, obj.getNombres());
		    pstm.setString(2, obj.getApellidos());
		    pstm.setDate(3, obj.getFechaNacimiento());
		    ResultSet rs = pstm.executeQuery();

		    if(rs.next()) {
		    	int idAutor = rs.getInt("idAutor");
		        String sqlUpdate = "update autor set fechaActualizacion = ? where idAutor = ?";
		        pstm = conn.prepareStatement(sqlUpdate);
		        pstm.setDate(1, obj.getFechaActualizacion());
		        pstm.setInt(2, idAutor);
		        salida = pstm.executeUpdate();
		    } else {
				String sql = "insert into autor values(null,?,?,?,?,?,?,?,?)";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, obj.getNombres());
				pstm.setString(2, obj.getApellidos());
				pstm.setDate(3, obj.getFechaNacimiento());
				pstm.setDate(4, obj.getFechaActualizacion());
				pstm.setString(5, obj.getTelefono());
				pstm.setDate(6, obj.getFechaRegistro());
				pstm.setInt(7, obj.getEstado());
				pstm.setInt(8, obj.getGrado().getIdGrado());
				salida = pstm.executeUpdate();
		    }	
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
		return salida;
	}
	
	@Override
	public List<Autor> listaAutorCompleja(String nombres,String apellidos, String telefono, int idGrado, int estado) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<Autor> lstSalida = new ArrayList<Autor>();
		try {
			//1 Se crea la conexion
			conn = MySqlDBConexion.getConexion();
			
			//2 Se prepara el sql
			String sql = "SELECT r.*, m.descripcion FROM autor r inner join "
					+ " grado_autor m on m.idGrado = r.idGrado where "
					+ "	r.nombres like ? and "
					+ " r.apellidos like ? and  "
					+ " r.telefono like ? and  "
					+ " (?=-1 or r.idGrado=?) and "
					+ " r.estado = ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, nombres);
			pstm.setString(2, apellidos);
			pstm.setString(3, telefono);
			pstm.setInt(4, idGrado);
			pstm.setInt(5, idGrado);
			pstm.setInt(6, estado);
			
			System.out.println("SQL => " + pstm);
			
			//3 Se ejcuta el SQL
			rs =  pstm.executeQuery();
			Autor objAutor;
			Grado objGrado;
			while(rs.next()) {
				objAutor = new Autor();
				objAutor.setIdAutor(rs.getInt(1));
				objAutor.setNombres(rs.getString(2));
				objAutor.setApellidos(rs.getString(3));
				objAutor.setFechaNacimiento(rs.getDate(4));
				objAutor.setFechaActualizacion(rs.getDate(5));
				objAutor.setTelefono(rs.getString(6));
				objAutor.setFechaRegistro(rs.getDate(7));
				objAutor.setEstado(rs.getInt(8));
				
				objGrado = new Grado();
				objGrado.setIdGrado(rs.getInt(9));
				objGrado.setDescripcion(rs.getString(10));
				objAutor.setGrado(objGrado);
	
				lstSalida.add(objAutor);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
		return lstSalida;
	}
	
	@Override
	public List<Autor> listaPorNombre(String filtro) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<Autor> lstSalida = new ArrayList<Autor>();
		try {
			//1 Se crea la conexion
			conn = MySqlDBConexion.getConexion();
			
			//2 Se prepara el sql
			String sql = "SELECT r.*, m.descripcion FROM autor r inner join "
					+ " grado_autor m on m.idGrado = r.idGrado where "
					+ "	r.nombres like ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, filtro);

			System.out.println("SQL => " + pstm);
			
			//3 Se ejcuta el SQL
			rs =  pstm.executeQuery();
			Autor objAutor;
			Grado objGrado;
			while(rs.next()) {
				objAutor = new Autor();
				objAutor.setIdAutor(rs.getInt(1));
				objAutor.setNombres(rs.getString(2));
				objAutor.setApellidos(rs.getString(3));
				objAutor.setFechaNacimiento(rs.getDate(4));
				objAutor.setFechaActualizacion(rs.getDate(5));
				objAutor.setTelefono(rs.getString(6));
				objAutor.setFechaRegistro(rs.getDate(7));
				objAutor.setEstado(rs.getInt(8));
				
				objGrado = new Grado();
				objGrado.setIdGrado(rs.getInt(9));
				objGrado.setDescripcion(rs.getString(10));
				objAutor.setGrado(objGrado);
	
				lstSalida.add(objAutor);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
		return lstSalida;
	}

	@Override
	public int actualizaAutor(Autor obj) {
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		try {
			//1 Se crea la conexion
			conn = MySqlDBConexion.getConexion();
			
			//2 Se prepara el sql
			String sql = "update autor set nombres = ?, apellidos = ?,"
					+ " fechaNacimiento = ?, fechaActualizacion = ?, telefono = ?, estado = ?, idGrado = ? where idAutor = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombres());
			pstm.setString(2, obj.getApellidos());
			pstm.setDate(3, obj.getFechaNacimiento());
			pstm.setDate(4, new Date(System.currentTimeMillis()));
			pstm.setString(5, obj.getTelefono());
			pstm.setInt(6, obj.getEstado());
			pstm.setInt(7, obj.getGrado().getIdGrado());
			pstm.setInt(8, obj.getIdAutor());
			
			System.out.println("SQL => " + pstm);
			
			//3 ejecuta el sql a la base datos
			//salida tendra el numero de instados
			salida = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
		return salida;
	}

	@Override
	public int eliminaAutor(int idAutor) {
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		try {
			//1 Se crea la conexion
			conn = MySqlDBConexion.getConexion();
			
			//2 Se prepara el sql
			String sql = "delete from autor where idAutor = ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idAutor);
			System.out.println("SQL => " + pstm);
			
			//3 ejecuta el sql a la base datos
			//salida tendra el numero de instados
			salida = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
		return salida;
	}

	@Override
	public Autor buscaAutor(int idAutor) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Autor objSalida = null;
		try {
			//1 Se crea la conexion
			conn = MySqlDBConexion.getConexion();
			
			//2 Se prepara el sql
			String sql = "SELECT r.*, m.descripcion FROM autor r inner join "
					+ " grado_autor m on m.idGrado = r.idGrado where "
					+ "	r.idAutor = ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idAutor);
			
			System.out.println("SQL => " + pstm);
			
			//3 Se ejcuta el SQL
			rs =  pstm.executeQuery();
			Grado objGrado;
			if(rs.next()) {
				objSalida = new Autor();
				objSalida.setIdAutor(rs.getInt(1));
				objSalida.setNombres(rs.getString(2));
				objSalida.setApellidos(rs.getString(3));
				objSalida.setFechaNacimiento(rs.getDate(4));
				objSalida.setFechaActualizacion(rs.getDate(5));
				objSalida.setTelefono(rs.getString(6));
				objSalida.setFechaRegistro(rs.getDate(7));
				objSalida.setEstado(rs.getInt(8));
				
				objGrado = new Grado();
				objGrado.setIdGrado(rs.getInt(9));
				objGrado.setDescripcion(rs.getString(10));
				objSalida.setGrado(objGrado);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
		return objSalida;
	}
}
