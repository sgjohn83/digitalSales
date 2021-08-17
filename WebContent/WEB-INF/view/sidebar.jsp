
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
	<!-- Brand Logo -->
	<a href="static/index3.html" class="brand-link"> <img
		src="static/dist/img/AdminLTELogo.png" alt="AdminLTE Logo"
		class="brand-image img-circle elevation-3" style="opacity: .8">
		<span class="brand-text font-weight-light">Digital CellCare</span>
	</a>

	<!-- Sidebar -->
	<div class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex">

			<div class="info">
				<a href="static/#" class="d-block">${CUSER}</a>
			</div>
		</div>

		<!-- SidebarSearch Form -->
		<div class="form-inline">
			<div class="input-group" data-widget="sidebar-search">
				<input class="form-control form-control-sidebar" type="search"
					placeholder="Search" aria-label="Search">
				<div class="input-group-append">
					<button class="btn btn-sidebar">
						<i class="fas fa-search fa-fw"></i>
					</button>
				</div>
			</div>
		</div>

		<!-- Sidebar Menu -->
		<nav class="mt-2">
			<ul class="nav nav-pills nav-sidebar flex-column"
				data-widget="treeview" role="menu" data-accordion="false">
				<!--  Users Menu -->
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon far fa-user"></i>
						<p>
							Users <i class="fas fa-angle-left right"></i>
						</p>
				</a> <!--  Users sub Menu -->
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="#" class="nav-link"
							id="addusers"> <i class="fas fa-plus nav-icon"></i>
								<p>Add Users</p>
						</a></li>

						<li class="nav-item"><a href="#" class="nav-link"
							id="removeusers"> <i class="fas fa-user-slash nav-icon"></i>
								<p>Remove Users</p>
						</a></li>
						<li class="nav-item" id="userstatus"><a href="#"
							class="nav-link"> <i class="fas fa-user-lock nav-icon"></i>
								<p>Change Status</p>
						</a></li>

						<li class="nav-item" id="changepwd"><a href="#"
							class="nav-link"> <i class="fa fa-key nav-icon"></i>
								<p>Change Password</p>
						</a></li>



						<li class="nav-item" id="resetpwd"><a href="#"
							class="nav-link"> <i class="fa fa-key nav-icon"></i>
								<p>Reset Password</p>
						</a></li>
					</ul> <!--  Users sub Menu --></li>
				<!--end   Users Menu -->

				<!--  Customers Menu -->
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon far fa-user"></i>
						<p>
							Customers <i class="fas fa-angle-left right"></i>
						</p>
				</a> <!--  Customers sub Menu -->
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="#" class="nav-link"
							id="addcustomers"> <i class="fas fa-plus nav-icon"></i>
								<p>Add Customers</p>
						</a></li>

						<li class="nav-item"><a href="#" class="nav-link"
							id="managecustomers"> <i class="fa fa-users nav-icon"></i>
								<p>Manage Customers</p>
						</a></li>




					</ul> <!--  Customers sub Menu --></li>
				<!--end  Customers Menu -->





				<!--  Suppliers Menu -->
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="nav-icon far fa-user"></i>
						<p>
							Suppliers <i class="fas fa-angle-left right"></i>
						</p>
				</a> <!--  Suppliers sub Menu -->
					<ul class="nav nav-treeview">
						<li class="nav-item"><a href="#" class="nav-link"
							id="addsuppliers"> <i class="fas fa-plus nav-icon"></i>
								<p>Add Suppliers</p>
						</a></li>

						<li class="nav-item"><a href="#" class="nav-link"
							id="managesuppliers"> <i class="fa fa-users nav-icon"></i>
								<p>Manage Suppliers</p>
						</a></li>




					</ul> <!--  Suppliers sub Menu --></li>
				<!--end  Suppliers Menu -->



				<!--  Mobile Inventory Menu -->
				<li class="nav-item"><a href="#" class="nav-link"> <i
						class="fas fa-warehouse nav-icon"></i>
						<p>
							Mobile Stock <i class="fas fa-angle-left right"></i>
						</p>
				</a> <!--  Mobile sub Menu -->



					<ul class="nav nav-treeview">
						<!--  Mobile 2nd sub Menu -->
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Mobile Details <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">

								<li class="nav-item"><a href="#" class="nav-link"
									id="addbrand"> <i class="fas fa-copyright nav-icon"></i>
										<p>Add Brand</p>
								</a></li>

								<li class="nav-item"><a href="#" class="nav-link"
									id="managebrands"> <i class="fas fa-copyright nav-icon"></i>
										<p>Manage Brands</p>
								</a></li>

								<li class="nav-item"><a href="#" class="nav-link"
									id="addphonemodel"> <i class="fas fa-mobile-alt nav-icon"></i>
										<p>Add Phone Model</p>
								</a></li>
								
									<li class="nav-item"><a href="#" class="nav-link"
									id="managephonemodel"> <i class="fas fa-mobile-alt nav-icon"></i>
										<p>Manage Phone Models</p>
								</a></li>

							</ul></li>
						<!--  Mobile end  2nd sub Menu -->
						
						<!--  Mobile 2nd sub Menu -->
						<li class="nav-item"><a href="#" class="nav-link"> <i
								class="far fa-circle nav-icon"></i>
								<p>
									Mobile Purchases <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">

								<li class="nav-item"><a href="#" class="nav-link"
									id="addinvoice"> <i class="fas fa-receipt nav-icon"></i>
										<p>Add Invoice</p>
								</a></li>

								<li class="nav-item"><a href="#" class="nav-link"
									id="manageinvoice"><i class="fas fa-receipt nav-icon"></i>
										<p>Manage Invoice</p>
								</a></li>

							

							</ul></li>
						<!--  Mobile end  2nd sub Menu -->
						
						
						
						
						
						
						
						
					</ul> <!--  Mobile sub Menu --></li>
				<!--end  Mobile Inventory Menu -->








			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>
