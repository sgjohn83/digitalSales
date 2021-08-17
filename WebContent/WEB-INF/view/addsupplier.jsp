<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.width30 {
	width: 30%;
}

.width70 {
	width: 70%;
}

.floatL {
	float: left;
}

.width50 {
	width: 50%;
}

.floatR {
	float: right;
}

.btn {
	width: 100%;
	border-radius: 0px;
}

.width100 {
	width: 100%;
}

.row {
	margin-left: -20px;
	margin-right: -20px;
}

.boxStyle {
	padding: 20px;
	border-radius: 25px;
	border-top: 6px solid #dc3545;
	border-bottom: 6px solid #28a745;
}
</style>


<div class="row">
<div class="col-6 offset-3">

<div  id="targetsupplier"></div>


<div class="card card-primary">


	<div class="card-header">
		<h4>Add Suppliers</h4>
	</div>

	<form id="form1" method="post" action="javascript:addsuppliers()">
		<div class="card-body">
			<div class="form-group">
				<div class="width30 floatL">
					<label>Supplier Name</label>
				</div>
				<div class="width70 floatR">
					<input  class="width100 form-control"
						name="sname" type="text" value="" size="20" required="required">
				</div>
				<br> <br><br>
				<div class="form-group">
					<div class="width30 floatL">
						<label>Contact No</label>
					</div>
					<div class="width70 floatR">
						<input class="width100 form-control" name="contactno" type="text"
							value="" size="20" required="required">
					</div>
				</div>
				<br><br>
				<div class="form-group">
					<div class="width30 floatL">
						<label>Address</label>
					</div>
					<div class="width70 floatR">
						<input class="width100 form-control" name="address" src=""
							type="text" value="" size="20">
					</div>
				</div>
		
			
			
		

				
				
				<br> <br> <br>



				<div class="row">
					<div class="col-6 offset-4">
						<input class="btn btn-success" type="submit" value="Submit"
							style="font-weight: bold">
					</div>
				</div>

			</div>




		</div>

	</form>
</div>
</div>
</div>


<script>

function addsuppliers()
{
	
	var form = $('#form1')
	
	data = form.serialize()
	$.ajax({
		
		 type: "POST",
	     url: "addingsuppliers",
	     data: data,
	     success: function(data){
	    	 
	    	 $('#targetsupplier').fadeIn().html("<div  class='alert alert-success' role='alert '><h2 class='text-center'>"+data+"</h2></div>");
	    	 setTimeout(function() {
					$('#targetsupplier').fadeOut("slow");
				}, 2000 );
	     }
		
	})
}
</script>

	
