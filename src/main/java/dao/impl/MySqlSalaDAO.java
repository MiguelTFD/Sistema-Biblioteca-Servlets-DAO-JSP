package dao.impl;

import dao.SalaDAO;
import entity.Sala;
import entity.Sede;
import util.MySqlDBConexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MySqlSalaDAO implements SalaDAO {

    @Override
    public int insertarSala(Sala obj) {

        //Preparamos la conexion
        Connection conn = null;
        PreparedStatement pstm = null;

        int salida = -1;

        try {
            conn = MySqlDBConexion.getConexion();
            String query = "INSERT INTO sala VALUES (null, ?, ?, ?, ?, ?,?, ?,?)";

            //ejecucion
            pstm = conn.prepareStatement(query);

            //parametros
            pstm.setString(1, obj.getNumero());
            pstm.setInt(2, obj.getPiso());
            pstm.setInt(3, obj.getNumAlumnos());
            pstm.setString(4, obj.getRecursos());
            pstm.setTimestamp(5, obj.getFechaRegistro());
            pstm.setInt(6, obj.getEstado());
            pstm.setDate(7, obj.getFechaActualizacion());
            pstm.setInt(8, obj.getSede().getIdSede());

            System.out.println("Query SQl -> " + pstm);

            salida = pstm.executeUpdate();


        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try {
                //cerrando los puertos
                if(pstm != null) pstm.close();

                if(conn != null) conn.close();

            }catch (Exception ex){
                ex.printStackTrace();
            }
        }
        return salida;

    }

    @Override
    public List<Sala> listaSalaCompleja(String numero, int piso,String recursos, int estado, int idSede) {
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        List<Sala> lstSalida = new ArrayList<Sala>();
        try {
            //1 Se crea la conexión
            conn = MySqlDBConexion.getConexion();

            //2 Se prepara el SQL
            String sql = "SELECT s.*,e.nombre FROM sala s INNER JOIN sede e ON e.idSede = s.idSede WHERE s.numero LIKE ? AND (?=-1 or s.piso=?) AND s.recursos LIKE ? AND s.estado = ? AND (?=-1 or s.idSede=?)";

            pstm = conn.prepareStatement(sql);

            pstm.setString(1, numero);
            pstm.setInt(2, piso);
            pstm.setInt(3, piso);
            pstm.setString(4, recursos);
            pstm.setInt(5, estado);
            pstm.setInt(6, idSede);
            pstm.setInt(7, idSede);

            System.out.println("listaSalaCompleja SQL =>" + pstm);

            //3 Se ejecuta el SQL
            rs = pstm.executeQuery();
            Sala objSala ;
            Sede objSede;

            System.out.print(rs);

            while (rs.next()) {

                System.out.print(rs);
                objSala = new Sala();
                objSala.setIdSala(rs.getInt(1));
                objSala.setNumero(rs.getString(2));
                objSala.setPiso(rs.getInt(3));
                objSala.setNumAlumnos(rs.getInt(4));
                objSala.setRecursos(rs.getString(5));
                objSala.setFechaRegistro(rs.getTimestamp(6));
                objSala.setEstado(rs.getInt(7));
                objSala.setFechaActualizacion(rs.getDate(8));

                // Crear un objeto Sede y establecer el nombre de la sede
                objSede = new Sede();
                objSede.setIdSede(rs.getInt(9));
                objSede.setNombre(rs.getString(10));
                objSala.setSede(objSede);

                lstSalida.add(objSala);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstm != null) pstm.close();
                if (conn != null) conn.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        // Imprime los atributos del primer objeto en la lista si la lista no está vacía

        if (!lstSalida.isEmpty()) {

                for (Sala primeraSala : lstSalida) {
                    System.out.println("================listaSalaCompleja===================");
                    System.out.println("Atributos del primer objeto capturado:");
                    System.out.println("ID Sala: " + primeraSala.getIdSala());
                    System.out.println("Número: " + primeraSala.getNumero());
                    System.out.println("Piso: " + primeraSala.getPiso());
                    System.out.println("Número de Alumnos: " + primeraSala.getNumAlumnos());
                    System.out.println("Recursos: " + primeraSala.getRecursos());
                    System.out.println("Fecha de Registro: " + primeraSala.getFechaRegistro());
                    System.out.println("Estado: " + primeraSala.getEstado());
                    System.out.println("Fecha de Actualización: " + primeraSala.getFechaActualizacion());
                    System.out.println("Sede: " + primeraSala.getSede().getNombre());
                    System.out.println("======================================");
            }
        } else {
            System.out.println("No se encontraron salas que coincidan con los criterios de búsqueda.");
        }
        return lstSalida;
    }

    @Override
    public List<Sala> listaPorNumero(String filtro) {

        Connection cn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<Sala> lstSala = new ArrayList<Sala>();
        try{
            //obtener la conexion
            cn= MySqlDBConexion.getConexion();

            //Crear la query
            String sql = "SELECT s.*,e.nombre FROM sala s INNER JOIN sede e ON e.idSede = s.idSede where s.numero like ?";
            //que el preparedsTATEMENT sea de la conexion
            ps = cn.prepareStatement(sql);
            ps.setString(1,filtro);
            System.out.println(" listaPorNumero Query ==> "+ ps);

            //el resultSet sera el la respoesta de preparement Ejecutado (comluna1, columna2, ...)
            rs = ps.executeQuery();
            //Ahora que temos los datos de la consulta en el resultSet estas pasarana a cada objeto de su tipo,
            //vamos a creear los objetos que posseran estos datos
            Sala sala;
            Sede sede;

            while(rs.next()){

                sala = new Sala();
                sala.setIdSala(rs.getInt(1));
                sala.setNumero(rs.getString(2));
                sala.setPiso(rs.getInt(3));
                sala.setNumAlumnos(rs.getInt(4));
                sala.setRecursos(rs.getString(5));
                sala.setFechaRegistro(rs.getTimestamp(6));
                sala.setEstado(rs.getInt(7));
                sala.setFechaActualizacion(rs.getDate(8));

                sede = new Sede();
                sede.setIdSede(rs.getInt(9));
                sede.setNombre(rs.getString(10));
                sala.setSede(sede);

                lstSala.add(sala);
            }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try {
                if (rs != null) {
                    rs.close();
                }
                if(ps != null){
                    ps.close();
                }
                if(cn != null){
                    cn.close();
                }
            }catch(Exception e2){
                e2.printStackTrace();
            }
        }


        // Imprime los atributos del primer objeto en la lista si la lista no está vacía

        if (!lstSala.isEmpty()) {
            for (Sala Sala : lstSala) {
                System.out.println("===================ListaXnumero==============");
                System.out.println("Atributos del primer objeto capturado:");
                System.out.println("ID Sala: " + Sala.getIdSala());
                System.out.println("Número: " + Sala.getNumero());
                System.out.println("Piso: " + Sala.getPiso());
                System.out.println("Número de Alumnos: " + Sala.getNumAlumnos());
                System.out.println("Recursos: " + Sala.getRecursos());
                System.out.println("Fecha de Registro: " + Sala.getFechaRegistro());
                System.out.println("Estado: " + Sala.getEstado());
                System.out.println("Fecha de Actualización: " + Sala.getFechaActualizacion());
                System.out.println("Sede: " + Sala.getSede().getNombre());
                System.out.println("======================================");
            }
        } else {
            System.out.println("No se encontraron salas que coincidan con los criterios de búsqueda.");
        }
    return lstSala;
    }

    @Override
    public int actualizaSala(Sala obj) {
        Connection cn = null;
        PreparedStatement ps = null;

        int out=-1;

        try{
            cn = MySqlDBConexion.getConexion();

            String sql = "UPDATE sala set numero = ?, piso = ?, numAlumnos = ?, recursos = ?, estado=?, idSede=? where idSala = ?";
            ps = cn.prepareStatement(sql); //sqlBox = conexion(query)

            ps.setString(1, obj.getNumero());
            ps.setInt(2, obj.getPiso());
            ps.setInt(3, obj.getNumAlumnos());
            ps.setString(4, obj.getRecursos());
            ps.setInt(5, obj.getEstado());
            ps.setInt(6, obj.getSede().getIdSede());
            ps.setInt(7, obj.getIdSala());

            System.out.println("actualizaSala(Sala obj) SQL =>" + ps);

            //ejecutando la query
            out = ps.executeUpdate();
            System.out.println("salida actualizada = "+out);
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                if(ps != null){
                    ps.close();
                }
            }catch(Exception e2){
                e2.printStackTrace();
            }
        }
    return out;
    }

    @Override
    public int eliminaSala(int idSala) {
        Connection cn = null;
        PreparedStatement ps = null;
        int out = -1;

        try{
            cn = MySqlDBConexion.getConexion();

            //preparar el query
            String sql = "delete from sala where idSala=?";
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idSala);

            System.out.println("eliminaSala(int idSala) SQL===>"+ sql);

            //ejecutar query
            out = ps.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }finally{
            try{
                if(ps != null){
                    ps.close();
                }
                if(cn != null){
                    cn.close();
                }
            }catch(Exception f){
                f.printStackTrace();
            }
        }
        return out;
    }

    @Override
    public Sala buscaSala(int idSala) {
       Connection cn = null;
       PreparedStatement ps = null;
       ResultSet rs = null;
       Sala objSala = null;
       try{
            cn = MySqlDBConexion.getConexion();

            String sql ="SELECT s.*,e.nombre FROM sala s INNER JOIN sede e ON e.idSede = s.idSede WHERE s.idSala = ?";
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idSala);
           System.out.println("buscaSala(int idSala) SQL =>"+ps);

           rs = ps.executeQuery();
           Sede objSede;

           if(rs.next()){
               objSala = new Sala();
               objSala.setIdSala(rs.getInt(1));
               objSala.setNumero(rs.getString(2));
               objSala.setPiso(rs.getInt(3));
               objSala.setNumAlumnos(rs.getInt(4));
               objSala.setRecursos(rs.getString(5));
               objSala.setFechaRegistro(rs.getTimestamp(6));
               objSala.setEstado(rs.getInt(7));
               objSala.setFechaActualizacion(rs.getDate(8));

               // Crear un objeto Sede y establecer el nombre de la sede
               objSede = new Sede();
               objSede.setIdSede(rs.getInt(9));
               objSede.setNombre(rs.getString(10));
               objSala.setSede(objSede);
           }
       }catch(Exception e){
            e.printStackTrace();
        }finally{
           try{
               if(ps != null){
                   ps.close();
               }
               if(cn != null){
                   cn.close();
               }
           }catch(Exception f){
               f.printStackTrace();
           }
       }
       return objSala;
    }

    @Override
    public List<Sala> validacionNumeroSala(String numero) {
        Connection bridge = null;
        PreparedStatement frost = null;
        ResultSet cofre = null;
        List<Sala> anticucho =  new ArrayList<>();

        try{
            bridge = MySqlDBConexion.getConexion();
            String icecube = "select * from sala where numero = ?";
            frost = bridge.prepareStatement(icecube);
            frost.setString(1,numero);
            cofre = frost.executeQuery();
            Sala igloo;
            while(cofre.next()){
                igloo = new Sala();
                igloo.setIdSala(cofre.getInt(1));
                igloo.setNumero(cofre.getString(2));
                anticucho.add(igloo);
            }
        }catch (Exception e) {
            e.printStackTrace();
        }finally {
            try{
               if (cofre != null) {
                   cofre.close();
               }
               if (frost != null) {
                   frost.close();
               }
               if (bridge != null) {
                   bridge.close();
               }
            }catch (Exception error){
                error.printStackTrace();
            }
        }
        return anticucho;
    }
}
