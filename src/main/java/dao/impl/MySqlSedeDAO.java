package dao.impl;

import dao.SedeDAO;
import entity.Sede;
import util.MySqlDBConexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MySqlSedeDAO implements SedeDAO {


    @Override
    public List<Sede> lista() {
        List<Sede> salida = new ArrayList<Sede>();
        Connection conn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;

        try {

            conn = MySqlDBConexion.getConexion();
            String sql = "select * from sede";
            pstm = conn.prepareStatement(sql);
            System.out.println("sql ==>"+pstm+"\n");
            rs = pstm.executeQuery();

            Sede obj =null;

            while (rs.next()) {
                obj = new Sede();
                obj.setIdSede(rs.getInt(1));
                obj.setNombre(rs.getString(2));
                salida.add(obj);
            }


        }catch (Exception ex){
            ex.printStackTrace();
        }finally {
            try {
                if (pstm != null) {pstm.close();}
                if (conn != null) {conn.close();}
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return salida;
    }
}
