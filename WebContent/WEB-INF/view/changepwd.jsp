<style>

.change-password {
    padding: 15%;
    margin-top: -15%;
}
.change-password .card-header {
    padding: 2.8%;
    border: 1px solid #bdbdbd;
}
.change-password .card-body {
    background: #ffffff;
    border: 1px solid #bdbdbd;
    padding: 7%;
    text-align: left;
    font-size: 13px;
    margin-bottom: -78%;
}
.change-password .btn{
    width: 100%;
    margin-top: 5%;
    font-size: 13px;
}
.btnForget{
    background: #c0392b;
    border:none;
}
</style>
<div class="row">
<div class="col-6 offset-3">

<form method="post" action="changePassword">
<div class="change-password">
        <div class="card-header">
            <h2>Change Your Password</h2>
        </div>
        <div class="card-body">
            <div class="form-group">
                <label for="pwd">Current Password</label>
                <input type="password" id="pwd" name="oldpwd" class="form-control">
            </div>
            <div class="form-group">
                <label for="pwd">New Password</label>
                <input type="password" id="pwd" name="newpwd" class="form-control">
                
            </div>
          
            <div class="form-group">
                <input type="submit" class="btn btn-lg btn-primary btn-block btnForget" Value="Change Password">
            </div>
        </div>
    </div>
    </form>
</div>
</div>