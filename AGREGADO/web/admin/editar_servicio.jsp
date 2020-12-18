<%@page import="modelo.DAO.AdminServiceDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.servicio"%>
<%@page import="modelo.categoria"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ include file='head.jsp'%>
<div class="content">

	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-header">
					<h4>ADMINISTRAR SERVICIOS</h4>
				</div>
				<div class="card-body">

					<div class="row">

						<%
							AdminServiceDAO dao = new AdminServiceDAO();
						int id = Integer.parseInt((String) request.getAttribute("idper"));
						servicio p = (servicio) dao.list(id);
						%>



						<div class="full-vt">
							<button class="boton-cerrar fa fa-times btn btn-default"></button>
							<div class="admin-editor">
								<div class="card-body card-block">
									<form action="./ControllerServiceAdmin" method="GET"
										enctype="multipart/form-data" class="form-horizontal">
										<h4>INGRESE DATOS DEL NUEVO SERVICIO</h4>
										<br>

										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class=" form-control-label">ID</label>
											</div>
											<div class="col-12 col-md-9">
												<input type="text" id="text-input" name="id" placeholder=""
													class="form-control" value="<%=p.getId()%>">
											</div>
										</div>

										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class=" form-control-label">NOMBRE</label>
											</div>
											<div class="col-12 col-md-9">
												<input type="text" id="text-input" name="nombre"
													placeholder="" class="form-control"
													value="<%=p.getNombre()%>">
											</div>
										</div>

										<div class="row form-group">
											<div class="col col-md-3">
												<label for="email-input" class=" form-control-label">DETALLE</label>
											</div>
											<div class="col-12 col-md-9">
												<input type="text" id="text-input" name="detalle"
													placeholder="" class="form-control"
													value="<%=p.getDetalle()%>">
											</div>
										</div>

										<div class="row form-group">
											<div class="col col-md-3">
												<label for="email-input" class=" form-control-label">ESTADO
													(S/N)</label>
											</div>
											<div class="col-12 col-md-9">
												<input type="text" id="text-input" name="estado"
													placeholder="" class="form-control"
													value="<%=p.getEstado()%>">
											</div>
										</div>

										<div class="row form-group">
											<div class="col col-md-3">
												<label class=" form-control-label">COSTO EN S/.</label>
											</div>
											<div class="col-12 col-md-9 row form-group">
												<div class="col-6">
													<input type="text" placeholder="" name="costo"
														class="form-control" value="<%=p.getCosto()%>">
												</div>
											</div>
										</div>

										<div class="row form-group">
											<div class="col col-md-3">
												<label for="file-input" class=" form-control-label">IMAGEN</label>
											</div>
											<div class="col-12 col-md-9">
												<input type="file" id="file-input" name="imagen"
													class="form-control-file">
											</div>
										</div>

										<div class="row form-group">
											<div class="col col-md-3"></div>
											<div class="col-12 col-md-9">
												<button type="submit" class="btn btn-success" name="accion"
													value="Actualizar">GUARDAR</button>
												<button type="reset" class="btn btn-secondary" name="accion"
													value="Cancelar">CANCELAR</button>
											</div>
										</div>

									</form>
								</div>
							</div>
						</div>


						<!-- lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll -->


					</div>
				</div>



			</div>
		</div>
	</div>
	<!-- /# column -->

</div>
<!-- /# column -->


<%@ include file='footer.jsp'%>

