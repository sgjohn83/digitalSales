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



	<div id="targetmodel"></div>
	<div class="card card-primary">

		<div class="card-header">
			<h4>Manage Brands</h4>
		</div>
		<div class="card-body">

			<table id="myTable" class="table table-striped">
				<thead>
					<tr>
						<th>Brand Name</th>
						<th>Model Name</th>
						<th>Ram Size</th>
						<th>Storage</th>
						<th>Edit</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c1:forEach items="${Variants}" var="v" varStatus="status">
						<tr>
							<td><c1:out value="${v.phonemodels.brand.brandname}" /></td>
							<td><c1:out value="${v.phonemodels.modelname}" /></td>
							<td><c1:out value="${v.ram}" /></td>
							<td><c1:out value="${v.storage}" /></td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Edit">
									<button class="btn btn-primary btn-xs" data-title="Edit"
										data-toggle="modal" data-target="#edit"
										onclick="javascript:getdata('${v.varid}')">
										<i class="fas fa-edit fa-xs"></i>
									</button>
								</p></td>
							<td><p data-placement="top" data-toggle="tooltip"
									title="Delete">
									<button value="l.getBrandid()" class="btn btn-danger btn-xs"
										data-title="Delete" data-toggle="modal" data-target="#delete"
										onclick="javascript:setdelid('${v.varid}')">
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
							<h3 class="card-title">Edit Brand</h3>
						</div>
						<!-- /.card-header -->
						<!-- form start -->
						<form class="form-horizontal" id="updateForm">
							<div class="card-body">
								<div class="form-group row">
									<label for="brandname" class="col-sm-4 col-form-label">Brand Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="brandname"
											name="brandname" placeholder="Brand Name" readonly="true">
									</div>
								</div>
								<div class="form-group row">
									<label for="modelname" class="col-sm-4 col-form-label">Brand
										Name</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="modelname"
											name="modelname" placeholder="Model Name">
									</div>
								</div>
									<div class="form-group row">
									<label for="ram" class="col-sm-4 col-form-label">Ram Size</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="ram"
											name="ram" placeholder="Ram Size">
									</div>
								</div>
								
								<div class="form-group row">
									<label for="ram" class="col-sm-4 col-form-label">Storage</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="storage"
											name="storage" placeholder="Storage Size">
									</div>
								</div>

							</div>
							<input type="hidden" id="varid" name="varid" >
							<input type="hidden" id="modelid" name="modelid">
							<input type="hidden" id="brandid" name="brandid">
							<!-- /.card-body -->
							<div class="card-footer">
								<button type="submit" class="btn btn-info" data-dismiss="modal"
									onclick="javascript:updatemodel()">Update Brand</button>
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
						onclick="javascript:deletemodel()">
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

		function updatemodel() {
			var form = $('#updateForm')

			data = form.serialize()
			$.ajax({

				type : "POST",
				url : "updatemodels",
				data : data,
				success : function(data) {

					$('#targetmodel').fadeIn().html(
							"<div  class='alert alert-success' role='alert '><h2 class='text-center'>"
									+ data + "</h2></div>");
					setTimeout(function() {
						$('#targetmodel').fadeOut("slow");
					}, 2000);
				}

			})
		}

		function getdata(varid) {
			var data = eval('(' + '${JsonObj}' + ')');
			$(data).each(function(i, item) {

				for (i = 0; i < item.variantsJ.length; i++) {
					if (item.variantsJ[i].varid == varid) {
                      $('#brandname').val(item.variantsJ[i].phonemodels.brand.brandname)
                      $('#modelname').val(item.variantsJ[i].phonemodels.modelname)
                      $('#ram').val(item.variantsJ[i].ram)
                      $('#storage').val(item.variantsJ[i].storage)
                      $('#varid').val(item.variantsJ[i].varid)
                      $('#modelid').val(item.variantsJ[i].phonemodels.modelid)
                      $('#brandid').val(item.variantsJ[i].phonemodels.brand.brandid)
					}
					
				}

			})
		}
		function setdelid(s) {
			$("#del2").val(s)
		}
		function deletemodel() {

			$.ajax({

				type : "GET",
				url : "deletemodel?VarId=" + $("#del2").val(),
				success : function(data) {

					$('#targetmodel').fadeIn().html(
							"<div  class='alert alert-success' role='alert '><h2 class='text-center'>"
									+ data + "</h2></div>");
					setTimeout(function() {
						$('#targetmodel').fadeOut("slow");
					}, 2000);

				}

			})

		}
	</script>