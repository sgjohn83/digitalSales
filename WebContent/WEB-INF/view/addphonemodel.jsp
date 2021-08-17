<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row">
<div class="col-6 offset-3">

	<div id="targetmodel"></div>

	<div class="card card-info">
		<div class="card-header">
			<h3 class="card-title">Add New Phone Model</h3>
		</div>
		<!-- /.card-header -->
		<!-- form start -->
		<form method="post" class="form-horizontal" id="form1"
			action="javascript:addmodel()">
			<div class="card-body">
				<div class="form-group row">
					<label for="brandid" class="col-sm-4 col-form-label">Select
						Brand</label>
					<div class="col-sm-8">
						<select class="form-control" name="brandid">
							<option>--Choose Brand---</option>
							<c:forEach items="${brand}" var="b">
								<option value="${b.brandid}">${b.brandname}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label for="modelname" class="col-sm-4 col-form-label">Model
						Name</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="modelname"
							name="modelname" placeholder="Model Name">
					</div>
				</div>

				<div class="form-group row">
					<label for="ram" class="col-sm-4 col-form-label">Select
						RAM Size</label>
					<div class="col-sm-8">
						<select class="form-control" name="ram">
							<option>--Choose RAM Size---</option>
							<option value="1 MB - 256 MB">1 MB  -256 MB</option>
							<option value="512 MB">512 MB</option>
							<option value="1 GB">1 GB</option>
							<option value="2 GB">2 GB</option>
							<option value="3 GB">3 GB</option>
							<option value="4 GB">4 GB</option>
							<option value="6 GB">6 GB</option>
							<option value="8 GB">8 GB</option>
							<option value="12 GB">12 GB</option>
						</select>
					</div>
				</div>
				
				
				<div class="form-group row">
					<label for="storage" class="col-sm-4 col-form-label">Select
						Internal Storage</label>
					<div class="col-sm-8">
						<select class="form-control" name="storage">
							<option>--Choose Storage Size---</option>
							<option value="Less Than 4 GB">Less Than 4 GB</option>
							<option value="8 GB">8 GB</option>
							<option value="16 GB">16 GB</option>
							<option value="32 GB">32 GB</option>
							<option value="64 GB">64 GB</option>
							<option value="128 GB">128 GB</option>
							<option value="More Than 256 GB">More Than 256 GB</option>
						</select>
					</div>
				</div>

			</div>
			<!-- /.card-body -->
			<div class="card-footer">
				<button type="submit" class="btn btn-info">ADD</button>
				<button type="submit" class="btn btn-default float-right">Cancel</button>
			</div>
			<!-- /.card-footer -->
		</form>
	</div>

</div>
</div>
<script>
	function addmodel() {

		var form = $('#form1')

		data = form.serialize()
		$.ajax({

			type : "POST",
			url : "addingmodels",
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
</script>