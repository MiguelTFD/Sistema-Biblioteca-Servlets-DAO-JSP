package dao.impl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dao.AlumnoDAO;
import entity.Alumno;
import entity.Pais;
import lombok.extern.apachecommons.CommonsLog;
import util.MySqlDBConexion;

/*Lizarraga*/
@CommonsLog
public class MySqlAlumnoDAO implements AlumnoDAO {
	
	public int insertarAlumno(Alumno obj){
		Connection conn = null;
		PreparedStatement pstm = null;
		int salida = -1;
		try {
			
		conn = MySqlDBConexion.getConexion();
		String sql = "insert into alumno values(null,?,?,?,?,?,?,?,?,?,?)";
		pstm = conn.prepareStatement(sql);
		pstm.setString(1, obj.getNombres());
		pstm.setString(2, obj.getApellidos());
		pstm.setString(3, obj.getTelefono());
		pstm.setString(4, obj.getDni());
		pstm.setString(5, obj.getCorreo());
		pstm.setDate(6, obj.getFechaNacimiento());
		pstm.setDate(7, obj.getFechaRegistro());
		pstm.setDate(8, obj.getFechaActualizacion());
		pstm.setInt(9, obj.getEstado());
		pstm.setInt(10, obj.getPais().getIdPais());
		
		
		System.out.println("SQL => " + pstm);
		
		
		
		salida = pstm.executeUpdate();
		
		} catch (Exception e) {
			
			
			e.printStackTrace();
			
			
		} finally {
			
			try {
				
				if(pstm != null) pstm.close();
                if(conn != null) conn.close();
				
			} catch (Exception e2) {
				
				
			}
			
			
		}
		
		return salida;
	}
	
