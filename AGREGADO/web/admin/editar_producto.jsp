<%@page import="modelo.DAO.AdminProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.servicio"%>
<%@page import="modelo.producto"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ include file='head.jsp'%>
<div class="content">

	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-header">
					<h4>ADMINISTRAR PRODUCTOS</h4>
				</div>
				<div class="card-body">

					<div class="row">

						<%
							AdminProductDAO dao = new AdminProductDAO();
						int id = Integer.parseInt((String) request.getAttribute("idper"));
						producto p = (producto) dao.list(id);
						%>



						<div class="full-vt">
							<button class="boton-cerrar fa fa-times btn btn-default"></button>
							<div class="admin-editor">
								<div class="card-body card-block">
									<form action="./ControllerProductoAdmin" method="GET"
										enctype="multipart/form-data" class="form-horizontal">
										<h4>INGRESE DATOS DEL NUEVO SERVICIO</h4>
										<br>

										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class=" form-control-label">ID</label>
											</div>
											<div class="col-12 col-md-9">
												<input type="text" id="text-input" name="codigo" placeholder=""
													class="form-control" value="<%=p.getCodigo()%>">
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
												<label for="text-input" class=" form-control-label">COSTO</label>
											</div>
											<div class="col-12 col-md-9">
												<input type="text" id="text-input" name="costo"
													placeholder="" class="form-control"
													value="<%=p.getCosto()%>">
											</div>
										</div>
										
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="text-input" class=" form-control-label">PRECIO</label>
											</div>
											<div class="col-12 col-md-9">
												<input type="text" id="text-input" name="precio"
													placeholder="" class="form-control"
													value="<%=p.getPrecio()%>">
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
												<label for="email-input" class=" form-control-label">MARCA</label>
											</div>
											<div class="col-12 col-md-9">
												<input type="text" id="text-input" name="marca"
													placeholder="" class="form-control"
													value="<%=p.getMarca()%>">
											</div>
										</div>
										
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="file-input" class=" form-control-label">IMAGEN</label>
											</div>
											<div class="col-12 col-md-9">
												<input type="file" id="file-input" name="foto"
													class="form-control-file">
											</div>
										</div>

										<div class="row form-group">
											<div class="col col-md-3">
												<label for="email-input" class=" form-control-label">MEDIDA</label>
											</div>
											<div class="col-12 col-md-9">
												<input type="text" id="text-input" name="estado"
													placeholder="" class="form-control"
													value="<%=p.getMedida()%>">
											</div>
										</div>

										<div class="row form-group">
											<div class="col col-md-3">
												<label class=" form-control-label">STOCK</label>
											</div>
											<div class="col-12 col-md-9 row form-group">
												<div class="col-6">
													<input type="text" placeholder="" name="stock"
														class="form-control" value="<%=p.getStock()%>">
												</div>
											</div>
										</div>

										<div class="row form-group">
											<div class="col col-md-3">
												<label for="email-input" class=" form-control-label">FECHA DE INGRESO</label>
											</div>
											<div class="col-12 col-md-9">
												<input type="text" id="text-input" name="fecha_ingreso"
													placeholder="" class="form-control"
													value="<%=p.getFecha_ingreso()%>">
											</div>
										</div>
										
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="email-input" class=" form-control-label">PROVEEDOR</label>
											</div>
											<div class="col-12 col-md-9">
												<input type="text" id="text-input" name="proveedor"
													placeholder="" class="form-control"
													value="<%=p.getProveedor()%>">
											</div>
										</div>
										
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="email-input" class=" form-control-label">CATEGORIA</label>
											</div>
											<div class="col-12 col-md-9">
												<input type="text" id="text-input" name="categoria"
													placeholder="" class="form-control"
													value="<%=p.getCategoria()%>">
											</div>
										</div>
										<div class="row form-group">
											<div class="col col-md-3">
												<label for="email-input" class=" form-control-label">ESTADO</label>
											</div>
											<div class="col-12 col-md-9">
												<input type="text" id="text-input" name="estado"
													placeholder="" class="form-control"
													value="<%=p.getEstado()%>">
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

