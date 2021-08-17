<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
.navbar-laravel {
	box-shadow: 0 2px 4px rgba(0, 0, 0, .04);
}

.navbar-brand, .nav-link, .my-form, .login-form {
	font-family: Raleway, sans-serif;
}

.my-form {
	padding-top: 1.5rem;
	padding-bottom: 1.5rem;
}

.my-form .row {
	margin-left: 0;
	margin-right: 0;
}

.login-form {
	padding-top: 1.5rem;
	padding-bottom: 1.5rem;
}

.login-form .row {
	margin-left: 0;
	margin-right: 0;
}

.btn-two {
	background: #5863db;
}

/* Button Style 6 (Hover) */
.hover-btn{
    min-height: 20px;
    line-height: 50px;

}

.hover-btn button{
   margin:10px; 
   color:#FFF;
   padding:5px 10px ;
}

.hover-btn button:hover{
    background:#5a5a5a;
}
</style>
<div class="row">
<div class="col-6 offset-3">

<form action="resetpwd2">
<div class="my-form">
<div class="cotainer">
	<div class="row justify-content-center">
		<div class="col-md-8">
			<div class="card card-primary">
				<div class="card-header">Reset Password</div>
				<div class="card-body">
          
					<select class="form-control" name="userid">
					 <option value = "NONE" label = "Select">--Select UserName--</option>
					  <c:forEach var="users" items="${usersData}">
							
							<option value="${users.username}">${users.username}</options>
							  </c:forEach> 
					</select>
           
				</div>
				<div class="card-footer text-center">
					<div class="hover-btn">
						<button class="btn btn-two">Reset</button>
					</div>
				</div>


			</div>
		</div>
	</div>
</div>

</div>
</form>
</div>
</div>