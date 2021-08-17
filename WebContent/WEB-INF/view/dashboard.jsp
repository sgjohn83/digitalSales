<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Digital Cell Care</title>

<!-- Google Font: Source Sans Pro -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="static/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bootstrap 4 -->
<link rel="stylesheet"
	href="static/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="static/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet" href="static/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="static/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="static/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="static/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet"
	href="static/plugins/summernote/summernote-bs4.min.css">




</head>
<body class="sidebar-mini sidebar-collapse">


	







	<div class="wrapper">


		<%@ include file="navbar.jsp"%>
		<%@ include file="sidebar.jsp"%>


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper" style="min-height: 1342.88px;">
			<!-- Content Header (Page header) -->
			<div class="content-header">
				<div class="container-fluid"></div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content-header -->

			<!-- Main content -->
			<div class="content">
				<div class="container-fluid">


					<c:if test="${not empty message}">

						<div class="alert alert-success" role="alert">
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<strong><c:out value="${message}"></c:out></strong> 
   						 
   						 
   				 </div>
					</c:if>
           <div class="row" >
           
					<div class="col-12" id="target" ></div>

           </div>

				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- /.content -->
			
	
		</div>
		
		
		<!-- /.content-wrapper -->
		<%@ include file="footer.jsp"%>
		<script type="text/javascript" language="javascript"
	src="static/js/jquery-3.6.0.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
		
			$('#addusers').click(function(e) {
				e.preventDefault();

				var url = 'adduser'

				$.ajax({
					url : url,
					type : "GET",
					success : function(data) {
						// console.log(data);.
						$('#target').html(data);
					}

				})
			});

			$('#removeusers').click(function(e) {
				e.preventDefault();
				var url = 'removeuser'

				$.ajax({
					url : url,
					type : "GET",
					success : function(data) {
						// console.log(data);.
						$('#target').html(data);
					}

				})

			});
			
			
			$('#userstatus').click(function(e) {
				e.preventDefault();
				var url = 'userstatus'

				$.ajax({
					url : url,
					type : "GET",
					success : function(data) {
						// console.log(data);.
						$('#target').html(data);
					}

				})

			});
			
			
			$('#changepwd').click(function(e) {
				e.preventDefault();
				var url = 'changepwd'

				$.ajax({
					url : url,
					type : "GET",
					success : function(data) {
						// console.log(data);.
						$('#target').html(data);
					}

				})

			});
			
			$('#changepwd2').click(function(e) {
				e.preventDefault();
				var url = 'changepwd'

				$.ajax({
					url : url,
					type : "GET",
					success : function(data) {
						// console.log(data);.
						$('#target').html(data);
					}

				})

			});
			
			
			
			$('#resetpwd').click(function(e) {
				e.preventDefault();
				var url = 'resetpwd'

				$.ajax({
					url : url,
					type : "GET",
					success : function(data) {
						// console.log(data);.
						$('#target').html(data);
					}

				})

			});
			
			
			$('#addcustomers').click(function(e) {
				e.preventDefault();
				var url = 'addcustomer'

				$.ajax({
					url : url,
					type : "GET",
					success : function(data) {
						// console.log(data);.
						$('#target').html(data);
					}

				})

			});			

			$('#managecustomers').click(function(e) {
				e.preventDefault();
				var url = 'managecustomer'

				$.ajax({
					url : url,
					type : "POST",
					success : function(data) {
						// console.log(data);.
						$('#target').html(data);
						
						
					
						
					}

				})

			});
			
		
			
			$('#addsuppliers').click(function(e) {
				e.preventDefault();
				var url = 'addsupplier'

				$.ajax({
					url : url,
					type : "GET",
					success : function(data) {
						// console.log(data);.
						$('#target').html(data);
					}

				})

			});			

			$('#managesuppliers').click(function(e) {
				e.preventDefault();
				var url = 'managesupplier'

				$.ajax({
					url : url,
					type : "POST",
					success : function(data) {
						// console.log(data);.
						$('#target').html(data);
						
						
					
						
					}

				})

			});
			$('#addbrand').click(function(e) {
				e.preventDefault();
				var url = 'addbrand'

				$.ajax({
					url : url,
					type : "GET",
					success : function(data) {
						// console.log(data);.
						$('#target').html(data);
					}

				})

			});	

			$('#managebrands').click(function(e) {
				e.preventDefault();
				var url = 'managebrand'

				$.ajax({
					url : url,
					type : "POST",
					success : function(data) {
						// console.log(data);.
						$('#target').html(data);
						
						
					
						
					}

				})

			});
			$('#addphonemodel').click(function(e) {
				e.preventDefault();
				var url = 'addphonemodel'

				$.ajax({
					url : url,
					type : "GET",
					success : function(data) {
						// console.log(data);.
						$('#target').html(data);
					}

				})

			});	
			

			$('#managephonemodel').click(function(e) {
				e.preventDefault();
				var url = 'managephonemodel'

				$.ajax({
					url : url,
					type : "POST",
					success : function(data) {
						// console.log(data);.
						$('#target').html(data);
						
						
					
						
					}

				})

			});
			
			
			$('#addinvoice').click(function(e) {
				e.preventDefault();
				var url = 'addinvoice'

				$.ajax({
					url : url,
					type : "GET",
					success : function(data) {
						// console.log(data);.
						$('#target').html(data);
					}

				})

			});	

		}

		)

		
		function addcustomers2()
		{
			var form = $('#form1')
			
			data = form.serialize()
			$.ajax({
				
				 type: "POST",
			     url: "addingcustomers",
			     data: data,
			     success: function(data){
			    	 
			    	 $('#targetcustomer').fadeIn().html("<div  class='alert alert-success' role='alert '><h2 class='text-center'>"+data+"</h2></div>");
			    	 setTimeout(function() {
							$('#targetcustomer').fadeOut("slow");
						}, 2000 );
			     }
				
			})
		}
		
		
		
		
		
		window.setTimeout(function() {
			$(".alert").fadeTo(500, 0).slideUp(500, function() {
				$(this).remove();
			});
		}, 2000);
	</script>
		
		
		
		
	