	@Override
	public List<Alumno> listaAlumnocompleja(String nombres, String apellidos, String telefono, String dni, int estado, int idPais) {

		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		List<Alumno> lstSalida = new ArrayList<Alumno>();
		
		try {
			
			conn = MySqlDBConexion.getConexion();
			String sql = "SELECT a.*, p.nombre " +
		             " FROM alumno a " +
		             " INNER JOIN pais p ON p.idPais = a.idPais " +
		             " WHERE a.nombres LIKE ? " +
		             " AND a.apellidos LIKE ? " +
		             " AND a.telefono LIKE ? " +
		             " AND a.dni LIKE ? " +
		             " AND ( ? = -1 OR a.idPais = ? ) " +
		             " AND a.estado = ? ";
			        pstm = conn.prepareStatement(sql);
			        
			        pstm.setString(1, nombres);
			        pstm.setString(2, apellidos);
			        pstm.setString(3, telefono);
			        pstm.setString(4, dni);
			        pstm.setInt(5, idPais);
			        pstm.setInt(6, idPais);
			        pstm.setInt(7, estado);
			        
			        System.out.println("SQL => " + pstm);
			        rs =  pstm.executeQuery();
			        
			        Alumno objAlumno;
			        Pais objPais;
			        while (rs.next()) {
			            objAlumno = new Alumno();
			            objAlumno.setIdAlumno(rs.getInt("idAlumno"));
			            objAlumno.setNombres(rs.getString("nombres"));
			            objAlumno.setApellidos(rs.getString("apellidos"));
			            objAlumno.setTelefono(rs.getString("telefono"));
			            objAlumno.setDni(rs.getString("dni"));
			            objAlumno.setCorreo(rs.getString("correo"));
			            objAlumno.setFechaNacimiento(rs.getDate("fechaNacimiento")); 
			            objAlumno.setFechaRegistro(rs.getDate("fechaRegistro"));
			            objAlumno.setEstado(rs.getInt("estado"));

			            
			            objPais = new Pais();
			            objPais.setIdPais(rs.getInt("idPais"));
			            objPais.setNombre(rs.getString("nombre")); 
			            objAlumno.setPais(objPais);

			            lstSalida.add(objAlumno);
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
	public List<Alumno> listaPorNombre(String filtro) {
		Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<Alumno> lstSalida = new ArrayList<Alumno>();

        try {
            conn = MySqlDBConexion.getConexion();

            String sql = "SELECT a.*, p.nombre FROM alumno a inner join "
                    + " pais p on p.idPais = a.idPais where "
                    + "    a.nombres like ? ";

            pstm = conn.prepareStatement(sql);
            pstm.setString(1, filtro);

            System.out.println("SQL => " + pstm);

            rs = pstm.executeQuery();
            Alumno objAlumno;
            Pais objPais;
            while (rs.next()) {
                objAlumno = new Alumno();
                objAlumno.setIdAlumno(rs.getInt(1));
                objAlumno.setNombres(rs.getString(2));
                objAlumno.setApellidos(rs.getString(3));
                objAlumno.setTelefono(rs.getString(4));
                objAlumno.setDni(rs.getString(5));
                objAlumno.setCorreo(rs.getString(6));
                objAlumno.setFechaNacimiento(rs.getDate(7));
                objAlumno.setFechaRegistro(rs.getDate(8));
                objAlumno.setFechaActualizacion(rs.getDate(9));
                objAlumno.setEstado(rs.getInt(10));


                objPais = new Pais();
                objPais.setIdPais(rs.getInt(11));
                objPais.setNombre(rs.getString(12));
                objAlumno.setPais(objPais);

                lstSalida.add(objAlumno);
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
	public int actualizaAlumno(Alumno obj) {

		Connection conn = null;
        PreparedStatement pstm = null;
        int salida = -1;
        try {
            conn = MySqlDBConexion.getConexion();

            String sql = "update alumno set nombres = ?, apellidos = ?,telefono = ?, dni = ?, correo = ?,"
                    + " fechaNacimiento = ?, estado = ?, idPais = ? where idAlumno = ?";
            pstm = conn.prepareStatement(sql);
            pstm.setString(1, obj.getNombres());
            pstm.setString(2, obj.getApellidos());
            pstm.setString(3, obj.getTelefono());
            pstm.setString(4, obj.getDni());
            pstm.setString(5, obj.getCorreo());
            pstm.setDate(6, obj.getFechaNacimiento());
            pstm.setInt(7, obj.getEstado());
            pstm.setInt(8, obj.getPais().getIdPais());
            pstm.setInt(9, obj.getIdAlumno());

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
	public int eliminaAlumno(int idAlumno) {

		Connection conn = null;
        PreparedStatement pstm = null;
        int salida = -1;
        try {
          
            conn = MySqlDBConexion.getConexion();

          
            String sql = "delete from alumno where idAlumno = ? ";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, idAlumno);
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
	public Alumno buscaAlumno(int idAlumno) {
		
		Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Alumno objSalida = null;
        try {
           
            conn = MySqlDBConexion.getConexion();

            
            String sql = "SELECT a.*, p.nombre FROM alumno a inner join "
                    + " pais p on p.idPais = p.idPais where "
                    + "    a.idAlumno = ? ";
            pstm = conn.prepareStatement(sql);
            pstm.setInt(1, idAlumno);

            System.out.println("SQL => " + pstm);

            
            rs =  pstm.executeQuery();
            Pais objPais;
            if(rs.next()) {
            	objSalida = new Alumno();
                objSalida.setIdAlumno(rs.getInt(1));
                objSalida.setNombres(rs.getString(2));
                objSalida.setApellidos(rs.getString(3));
                objSalida.setTelefono(rs.getString(4));
                objSalida.setDni(rs.getString(5));
                objSalida.setCorreo(rs.getString(6));
                objSalida.setFechaNacimiento(rs.getDate(7));
                objSalida.setFechaRegistro(rs.getDate(8));
                objSalida.setFechaActualizacion(rs.getDate(9));
                objSalida.setEstado(rs.getInt(10));
                objPais = new Pais();
                objPais.setIdPais(rs.getInt(11));
                objPais.setNombre(rs.getString(12));
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
	public List<Alumno> listaXNombresIguales(String nombres ) {
		Connection conn = null;
		
		PreparedStatement pstm = null;
		
		ResultSet rs = null;
		
		List<Alumno> lstSalida = new ArrayList<Alumno>();
		
		try {
			
			//1 Se crea la conexion
			conn = MySqlDBConexion.getConexion();
			
			//2 Se prepara el sql
			String sql = "SELECT * FROM alumno where nombres = ? ";
			
			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, nombres);

			System.out.println("SQL => " + pstm);
			
			//3 Se ejcuta el SQL
			rs =  pstm.executeQuery();
			
			Alumno objAlumno;
			while(rs.next()) {
				objAlumno = new Alumno();
				objAlumno.setIdAlumno(rs.getInt(1));
				objAlumno.setNombres(rs.getString(2));

				lstSalida.add(objAlumno);
				
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
	public List<Alumno> listaXApellidosIguales(String apellidos) {
		Connection conn = null;
		
		PreparedStatement pstm = null;
		
		ResultSet rs = null;
		
		List<Alumno> lstSalida = new ArrayList<Alumno>();
		
		try {
			
			//1 Se crea la conexion
			conn = MySqlDBConexion.getConexion();
			
			//2 Se prepara el sql
			String sql = "SELECT * FROM alumno where apellidos = ? ";
			
			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, apellidos);

			System.out.println("SQL => " + pstm);
			
			//3 Se ejcuta el SQL
			rs =  pstm.executeQuery();
			
			Alumno objAlumno;
			while(rs.next()) {
				objAlumno = new Alumno();
				objAlumno.setIdAlumno(rs.getInt(1));
				objAlumno.setApellidos(rs.getString(2));

				lstSalida.add(objAlumno);
				
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
	public List<Alumno> listaXTelefonoIguales(String telefono) {
		Connection conn = null;
		
		PreparedStatement pstm = null;
		
		ResultSet rs = null;
		
		List<Alumno> lstSalida = new ArrayList<Alumno>();
		
		try {
			
			//1 Se crea la conexion
			conn = MySqlDBConexion.getConexion();
			
			//2 Se prepara el sql
			String sql = "SELECT * FROM alumno where telefono = ? ";
			
			pstm = conn.prepareStatement(sql);
			
			pstm.setString(1, telefono);

			System.out.println("SQL => " + pstm);
			
			//3 Se ejcuta el SQL
			rs =  pstm.executeQuery();
			
			Alumno objAlumno;
			while(rs.next()) {
				objAlumno = new Alumno();
				objAlumno.setIdAlumno(rs.getInt(1));
				objAlumno.setTelefono(rs.getString(2));

				lstSalida.add(objAlumno);
				
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
	public List<Alumno> listaXDNIIguales(String dni) {
		Connection conn = null;
		
		PreparedStatement pstm = null;
		
		ResultSet rs = null;
		
		List<Alumno> lstSalida = new ArrayList<Alumno>();
		
		try {
			
			//1 Se crea la conexion
			conn = MySqlDBConexion.getConexion();
			
			//2 Se prepara el sql
			String sql = "SELECT * FROM alumno where dni = ? ";
			
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, dni);

			System.out.println("SQL => " + pstm);
			
			//3 Se ejcuta el SQL
			rs =  pstm.executeQuery();
			
			Alumno objAlumno;
			while(rs.next()) {
				objAlumno = new Alumno();
				objAlumno.setIdAlumno(rs.getInt(1));
				objAlumno.setDni(rs.getString(2));

				lstSalida.add(objAlumno);
				
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
