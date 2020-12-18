<%@page import="java.util.ArrayList"%>
<%@page import="modelo.producto"%>
<%@page import="modelo.categoria"%>
<%@ include file='head.jsp'%>
<div class="content">
	<!--  AQUI AGREGO LOS FILTROS -->

    <ul>
        <li>Categoria</li>
            <%
                categoria obcat = new categoria();
                for (categoria elem : obcat.Ver_x_estado()) {
                    out.print(" <ul><a href=?categoria=" + elem.getId() + ">" + elem.getNombre() + "</a></ul>");
                }
            %>
    </ul>
    <ul>
        <li>Marca</li>
            <%    ;
                for (String marca : _producto.lista_Marcas()) {
                    out.print(" <ul><a href=?marca=" + marca + ">" + marca + "</a></ul>");
                }
            %>

    </ul>
	<!-- FILTROSSSS -->
	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-header">
					<h4>Administra Productos, Categiria y Proveedores</h4>
				</div>
				<div class="card-body">

					<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
						<li class="nav-item"><a class="nav-link active show"
							id="pills-home-tab" data-toggle="pill" href="#pills-home"
							role="tab" aria-controls="pills-home" aria-selected="true">PRODUCTOS</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							id="pills-profile-tab" data-toggle="pill" href="#pills-profile"
							role="tab" aria-controls="pills-profile" aria-selected="false">CATEGORIAS</a>
						</li>
						<li class="nav-item"><a class="nav-link"
							id="pills-contact-tab" data-toggle="pill" href="#pills-contact"
							role="tab" aria-controls="pills-contact" aria-selected="false">PROVEEDORES</a>
						</li>
					</ul>
					<div class="tab-content" id="pills-tabContent">
						<div class="tab-pane fade active show" id="pills-home"
							role="tabpanel" aria-labelledby="pills-home-tab">
							<h3>
								<button class="btn btn-secondary">Nuevo</button>
								PRODUCTOS
							</h3>
							<div class="row">

								<div class="col-lg-12">
									<div class="card">
										<div class="card-header">
											<strong class="card-title">Custom Table</strong>
										</div>
										<div class="table-stats order-table ov-h">
											<table class="table ">
												<thead>
													<tr>
														<th class="serial">#</th>
														<th class="avatar">IMAGEN</th>
														<th>CODIGO</th>
														<th>MARCA</th>
														<th>NOMBRE</th>
														<th>STOCK</th>
														<th>ESTADO</th>
														<th>COSTO</th>
														<th>PRECIO</th>
														<th>DETALLE</th>
														<th>FECHA INGRESO</th>
														<th>PROVEEDOR</th>
														<th>CATEGORIA</th>
														<th>ACCIONES</th>
													</tr>
												</thead>
												<tbody>

													<!-- AQUI MODIFICO GAAAAAA -->
													<%
                        producto objPro = new producto();
                        ArrayList<producto> produc = null;
                        if (request.getParameter("categoria") != null) {
                            objPro.setCategoria(Integer.parseInt(request.getParameter("categoria")));
                            produc = objPro.Ver_x_categoria();

                        } else if (request.getParameter("marca") != null) {
                            objPro.setMarca(request.getParameter("marca"));
                            produc = objPro.Ver_x_marca();

                        } else {
                            produc = objPro.Ver_x_estado();
                        }
                        if (produc != null) {
                            for (producto elemen : produc) {
                    %>
													<tr>
														<td class="serial">1.</td>
														<td class="avatar">
															<div class="round-img">
																<a href="#"><img class="rounded-circle"
																	src="<%=elemen.getFoto()%>" alt=""></a>
															</div>
														</td>
														<td><%=elemen.getCodigo()%></td>
														<td><span class="name"><%=elemen.getMarca()%></span></td>
														<td><span class="product"><%=elemen.getNombre()%></span></td>
														<td><span class="count"><%=elemen.getStock()%></span></td>
														<td><span class="badge badge-complete"><%=elemen.getEstado()%></span>
														</td>
														<td><span class="name">S/<%=elemen.getCosto()%></span></td>
														<td><span class="name">S/<%=elemen.getPrecio()%></span></td>
														<td><span class="name">...
														</span></td>
														<td><span class="name"><%=elemen.getFecha_ingreso()%></span></td>
														<td><span class="name"><%=elemen.getProveedor()%></span></td>
														<td><span class="name"><%=elemen.getCategoria()%></span></td>
														<td><a
															href="../ControllerProductoAdmin?accion=Eliminar&id=<%=elemen.getCodigo()%>"><i
																class="fa fa-trash fa-2x" aria-hidden="true"></i></a> <a
															href="../ControllerProductoAdmin?accion=Editar&id=<%=elemen.getCodigo()%>"> <i
															class="fa fa-refresh fa-spin fa-2x fa-fw"></i></a></td>
													</tr>
													 <%
                            }
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
						<div class="tab-pane fade" id="pills-profile" role="tabpanel"
							aria-labelledby="pills-profile-tab">
							<h3>
								<button class="btn btn-secondary">Nueva Categoria</button>
								CATEGORIAS
							</h3>
							<p>LISTA DE CATEGORIAS</p>
						</div>
						<div class="tab-pane fade" id="pills-contact" role="tabpanel"
							aria-labelledby="pills-contact-tab">
							<h3>
								<button class="btn btn-secondary">Nuevo</button>
								PROVEEDORES
							</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Iste nobis, fugit pariatur minima! Dolorum modi pariatur aperiam
								quas odio nulla, illo necessitatibus dolor a.</p>
						</div>
					</div>






				</div>
			</div>
		</div>
		<!-- /# column -->

	</div>
	<!-- /# column -->
</div>


<%@ include file='footer.jsp'%>