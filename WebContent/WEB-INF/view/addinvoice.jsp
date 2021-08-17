<link rel="stylesheet" type="text/css" href="static/css/jquery.datetimepicker.css"/ >

<div class="row">
<div class="col-6">

          <div class="card card-primary">
          
            <div class="card-body">
              
           
              <div class="form-group">
                <label for="inputStatus">Select Supplier</label>
                <select id="inputStatus" class="form-control custom-select">
                  <option disabled="">Select one</option>
                  <option>On Hold</option>-
                  <option>Canceled</option>
                  <option selected="">Success</option>
                </select>
              </div>
            
            
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>
        
        
        <div class="col-6">

          <div class="card card-primary">
          
            <div class="card-body">
              
           
              <div class="form-group">
                <label for="inputStatus">Purchase Date</label>
               <input name="pdate" id="datetimepicker" type="text" class="form-control">
              </div>
            
            
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
        </div>

</div>
<script src="static/js/jquery.datetimepicker.full.min.js"></script>
<script>
jQuery('#datetimepicker').datetimepicker();
</script>