<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">

<div class="col-6 offset-3">

<form method="post" action="deleteuser">

<div class="card card-primary">
              <div class="card-header">
                <h3 class="card-title">Remove Users</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
           
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th style="width: 10px">#</th>
                      <th>User Name</th>
                      <th>Delete</th>
                           </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${Users}" var="l" varStatus="status">
                    <tr>
                      <td>${status.index+1}</td>                    
                      <td><c:out value="${l.getUsername()}"/></td>
                      <td>
                    <div class="custom-control custom-checkbox">
                          <input class="custom-control-input" type="checkbox" name="username" id="del${l.getUsername()}" value="${l.getUsername()}">
                          <label for="del${l.getUsername()}" class="custom-control-label"></label>
                        </div>
                      </td>
                   
                    </tr>
                     </c:forEach>
                   
                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              <div class="col-3 offset-8 card-footer clearfix">
              <button type="submit" class="btn btn-block btn-primary">Delete</button>
             
              </div>
              
            </div>
           
             </form>
             </div>
</div>
             