package modelo.DAO;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import modelo.servicio;

public class AdminServiceDAO {
	 conexion cn=new conexion();
	    Connection con;
	    PreparedStatement ps;
	    ResultSet rs;
	    servicio p=new servicio();
	    
	    public List listar() {
	        ArrayList<servicio>list=new ArrayList<>();
	        String sql="select * from servicios";
	        try {
	            con=(Connection) cn.getConnection();
	            ps=(PreparedStatement) con.prepareStatement(sql);
	            rs=ps.executeQuery();
	            while(rs.next()){
	                servicio per=new servicio();
	                per.setCosto(rs.getFloat("costo"));
	                per.setDetalle(rs.getString("detalle"));
	                per.setEstado(rs.getString("estado"));
	                per.setFoto(rs.getString("foto"));
	                per.setId(rs.getInt("id"));
	                per.setNombre(rs.getString("nombre"));
	                list.add(per);
	            }
	        } catch (Exception e) {
	        }
	        return list;
	    }
	    
	    public boolean add(servicio per) {
	    	
	        String sql="INSERT INTO servicios(nombre,detalle,costo,foto,estado) VALUES('"+per.getNombre()+"','"+per.getDetalle()+"','"+per.getCosto()
	        +"','"+per.getFoto()+"','"+per.getEstado()+"')";
	         try {
	             con=(Connection) cn.getConnection();
	             ps=(PreparedStatement) con.prepareStatement(sql);
	             ps.executeUpdate();
	         } catch (Exception e) {
	         }
	        return false;
	     }
	    
	    public servicio list(int id) {
	        String sql="select * from servicios where id="+id;
	        try {
	            con=(Connection) cn.getConnection();
	            ps=(PreparedStatement) con.prepareStatement(sql);
	            rs=ps.executeQuery();
	            while(rs.next()){                
	            	p.setCosto(rs.getFloat("costo"));
	                p.setDetalle(rs.getString("detalle"));
	                p.setEstado(rs.getString("estado"));
	                p.setFoto(rs.getString("foto"));
	                p.setId(rs.getInt("id"));
	                p.setNombre(rs.getString("nombre"));
	                
	            }
	        } catch (Exception e) {
	        }
	        return p;
	    }

	

	    public boolean edit(servicio per) {
	       String sql="update servicios set nombre='"+per.getNombre()+"',detalle='"+per.getDetalle()+
	    		   "', costo='"+per.getCosto()+"', foto='"+per.getFoto()+
	    		   "' , estado='"+per.getEstado()+"' where id="+per.getId();
	        try {
	            con=(Connection) cn.getConnection();
	           ps=(PreparedStatement) con.prepareStatement(sql);
	            ps.executeUpdate();
	        } catch (Exception e) {
	        }
	        return false;
	    }

	    public boolean eliminar(int id) {
	        String sql="delete from servicios where id="+id;
	        try {
	            con=(Connection) cn.getConnection();
	            ps=(PreparedStatement) con.prepareStatement(sql);
	            ps.executeUpdate();
	        } catch (Exception e) {
	        }
	        return false;
	    }


}
