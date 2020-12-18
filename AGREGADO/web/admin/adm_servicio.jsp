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

					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade active show" id="pills-home"
							role="tabpanel" aria-labelledby="pills-home-tab">
							<h3>
								<button type="button" class="btn btn-success"
									onclick="mostrar_vt('vtn-personal-nuevo')">Nuevo</button>
								SERVICIO
							</h3>
							<div class="row">

								<div class="col-lg-12">
									<div class="card">
										<div class="card-header">
											<strong class="card-title">Todos los servicios</strong>
										</div>
										<div class="card-body">
											<table class="table table-dark ">
												<thead>
													<tr>
														<th class="serial">#</th>
														<th class="avatar">IMAGEN</th>
														<th>CODIGO</th>
														<th>NOMBRE</th>
														<th>ESTADO</th>
														<th>COSTO</th>
														<th>DETALLE</th>
														<th>ACCIONES</th>
													</tr>
												</thead>
												<tbody>

													<!-- AQUI MODIFICO GAAAAAA -->
													<%
														AdminServiceDAO dao = new AdminServiceDAO();
													List<servicio> list = dao.listar();
													Iterator<servicio> iter = list.iterator();
													servicio per = null;
													while (iter.hasNext()) {
														per = iter.next();
													%>
													<tr>
														<td class="serial">1.</td>
														<td class="avatar">
															<div>
																<a href="#"><img src="<%=per.getFoto()%>" alt=""></a>
															</div>
														</td>




														<td><%=per.getId()%></td>
														<td><span class="product"><%=per.getNombre()%></span></td>
														<td><span class="badge badge-complete"><%=per.getEstado()%></span>
														</td>
														<td><span class="name"><%=per.getCosto()%></span></td>
														<td><span class="name"><%=per.getDetalle()%> </span></td>
														<td><a
															href="../ControllerServiceAdmin?accion=Eliminar&id=<%=per.getId()%>"><i
																class="fa fa-trash fa-2x" aria-hidden="true"></i></a> <a
															href="../ControllerServiceAdmin?accion=Editar&id=<%=per.getId()%>"> <i
															class="fa fa-refresh fa-spin fa-2x fa-fw"></i></a></td>
															
													</tr>
													<%
														}
													%>
													<!-- AQUI MODIFICO GAAAAAA -->

												</tbody>
											</table>
										</div>
										<!-- /.table-stats -->
									</div>
								</div>







							</div>
						</div>

					</div>

					<!-- LAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA -->
					<div class="full-vt" id="vtn-personal-nuevo">
						<button class="boton-cerrar fa fa-times btn btn-default"
							onclick="cerrarr_vt(this)"></button>
						<div class="admin-editor">
							<div class="card-body card-block">
								<form action="../ControllerServiceAdmin" method="GET"
									enctype="multipart/form-data" class="form-horizontal">
									<h4>INGRESE DATOS DEL NUEVO SERVICIO</h4>

									<br>
									<div class="row form-group">
										<div class="col col-md-3">
											<label for="text-input" class=" form-control-label">NOMBRE</label>
										</div>
										<div class="col-12 col-md-9">
											<input type="text" id="text-input" name="nombre"
												placeholder="" class="form-control" required="">
										</div>
									</div>
									
									<div class="row form-group">
										<div class="col col-md-3">
											<label for="text-input" class=" form-control-label">NOMBRE</label>
										</div>
										<div class="col-12 col-md-9">
											<input type="text" id="text-input" name="nombre"
												placeholder="" class="form-control" required="">
										</div>
									</div>

									<div class="row form-group">
										<div class="col col-md-3">
											<label for="email-input" class=" form-control-label">DETALLE</label>
										</div>
										<div class="col-12 col-md-9">
											<input type="text" id="text-input" name="detalle"
												placeholder="" class="form-control" required="">
										</div>
									</div>

									<div class="row form-group">
										<div class="col col-md-3">
											<label for="email-input" class=" form-control-label">ESTADO
												(S/N)</label>
										</div>
										<div class="col-12 col-md-9">
											<input type="text" id="text-input" name="estado"
												placeholder="" class="form-control" required="">
										</div>
									</div>

									<div class="row form-group">
										<div class="col col-md-3">
											<label class=" form-control-label">COSTO EN S/.</label>
										</div>
										<div class="col-12 col-md-9 row form-group">
											<div class="col-6">
												<input type="text" placeholder="" name="costo"
													class="form-control">
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
												value="Agregar">REGISTRAR</button>
											<button type="reset" class="btn btn-secondary" name="accion"
												value="Cancelar">CANCELAR</button>
										</div>
									</div>

								</form>
							</div>
						</div>
					</div>

					<div class="tab-pane fade" id="pills-profile" role="tabpanel"
						aria-labelledby="pills-profile-tab">
						<h3>
							<button class="btn btn-secondary">Nuevo</button>
							CATEGORIAS
						</h3>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
							Iste nobis, fugit pariatur minima! Dolorum modi pariatur aperiam
							quas odio nulla, illo necessitatibus dolor a.</p>
					</div>

					<!-- LOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO -->


					<div class="full-vt" id="actualizar-servicio">
						<button class="boton-cerrar fa fa-times btn btn-default"
							onclick="cerrarr_vt(this)"></button>
						<div class="admin-editor">
							<div class="card-body card-block">
								<form action="../ControllerServiceAdmin" method="GET"
									enctype="multipart/form-data" class="form-horizontal">
									<h4>INGRESE DATOS DEL NUEVO SERVICIO</h4>
									<h4><%=request.getParameter("id")%></h4>
									<br>

									<div class="row form-group">
										<div class="col col-md-3">
											<label for="text-input" class=" form-control-label">NOMBRE</label>
										</div>
										<div class="col-12 col-md-9">
											<input type="text" id="text-input" name="nombre"
												placeholder="" class="form-control" required="">
										</div>
									</div>

									<div class="row form-group">
										<div class="col col-md-3">
											<label for="email-input" class=" form-control-label">DETALLE</label>
										</div>
										<div class="col-12 col-md-9">
											<input type="text" id="text-input" name="detalle"
												placeholder="" class="form-control" required="">
										</div>
									</div>

									<div class="row form-group">
										<div class="col col-md-3">
											<label for="email-input" class=" form-control-label">ESTADO
												(S/N)</label>
										</div>
										<div class="col-12 col-md-9">
											<input type="text" id="text-input" name="estado"
												placeholder="" class="form-control" required="">
										</div>
									</div>

									<div class="row form-group">
										<div class="col col-md-3">
											<label class=" form-control-label">COSTO EN S/.</label>
										</div>
										<div class="col-12 col-md-9 row form-group">
											<div class="col-6">
												<input type="text" placeholder="" name="costo"
													class="form-control">
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
												value="Agregar">REGISTRAR</button>
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
		<!-- /# column -->

	</div>
	<!-- /# column -->
</div>


<%@ include file='footer.jsp'%>