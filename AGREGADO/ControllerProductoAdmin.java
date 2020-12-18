package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modelo.cliente;
import modelo.producto;
import modelo.servicio;
import modelo.DAO.AdminProductDAO;
import modelo.DAO.AdminServiceDAO;

/**
 * Servlet implementation class ControllerServiceAdmin
 */
@WebServlet(name = "ControllerProductoAdmin", urlPatterns = { "/ControllerProductoAdmin" })
public class ControllerProductoAdmin extends HttpServlet {

	producto p = new producto();
	AdminProductDAO dao = new AdminProductDAO();
	int id;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String destino = "";
		String action = request.getParameter("accion");

		switch (action) {
		case "Agregar":
            p.setNombre(request.getParameter("nombre"));
            p.setCosto(Float.parseFloat(request.getParameter("costo")));
            p.setPrecio(Float.parseFloat(request.getParameter("precio")));
            p.setDetalle(request.getParameter("detalle"));
            p.setMarca(request.getParameter("marca"));
            p.setFoto(request.getParameter("foto"));
            p.setMedida(request.getParameter("medida"));
            p.setStock(Integer.parseInt(request.getParameter("stock")));
            p.setFecha_ingreso(request.getParameter("fecha_ingreso"));
            p.setProveedor(request.getParameter("proveedor"));
            p.setCategoria(Integer.parseInt(request.getParameter("categoria")));
            p.setEstado(request.getParameter("estado"));
			dao.add(p);
			destino = "admin";
			break;
		case "Eliminar":
			id=Integer.parseInt(request.getParameter("id"));
			dao.eliminar(id);
			destino="admin";
			break;
		case "Editar":
			request.setAttribute("idper",request.getParameter("id"));
			destino="admin/editar_producto.jsp";
			break;

		case "Actualizar":
			 p.setCodigo(Integer.parseInt(request.getParameter("codigo")));
			  p.setNombre(request.getParameter("nombre"));
	            p.setCosto(Float.parseFloat(request.getParameter("costo")));
	            p.setPrecio(Float.parseFloat(request.getParameter("precio")));
	            p.setDetalle(request.getParameter("detalle"));
	            p.setMarca(request.getParameter("marca"));
	            p.setFoto(request.getParameter("foto"));
	            p.setMedida(request.getParameter("medida"));
	            p.setStock(Integer.parseInt(request.getParameter("stock")));
	            p.setFecha_ingreso(request.getParameter("fecha_ingreso"));
	            p.setProveedor(request.getParameter("proveedor"));
	            p.setCategoria(Integer.parseInt(request.getParameter("categoria")));
	            p.setEstado(request.getParameter("estado"));
            dao.edit(p);
            destino="admin";
			break;

		default:
			destino="admin";
			break;
		}

		RequestDispatcher vista = request.getRequestDispatcher(destino);
		vista.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
