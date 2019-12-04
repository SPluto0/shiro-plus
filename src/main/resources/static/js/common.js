$(function(){
    $.get("/user/info",function(result){
        if(result.success && result.data == null){
            swal({
                title:"您的账号已经在别处登录!",
                type:"error"
            }).then(function(){
                location.href="/user/logout.html";
            });
        }
    });
});