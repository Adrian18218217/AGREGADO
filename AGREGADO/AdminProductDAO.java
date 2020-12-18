package modelo.DAO;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

import modelo.producto;
import modelo.servicio;

public class AdminProductDAO {
	 conexion cn=new conexion();
	    Connection con;
	    PreparedStatement ps;
	    ResultSet rs;
	    producto p=new producto();
	    
	    public List listar() {
	        ArrayList<producto>list=new ArrayList<>();
	        String sql="select * from productos";
	        try {
	            con=(Connection) cn.getConnection();
	            ps=(PreparedStatement) con.prepareStatement(sql);
	            rs=ps.executeQuery();
	            while(rs.next()){
	                producto per=new producto();
	                per.setCodigo(rs.getInt("codigo"));
	                per.setNombre(rs.getString("nombre"));
	                per.setCosto(rs.getFloat("costo"));
	                per.setPrecio(rs.getFloat("precio"));
	                per.setDetalle(rs.getString("detalle"));
	                per.setMarca(rs.getString("marca"));
	                per.setFoto(rs.getString("foto"));
	                per.setMedida(rs.getString("medida"));
	                per.setStock(rs.getInt("stock"));
	                per.setFecha_ingreso(rs.getString("fecha_ingreso"));
	                per.setProveedor(rs.getString("proveedor"));
	                per.setCategoria(rs.getInt("categoria"));
	                per.setEstado(rs.getString("estado"));
	                list.add(per);
	            }
	        } catch (Exception e) {
	        }
	        return list;
	    }
	    
	    public boolean add(producto per) {
	        
	        String sql="INSERT INTO `productos` ( `nombre`, `costo`, `precio`, `detalle`, `marca`, `foto`, `medida`, `stock`, `fecha_ingreso`, `proveedor`, `categoria`, `estado`) VALUES ( '"+per.getNombre()+
	        		"', '"+per.getCosto()+"', '"+per.getPrecio()+"', '"+per.getDetalle()+"', '"+per.getMarca()+"', '"+per.getFoto()+"', '"+per.getMedida()+
	        		"', '"+per.getStock()+"', '"+per.getFecha_ingreso()+"', '"+per.getProveedor()+"', '"+per.getCategoria()+"', '"+per.getEstado()+"')";
	        
	         try {
	             con=(Connection) cn.getConnection();
	             ps=(PreparedStatement) con.prepareStatement(sql);
	             ps.executeUpdate();
	         } catch (Exception e) {
	         }
	        return false;
	     }
	    
	    public producto list(int codigo) {
	        String sql="select * from servicios where codigo="+codigo;
	        try {
	            con=(Connection) cn.getConnection();
	            ps=(PreparedStatement) con.prepareStatement(sql);
	            rs=ps.executeQuery();
	            while(rs.next()){                
	                p.setCodigo(rs.getInt("codigo"));
	                p.setNombre(rs.getString("nombre"));
	                p.setCosto(rs.getFloat("costo"));
	                p.setPrecio(rs.getFloat("precio"));
	                p.setDetalle(rs.getString("detalle"));
	                p.setMarca(rs.getString("marca"));
	                p.setFoto(rs.getString("foto"));
	                p.setMedida(rs.getString("medida"));
	                p.setStock(rs.getInt("stock"));
	                p.setFecha_ingreso(rs.getString("fecha_ingreso"));
	                p.setProveedor(rs.getString("proveedor"));
	                p.setCategoria(rs.getInt("categoria"));
	                p.setEstado(rs.getString("estado"));
	                
	            }
	        } catch (Exception e) {
	        }
	        return p;
	    }

	

	    public boolean edit(producto per) {
	       String sql="update productos set nombre='"+per.getNombre()+"',costo='"+per.getCosto()+
	    		   "', precio='"+per.getPrecio()+"', detalle='"+per.getDetalle()+
	    		   "', marca='"+per.getMarca()+"', foto='"+per.getFoto()+
	    		   "', medida='"+per.getMedida()+"', stock='"+per.getStock()+
	    		   "', fecha_ingreso='"+per.getFecha_ingreso()+"', proveedor='"+per.getProveedor()+
	    		   "', categoria='"+per.getCategoria()+
	    		   "' , estado='"+per.getEstado()+"' where codigo="+per.getCodigo();
	        try {
	            con=(Connection) cn.getConnection();
	           ps=(PreparedStatement) con.prepareStatement(sql);
	            ps.executeUpdate();
	        } catch (Exception e) {
	        }
	        return false;
	    }

	    public boolean eliminar(int id) {
	        String sql="delete from productos where codigo="+id;
	        try {
	            con=(Connection) cn.getConnection();
	            ps=(PreparedStatement) con.prepareStatement(sql);
	            ps.executeUpdate();
	        } catch (Exception e) {
	        }
	        return false;
	    }


}
