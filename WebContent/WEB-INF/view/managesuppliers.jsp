<%@ taglib prefix="c1" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css"
	href="static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="static/css/jquery.dataTables.min.css">



<!-- 

div<style="  display: flex;
  flex-direction: column;
  width:100%"></div>


 -->


<style>
.modal-backdrop.in {
	z-index: auto;
}

.modal-backdrop {
	z-index: auto;
}

.modal-dialog {
	max-width: 500px;
	margin: 1.75rem auto;
}
</style>



<div class="row">
<div class="col-8 offset-2">



	<div id="targetsupplier"></div>
	<div class="card card-primary">

		<div class="card-header">
			<h4>Manage Suppliers</h4>
		</div>
		<div class="card-body">

			<table id="myTable" class="table table-striped">
				<thead>
					<tr>
						<th>Supplier Id</th>
						<th>Supplier Name</th>
						<th>Contact No</th>
						<th>Address</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c1:forEach items="${Suppliers}" var="l" varStatus="status">
						<tr>
							<td><c1:out value="${l.getId()}" /></td>
							<td><c1:out value="${l.getSname()}" /></td>
							<td><c1:out value="${l.getContactno()}" /></td>
							<td><c1:out value="${l.getAddress()}" /></td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Edit">
									<button class="btn btn-primary btn-xs" data-title="Edit"
										data-toggle="modal" data-target="#edit"
										onclick="javascript:getdata('${l.getId()}','${l.getSname()}','${l.getContactno()}','${l.getAddress()}')">
										<i class="fas fa-edit fa-xs"></i>
									</button>
								</p></td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Delete">
									<button value="${l.getId()}"
										class="btn btn-danger btn-xs" data-title="Delete"
										data-toggle="modal" data-target="#delete"
										onclick="javascript:setdelid('${l.getId()}')">
										<i class="far fa-trash-alt fa-xs"></i>
									</button>
								</p></td>

						</tr>
					</c1:forEach>
				</tbody>

			</table>

		</div>
	</div>

</div>
</div>













	<div class="modal fade" id="edit" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-body">

					<div class="card card-info">
						<div class="card-header">
							<h3 class="card-title">Edit Supplier</h3>
						</div>
						<!-- /.card-header -->
						<!-- form start -->
						<form class="form-horizontal" id="updateForm">
							<div class="card-body">
								<div class="form-group row">
									<label for="id" class="col-sm-4 col-form-label">Supplier
										Id</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="id"
											name="id" placeholder="Supplier Id" readonly="true">
									</div>
								</div>
								<div class="form-group row">
									<label for="sname" class="col-sm-4 col-form-label">Supplier
										Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="sname"
											name="sname" placeholder="Supplier Name">
									</div>
								</div>
								<div class="form-group row">
									<label for="contactno" class="col-sm-4 col-form-label">Contact No</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="contactno"
											name="contactno" placeholder="contactno">
									</div>
								</div>
							

								<div class="form-group row">
									<label for="address" class="col-sm-4 col-form-label">Address
										</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="address"
											name="address" placeholder="address">
									</div>

								</div>
							

							</div>
							<!-- /.card-body -->
							<div class="card-footer">
								<button type="submit" class="btn btn-info" data-dismiss="modal"
									onclick="javascript:updatesupplier()">Update Supplier</button>
								<button type="button" class="btn btn-default float-right"
									data-dismiss="modal">
									<span class="glyphicon glyphicon-remove"></span> Cancel
								</button>
							</div>
							<!-- /.card-footer -->
						</form>
					</div>







				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>

	</div>

	<div class="modal fade" id="delete" tabindex="-1" role="dialog"
		aria-labelledby="edit" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					</button>
					<h4 class="modal-title custom_align" id="Heading">Delete this
						entry</h4>
				</div>
				<div class="modal-body">

					<div class="alert alert-danger">
						<span class="glyphicon glyphicon-warning-sign"></span> Are you
						sure you want to delete this Record?
					</div>

				</div>
				<div class="modal-footer ">
					<button type="button" class="btn btn-success" data-dismiss="modal"
						onclick="javascript:deletesupplier()">
						<span class="glyphicon glyphicon-ok-sign"></span> Yes
					</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> No
					</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<input type="hidden" id="del2" />
	<script type="text/javascript" language="javascript"
		src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript" language="javascript"
		src="static/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" language="javascript"
		src="static/js/bootstrap.min.js"></script>

	<script>
		$(document).ready(function()

		{

			$('#myTable').DataTable();
			$("[data-toggle=tooltip]").tooltip();

		});

		function updatesupplier() {
			var form = $('#updateForm')

			data = form.serialize()
			$.ajax({

				type : "POST",
				url : "updatesuppliers",
				data : data,
				success : function(data) {

					$('#targetsupplier').fadeIn().html(
							"<div  class='alert alert-success' role='alert '><h2 class='text-center'>"
									+ data + "</h2></div>");
					setTimeout(function() {
						$('#targetsupplier').fadeOut("slow");
					}, 2000);
				}

			})
		}

		function getdata(id,sname,contactno,address) {

			$('#id').val(id)
			$('#sname').val(sname)
			$('#contactno').val(contactno)
			$('#address').val(address)
		

		}
		function setdelid(s) {
			$("#del2").val(s)
		}
		function deletesupplier() {

			$.ajax({

				type : "GET",
				url : "deletesupplier?SupId=" + $("#del2").val(),
				success : function(data) {

					$('#targetsupplier').fadeIn().html(
							"<div  class='alert alert-success' role='alert '><h2 class='text-center'>"
									+ data + "</h2></div>");
					setTimeout(function() {
						$('#targetsupplier').fadeOut("slow");
					}, 2000);

				}

			})

		}
	</script>