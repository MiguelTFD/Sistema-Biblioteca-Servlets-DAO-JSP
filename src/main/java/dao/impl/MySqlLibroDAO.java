package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entity.Categoria;
import entity.Libro;

import util.MySqlDBConexion;
import dao.LibroDAO;

//Ruiz Bryan

public class MySqlLibroDAO implements LibroDAO {
	@Override
	public 	int insertarLibro(Libro obj) {
        Connection conn = null;
        PreparedStatement psmt = null;
        int salida = -1;
        try {
            conn = MySqlDBConexion.getConexion();
            String sql = "insert into libro values(null,?,?,?,?,?,?,?,?)";
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, obj.getTitulo());
            psmt.setInt(2, obj.getAnio());
            psmt.setString(3, obj.getSerie());
            psmt.setString(4, obj.getTema());
            psmt.setDate(5, obj.getFechaRegistro());
            psmt.setDate(6, obj.getFechaActualizacion());
            psmt.setInt(7, obj.getEstado());
            psmt.setInt(8, obj.getCategoria().getIdCategoria());
            
            System.out.println("SQL => " + psmt);
            
            salida = psmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(psmt != null) psmt.close();
                if(conn != null) conn.close();
            } catch (Exception e2) {
            }
        }
        return salida;
    }

	@Override
	public List<Libro> listaLibroCompleja(String titulo, String serie, String tema, int estado, int idCategoria) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<Libro> lstSalida = new ArrayList<Libro>();
		try {
			//1 Se crea la conexion
			conn = MySqlDBConexion.getConexion();
			
			//2 Se prepara el sql
			String sql = "SELECT l.*, cl.descripcion FROM libro l INNER JOIN categoria_libro cl ON cl.idCategoria = l.idCategoria "
					+ "WHERE l.titulo LIKE ? AND l.serie LIKE ? AND  l.tema LIKE ? AND ( ? = -1 OR l.idCategoria = ?) AND l.estado = ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, titulo);
			pstm.setString(2, serie);
			pstm.setString(3, tema);
			pstm.setInt(4, idCategoria);
			pstm.setInt(5, idCategoria);
			pstm.setInt(6, estado);		
			
			System.out.println("SQL => " + pstm);
			
			//3 Se ejcuta el SQL
			rs =  pstm.executeQuery();
			Libro objLibro;
			Categoria objCategoria;
			while(rs.next()) {
				objLibro = new Libro();
				objLibro.setIdLibro(rs.getInt(1));
				objLibro.setTitulo(rs.getString(2));
				objLibro.setAnio(rs.getInt(3));
				objLibro.setSerie(rs.getString(4));		
				objLibro.setTema(rs.getString(5));
				objLibro.setFechaActualizacion(rs.getDate(6));
				objLibro.setFechaRegistro(rs.getDate(7));
				objLibro.setEstado(rs.getInt(8));
				
				objCategoria = new Categoria();
				objCategoria.setIdCategoria(rs.getInt(9));
				objCategoria.setDescripcion(rs.getString(10));
				objLibro.setCategoria(objCategoria);
	
				lstSalida.add(objLibro);
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
	public List<Libro> listaPorTitulo(String filtro) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<Libro> lstSalida = new ArrayList<Libro>();
		
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "SELECT l.*, cl.descripcion FROM libro l inner join "
					+ " categoria_libro cl on cl.idCategoria = l.idCategoria where "
					+ "	l.titulo like ? ";
			
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, filtro);
			
			System.out.println("SQL => " + pstm);
			
			rs = pstm.executeQuery();
			Libro objLibro;
			Categoria objCategoria;
			while (rs.next()) {
				objLibro = new Libro();
				objLibro.setIdLibro(rs.getInt(1));
				objLibro.setTitulo(rs.getString(2));
				objLibro.setAnio(rs.getInt(3));
				objLibro.setSerie(rs.getString(4));		
				objLibro.setTema(rs.getString(5));
				objLibro.setFechaRegistro(rs.getDate(6));
				objLibro.setEstado(rs.getInt(8));
				
				objCategoria = new Categoria();
				objCategoria.setIdCategoria(rs.getInt(9));
				objCategoria.setDescripcion(rs.getString(10));
				objLibro.setCategoria(objCategoria);
	
				lstSalida.add(objLibro);
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
	public int actualizaLibro(Libro obj) {
		
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		
		try {
			conn = MySqlDBConexion.getConexion();
			
				String sql = "update libro set titulo = ?, anio = ?, serie = ?,"
						+ " tema = ?, estado = ?, idCategoria = ? where idLibro = ?";
			
			pstm = conn.prepareStatement(sql);
	        pstm.setString(1, obj.getTitulo());
	        pstm.setInt(2, obj.getAnio());
	        pstm.setString(3, obj.getSerie());
	        pstm.setString(4, obj.getTema());
	        pstm.setInt(5, obj.getEstado());
	        pstm.setInt(6, obj.getCategoria().getIdCategoria());
	        pstm.setInt(7, obj.getIdLibro());
	       
	        
	        System.out.println("SQL => " + pstm);
	        
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
	public int eliminaLibro(int idLibro) {
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		try {
			//1 Se crea la conexion
			conn = MySqlDBConexion.getConexion();
			
			//2 Se prepara el sql
			String sql = "delete from libro where idLibro = ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idLibro);
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
	public Libro buscaLibro(int idLibro) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Libro objSalida = null;
		try {
			//1 Se crea la conexion
			conn = MySqlDBConexion.getConexion();
			
			//2 Se prepara el sql
			String sql = "SELECT l.*, cl.descripcion FROM libro l inner join "
					+ " categoria_libro cl on cl.idCategoria = l.idCategoria where "
					+ "	l.idLibro = ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idLibro);
			
			System.out.println("SQL => " + pstm);
			
			//3 Se ejcuta el SQL
			rs =  pstm.executeQuery();
			Categoria objCategoria;
			if(rs.next()) {
				objSalida = new Libro();
				objSalida.setIdLibro(rs.getInt(1));
				objSalida.setTitulo(rs.getString(2));
				objSalida.setAnio(rs.getInt(3));
				objSalida.setSerie(rs.getString(4));
				objSalida.setTema(rs.getString(5));
				objSalida.setFechaRegistro(rs.getDate(7));
				objSalida.setEstado(rs.getInt(8));
				
				objCategoria = new Categoria();
				objCategoria.setIdCategoria(rs.getInt(9));
				objCategoria.setDescripcion(rs.getString(10));
				objSalida.setCategoria(objCategoria);
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
	public List<Libro> listaPorTituloIgual(String titulo) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<Libro> lstSalida = new ArrayList<Libro>();
		try {
			//1 Se crea la conexion
			conn = MySqlDBConexion.getConexion();
			
			//2 Se prepara el sql
			String sql = "SELECT * FROM libro where titulo = ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, titulo);

			System.out.println("SQL => " + pstm);
			
			//3 Se ejcuta el SQL
			rs =  pstm.executeQuery();
			Libro objLibro;
			while(rs.next()) {
				objLibro = new Libro();
				objLibro.setIdLibro(rs.getInt(1));
				objLibro.setTitulo(rs.getString(2));

				lstSalida.add(objLibro);
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