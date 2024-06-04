package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.CategoriaDAO;
import entity.Categoria;
import util.MySqlDBConexion;


public class MySqlCategoriaDAO implements CategoriaDAO{
	
	@Override
	public List<Categoria> listaCategorias() {
		List<Categoria> salida = new ArrayList<Categoria>();
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();

			String sql = "select * from categoria_libro";
			psmt = conn.prepareStatement(sql);

			System.out.println("SQL => " +psmt);
			
			rs = psmt.executeQuery();
			
			Categoria obj = null;
			while (rs.next()) {
				obj = new Categoria();
				obj.setIdCategoria(rs.getInt(1));
				obj.setDescripcion(rs.getString(2));
				salida.add(obj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (psmt != null)psmt.close();
				if (conn != null)conn.close();
			} catch (Exception e2) {
				}
		}
		return salida;
	}

}