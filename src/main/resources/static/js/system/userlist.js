//下拉框改变显示条数
function selectSize(){
	var pageSize = $(".pageSize option:selected").val();
	location.href="/system/userlist.html?pageSize="+pageSize;
}

//输入框改变页码
function changePage(event){
	var pageNum = $(event).val();
	var pageSize = $(".pageSize option:selected").val();
	location.href="/system/userlist.html?pageNum="+pageNum+"&&pageSize="+pageSize;
}

function deluser(userId){
	swal({
        title: '确定?',
        text: '您将无法恢复该用户!',
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: '确定',
        cancelButtonText: '取消',
	}).then(function(isConfirm) {
        if (isConfirm.value) {
            $.get("/system/delUser/",{"userId":userId},function (data) {
                if(data>0){
                    $("#"+userId).remove();
                    swal('已删除!','该用户已删除','success');
                }
            });
        }
    });
}
//确认给该角色分配权限
function allotRole(){
    //取到selectedList中的值
    var roleIds = [];
    $("select[name=doublebox_helper2] option").each(function(k,v){
        roleIds.push(v.value);
    });

    var userId = $("input[name='userId']").val();
    $.ajax({
        url:"/system/user/allotRole/"+userId,
        type : 'POST',
        dataType: 'json',
        contentType: "application/json",
        data : JSON.stringify(roleIds),
        success:function(data){
            if(data>0){
                //清除上次数据
                $(".rlSelect").html('');
                $("#allotPermission").modal('hide');
                swal('操作提示!','已给该角色重新分配权限','success');
            }else {
                $(".rlSelect").html('');
                $("#allotPermission").modal('hide');
                swal('操作提示!','权限分配异常','error');
            }
        },error:function(){

        }
    });
}

//分配权限时，请求的权限数据
function allotPermission(event,userId){
    var rname = $(event).parents('tr').find('.roleName').text();
    var selectedList;
    var nonSelectedList;
    $.ajaxSettings.async = false;
    $.get("/system/user/role/"+userId,function(response){
        selectedList = response;
    });
    $.get("/system/user/nonrole/"+userId,function(response){
        nonSelectedList = response;
    });
    //清除上次数据
    $(".rlSelect").html('');
    $('.rlSelect').doublebox({
        nonSelectedListLabel: '用户未拥有的角色',//['+rname+']
        selectedListLabel: '用户已拥有的角色',//['+rname+']
        preserveSelectionOnMove: 'moved',
        moveOnSelect: false,
        selectedList:selectedList,
        nonSelectedList:nonSelectedList,
        optionValue:"roleId",
        optionText:"roleName",
        doubleMove:true,
    });

    $("input[name='userId']").val(userId);
}

function showrlSelect(flag){
    if(flag == -1){
        $(".ue-container").css("display","none");
        return ;
    }
    //清除上次数据
    $(".rlSelect").html('');
    $('.rlSelect').doublebox({
        nonSelectedListLabel: '用户未拥有的角色',
        selectedListLabel: '用户已拥有的角色',
        preserveSelectionOnMove: 'moved',
        moveOnSelect: false,
        selectedList:null,
        nonSelectedList:"[]",
        optionValue:"roleId",
        optionText:"roleName",
        doubleMove:true,
    });
    $(".ue-container").css("display","block");

}
