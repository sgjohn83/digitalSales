<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="row">
<div class="col-6 offset-3">

<form method="post" action="userenabled">
	<div class="card card-primary">
		<div class="card-header">
			<h3 class="card-title">Users Login Control</h3>
		</div>
		<!-- /.card-header -->
		<div class="card-body">

			<table class="table table-bordered">
				<thead>
					<tr>
						<th style="width: 10px">#</th>
						<th>User Name</th>
						<th>Enable</th>
						<th>Disable</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${Users}" var="l" varStatus="status">
						
					<c:choose>
					<c:when test="${l.getEnabled()==1}">
					<c:set var="stat1" scope="session" value="checked"/>
					<c:set var="stat2" scope="session" value=""/>
					</c:when>
					<c:otherwise>
					<c:set var="stat1" scope="session" value=""/>
					<c:set var="stat2" scope="session" value="checked"/>
					</c:otherwise>
					
					</c:choose>
						
						
						<tr>
							<td>${status.index+1}</td>
							<td><c:out value="${l.getUsername()}" /></td>
							
						 	<td>
								<div class="custom-control custom-radio">
									<input class="custom-control-input" type="radio"
										id="enable${l.getUsername()}" name="${l.getUsername()}"
										value="enabled" ${stat1}> <label
										for="enable${l.getUsername()}" class="custom-control-label">Enable</label>
								</div>
							</td>

							
							<td>
								<div class="custom-control custom-radio">
									<input class="custom-control-input" type="radio"
										id="disable${l.getUsername()}" name="${l.getUsername()}"
										value="disabled" ${stat2 }> <label
										for="disable${l.getUsername()}" class="custom-control-label">Disable</label>
								</div>
							</td>


						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
		<!-- /.card-body -->
		<div class="col-6 offset-6 card-footer clearfix">
			<button type="submit" class="btn btn-block btn-primary">Change</button>

		</div>

	</div>
	
</form>
</div>
</div>