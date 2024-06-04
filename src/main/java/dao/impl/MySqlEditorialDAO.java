package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;



import dao.EditorialDAO;
import entity.Editorial;
import entity.Pais;

import util.FechaUtil;
import util.MySqlDBConexion;




public class MySqlEditorialDAO implements EditorialDAO {

	@Override
	public int insetaEditorial(Editorial obj) {
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "insert into editorial values(null,?,?,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getRazonSocial());
			pstm.setString(2, obj.getDireccion());
			pstm.setInt(3, obj.getTelefono());
			pstm.setString(4, obj.getRuc());
			pstm.setDate(5, obj.getFechaCreacion());
			pstm.setDate(6, obj.getFechaRegistro());
			pstm.setDate(7, obj.getFechaActualizacion());
			pstm.setInt(8, obj.getEstado());
			pstm.setInt(9, obj.getPais().getIdPais());
			
			System.out.println("SQL => " + pstm);
			
			salida = pstm.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
		return salida;
	}
	
	@Override
	public List<Editorial> listaEditorialCompleja(String rasonSocial, String direccion, int idPais, int estado, String ruc){
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<Editorial> lstSalida = new ArrayList<Editorial>();
		try {
			
			conn = MySqlDBConexion.getConexion();
			
			String sql = "SELECT e.*, p.nombre FROM editorial e INNER JOIN "
					+ " pais p ON p.idPais = e.idPais WHERE "
					+ " 	e.razonSocial LIKE ? AND "
					+ " e.direccion LIKE ? AND  "
					+ " e.ruc LIKE ? AND  "
					+ " (?=-1 or e.idPais=?) and" 
					+ " e.estado = ?";
			
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, rasonSocial);
			pstm.setString(2, direccion);
			pstm.setString(3, ruc);
			pstm.setInt(4, idPais);
			pstm.setInt(5, idPais);
			pstm.setInt(6, estado);
			
			System.out.println("SQL => " + pstm);
			
			rs =  pstm.executeQuery();
			Editorial objEditorial;
			Pais objPais;
			
			System.out.print(rs);
			
			while(rs.next()) {
				System.out.print(rs);
				objEditorial = new Editorial();
				objEditorial.setIdEditorial(rs.getInt(1));
				objEditorial.setRazonSocial(rs.getString(2));
				objEditorial.setDireccion(rs.getString(3));
				objEditorial.setTelefono(rs.getInt(4));
				objEditorial.setRuc(rs.getString(5));
				objEditorial.setFechaCreacion(rs.getDate(6));
				objEditorial.setFechaRegistro(rs.getDate(7));
				objEditorial.setFechaActualizacion(rs.getDate(8));
				objEditorial.setEstado(rs.getInt(9));
				
				objPais = new Pais();
				objPais.setIdPais(rs.getInt(10));
				objPais.setNombre(rs.getString(11));
				objEditorial.setPais(objPais);
				
				lstSalida.add(objEditorial);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
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
	public List<Editorial> listaPorNombre(String filtro) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<Editorial> lstSalida = new ArrayList<Editorial>();
		try {
			//1 Se crea la conexion
			conn = MySqlDBConexion.getConexion();
			
			//2 Se prepara el sql
			String sql = "SELECT a.*, i.nombre FROM editorial a inner join "
					+ " pais i on i.idPais = a.idPais where "
					+ "	a.razonSocial like ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, filtro);

			System.out.println("SQL => " + pstm);
			
			//3 Se ejcuta el SQL
			rs =  pstm.executeQuery();
			Editorial objEditorial;
			Pais objPais;
			while(rs.next()) {
				objEditorial = new Editorial();
				objEditorial.setIdEditorial(rs.getInt(1));
				objEditorial.setRazonSocial(rs.getString(2));
				objEditorial.setDireccion(rs.getString(3));
				objEditorial.setTelefono(rs.getInt(4));
				objEditorial.setRuc(rs.getString(5));
				objEditorial.setFechaCreacion(rs.getDate(6));
				objEditorial.setFechaRegistro(rs.getDate(7));
				objEditorial.setFechaFormateada(FechaUtil.getFechaFormateadaYYYYMMdd(rs.getDate(6)));
				objEditorial.setFechaActualizacion(rs.getDate(8));
				objEditorial.setEstado(rs.getInt(9));
				
				objPais = new Pais();
				objPais.setIdPais(rs.getInt(10));
				objPais.setNombre(rs.getString(11));
				objEditorial.setPais(objPais);
	
				lstSalida.add(objEditorial);
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
	public int actualizaEditorial(Editorial obj) {
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		try {
			
			//1 Se crea la conexion
			conn = MySqlDBConexion.getConexion();
			
			//2 Se prepara el sql
			String sql = "update editorial set razonSocial = ?, direccion = ?, "
					+ "telefono = ?, fechaCreacion = ?, ruc = ?,  estado = ?, idPais = ? where idEditorial = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getRazonSocial());
			pstm.setString(2, obj.getDireccion());
			pstm.setInt(3, obj.getTelefono());
			pstm.setDate(4, obj.getFechaCreacion());
			pstm.setString(5, obj.getRuc());
			pstm.setInt(6, obj.getEstado());
			pstm.setInt(7, obj.getPais().getIdPais());
			pstm.setInt(8, obj.getIdEditorial());
			
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
	public int eliminaEditorial(int idEditorial) {
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		try {
			//1 Se crea la conexion
			conn = MySqlDBConexion.getConexion();
			
			//2 Se prepara el sql
			String sql = "delete from Editorial where idEditorial = ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idEditorial);
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
	public Editorial buscaEditorial(int idEditorial) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Editorial objSalida = null;
		try {
			//1 Se crea la conexion
			conn = MySqlDBConexion.getConexion();
			
			//2 Se prepara el sql
			String sql = "SELECT u.*, i.nombre FROM editorial u inner join "
					+ " pais i on i.idPais = u.idPais where "
					+ "	u.idEditorial = ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idEditorial);
			
			System.out.println("SQL => " + pstm);
			
			//3 Se ejcuta el SQL
			rs =  pstm.executeQuery();
			Pais objPais;
			if(rs.next()) {
				objSalida = new Editorial();
				objSalida.setIdEditorial(rs.getInt(1));
				objSalida.setRazonSocial(rs.getString(2));
				objSalida.setDireccion(rs.getString(3));
				objSalida.setTelefono(rs.getInt(4));
				objSalida.setRuc(rs.getString(5));
				objSalida.setFechaCreacion(rs.getDate(6));
				objSalida.setFechaRegistro(rs.getDate(7));
				objSalida.setFechaActualizacion(rs.getDate(8));
				objSalida.setEstado(rs.getInt(9));
				
				objPais = new Pais();
				objPais.setIdPais(rs.getInt(10));
				objPais.setNombre(rs.getString(11));
				objSalida.setPais(objPais);
	
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
	@Override
	public List<Editorial> listaPorRazonSocialIgual(String razonSocial) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<Editorial> lstSalida = new ArrayList<Editorial>();
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "SELECT * FROM editorial where razonSocial = ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, razonSocial);

			System.out.println("SQL => " + pstm);
			
			rs =  pstm.executeQuery();
			Editorial objEditorial;
			while(rs.next()) {
				objEditorial = new Editorial();
				objEditorial.setIdEditorial(rs.getInt(1));
				objEditorial.setRazonSocial(rs.getString(2));

				lstSalida.add(objEditorial);
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
	public List<Editorial> listaPorRazonRUCIgual(String ruc) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<Editorial> lstSalida = new ArrayList<Editorial>();
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "SELECT * FROM editorial where ruc = ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, ruc);

			System.out.println("SQL => " + pstm);
			
			rs =  pstm.executeQuery();
			Editorial objEditorial;
			while(rs.next()) {
				objEditorial = new Editorial();
				objEditorial.setIdEditorial(rs.getInt(1));
				objEditorial.setRuc(rs.getString(2));

				lstSalida.add(objEditorial);
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
}
