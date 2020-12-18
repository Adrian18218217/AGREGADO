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
import modelo.servicio;
import modelo.DAO.AdminServiceDAO;

/**
 * Servlet implementation class ControllerServiceAdmin
 */
@WebServlet(name = "ControllerServiceAdmin", urlPatterns = { "/ControllerServiceAdmin" })
public class ControllerServiceAdmin extends HttpServlet {

	servicio p = new servicio();
	AdminServiceDAO dao = new AdminServiceDAO();
	int id;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String destino = "";
		String action = request.getParameter("accion");

		switch (action) {
		case "Agregar":
			String nombre = request.getParameter("nombre");
			String detalle = request.getParameter("detalle");
			float costo = Float.parseFloat(request.getParameter("costo"));
			String foto = request.getParameter("foto");
			String estado = request.getParameter("estado");
			p.setNombre(nombre);
			p.setDetalle(detalle);
			p.setCosto(costo);
			p.setFoto(foto);
			p.setEstado(estado);
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
			destino="admin/editar_servicio.jsp";
			break;

		case "Actualizar":
			id=Integer.parseInt(request.getParameter("id"));
			String nombre2 = request.getParameter("nombre");
			String detalle2 = request.getParameter("detalle");
			float costo2 = Float.parseFloat(request.getParameter("costo"));
			String foto2 = request.getParameter("foto");
			String estado2 = request.getParameter("estado");
			p.setId(id);
			p.setNombre(nombre2);
			p.setDetalle(detalle2);
			p.setCosto(costo2);
			p.setFoto(foto2);
			p.setEstado(estado2);
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
