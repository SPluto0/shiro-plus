//下拉框改变显示条数
function selectSize(){
	var pageSize = $(".pageSize option:selected").val();
	location.href="/system/rolelist.html?pageSize="+pageSize;
}

//输入框改变页码
function changePage(event){
	var pageNum = $(event).val();
	var pageSize = $(".pageSize option:selected").val();
	location.href="/system/rolelist.html?pageNum="+pageNum+"&&pageSize="+pageSize;
}

//确认给该角色分配权限
function allotRolePermission(){
	//取到selectedList中的值
	var permissionIds = [];
	$("select[name=doublebox_helper2] option").each(function(k,v){
		permissionIds.push(v.value);
	});
	var roleId = $("input[name='roleId']").val();
	$.ajax({
		url:"/system/role/allotRolePermission/"+roleId,
		type : 'POST',
		dataType: 'json',
		contentType: "application/json",
		data : JSON.stringify(permissionIds),
		success:function(response){
			if(response.success){
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
function allotPermission(event,rid){
	var rname = $(event).parents('tr').find('.roleName').text();
	var selectedList;
	var nonSelectedList;
	console.log(1);
	$.ajaxSettings.async = false;
	$.get("/system/role/permission/"+rid,"",function(response){
		selectedList = response;
	});
	$.get("/system/role/nonpermission/"+rid,"",function(response){
		nonSelectedList = response;
	});
	//清除上次数据
	$('.rlSelect').doublebox({
        nonSelectedListLabel: '角色未拥有的权限',//['+rname+']
        selectedListLabel: '角色已拥有的权限',//['+rname+']
        preserveSelectionOnMove: 'moved',
        moveOnSelect: false,
        selectedList:selectedList,
        nonSelectedList:nonSelectedList,
        optionValue:"permissionId",
        optionText:"remark",
        doubleMove:true,
    });

	//
	$("input[name='roleId']").val(rid);
}

function showrlSelect(flag){
	if(flag == -1){
		$(".ue-container").css("display","none");
		return ;
	}
	//清除上次数据
	$(".rlSelect").html('');
	$('.rlSelect').doublebox({
        nonSelectedListLabel: '角色未拥有的权限',
        selectedListLabel: '角色已拥有的权限',
        preserveSelectionOnMove: 'moved',
        moveOnSelect: false,
        selectedList:null,
        nonSelectedList:"[]",
        optionValue:"permissionId",
        optionText:"remark",
        doubleMove:true,
    });
	$(".ue-container").css("display","block");
	
}
function delRole(rid){
	swal({
        title: '确定?',
        text: '您将无法恢复该角色!',
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: '确定',
        cancelButtonText: '取消',
	}).then(function(isConfirm) {
        if (isConfirm.value) {
        	$.ajax({
        		type:"POST",
        		url:"/system/role/delete/"+rid,
        		success:function(response){
                	if(response.success){
                		$("#"+rid).remove();
                		swal('已删除!','该角色已删除','success');
                	}
        		},
        		error:function(response){
        			alert(1);
        		}
        	});
        }
    });
}
function addRole(){
	var roleObj = $("#roleForm").serializeObject();
	var roleJson = JSON.stringify(roleObj);
	$.ajax({
		url:"/system/role/add",
		type:"POST",
		data:roleJson,
		contentType:"application/json;charset=utf-8",
		success:function(response){
			if(response.success){
				$("#addRole").modal('hide');
				swal('','新增角色成功','success');
				//静态处理数据

			}else{
				
			}
		},error:function(){
			
		}
	});
}