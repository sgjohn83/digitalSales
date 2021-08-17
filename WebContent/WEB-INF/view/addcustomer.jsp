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

<div  id="targetcustomer"></div>


<div class="card card-primary">


	<div class="card-header">
		<h4>Add Customers</h4>
	</div>

	<form id="form1" method="post" action="javascript:addcustomers2()">
		<div class="card-body">
			<div class="form-group">
				<div class="width30 floatL">
					<label>Firstname</label>
				</div>
				<div class="width70 floatR">
					<input  class="width100 form-control"
						name="firstName" type="text" value="" size="20" required="required">
				</div>
				<br> <br>
				<div class="form-group">
					<div class="width30 floatL">
						<label>Lastname</label>
					</div>
					<div class="width70 floatR">
						<input class="width100 form-control" name="lastName" type="text"
							value="" size="20" required="required">
					</div>
				</div>
				<br>
				<div class="form-group">
					<div class="width30 floatL">
						<label>Email</label>
					</div>
					<div class="width70 floatR">
						<input class="width100 form-control" name="emailId" src=""
							type="text" value="" size="20">
					</div>
				</div>
				<br>
				<div class="form-group">
					<div class="width30 floatL">
						<label>Mobile No</label>
					</div>
					<div class="width70 floatR">
						<input class="width100 form-control" name="contactNo" type="text"
							value="" size="20">
					</div>
				</div>
				<br>
				<div class="form-group">
					<div class="width30 floatL">
						<label>Address</label>
					</div>
					<div class="width70 floatR">
						<input class="width100 form-control" name="address" type="text"
							value="" size="20">
					</div>
				</div>
				<br>

				<div class="width30 floatL">
					<label>Gender</label>
				</div>
				<div class="width70 floatR">
					<div class="form-group">
						<input name="gender" value="Male" type="radio"> <label
							for="customRadio"> Male</label> <input name="gender"
							value="Female" type="radio"> <label for="customRadio">Female</label>
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

	
