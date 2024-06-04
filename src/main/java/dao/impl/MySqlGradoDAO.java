package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.GradoDAO;
import entity.Grado;
import util.MySqlDBConexion;

public class MySqlGradoDAO implements GradoDAO{

	@Override
	public List<Grado> lista() {
		List<Grado> salida = new ArrayList<Grado>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			//1 Se crea la conexion
			conn = MySqlDBConexion.getConexion();
			
			//2 Se prepara el sql
			String sql = "select * from grado_autor";
			pstm = conn.prepareStatement(sql);
			
			System.out.println("SQL => " + pstm);
			
			//3 Traer la data
			rs = pstm.executeQuery();
		
			Grado obj = null;
			while(rs.next()) {
				obj = new Grado();
				obj.setIdGrado(rs.getInt(1));
				obj.setDescripcion(rs.getString(2));
				salida.add(obj);
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

}