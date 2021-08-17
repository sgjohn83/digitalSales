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


<div  id="targetbrand"></div>


<div class="card card-primary">


	<div class="card-header">
		<h4>Add Brands</h4>
	</div>

	<form id="form1" method="post" action="javascript:addbrands()">
		<div class="card-body">
			<div class="form-group">
				<div class="width30 floatL">
					<label>Brand Name</label>
				</div>
				<div class="width70 floatR">
					<input  class="width100 form-control"
						name="brandname" type="text" value="" size="20" required="required">
				</div>
				<br> <br><br>
				
				<br><br>
			
			
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

function addbrands()
{
	
	var form = $('#form1')
	
	data = form.serialize()
	$.ajax({
		
		 type: "POST",
	     url: "addingbrands",
	     data: data,
	     success: function(data){
	    	 
	    	 $('#targetbrand').fadeIn().html("<div  class='alert alert-success' role='alert '><h2 class='text-center'>"+data+"</h2></div>");
	    	 setTimeout(function() {
					$('#targetbrand').fadeOut("slow");
				}, 2000 );
	     }
		
	})
}
</script>

	
