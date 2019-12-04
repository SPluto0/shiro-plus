//下拉框改变显示条数
function selectSize(){
	var pageSize = $(".pageSize option:selected").val();
	location.href="/system/permissionlist.html?pageSize="+pageSize;
}

//输入框改变页码
function changePage(event){
	var pageNum = $(event).val();
	var pageSize = $(".pageSize option:selected").val();
	location.href="/system/permissionlist.html?pageNum="+pageNum+"&&pageSize="+pageSize;
}

function delPermission(pid){
	swal({
        title: '确定?',
        text: '您将无法恢复该权限!',
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: '确定',
        cancelButtonText: '取消',
	}).then(function(isConfirm) {
        if (isConfirm.value) {
        	$.ajax({
        		type:"POST",
        		url:"/system/permission/delete/"+pid,
        		success:function(response){
                	if(response.success){
                		$("#"+pid).remove();
                		swal('已删除!','该权限已删除','success');
                	}
        		},
        		error:function(response){
        			alert(1);
        		}
        	});
        }
    });
}
function addPermission(){
	var permissionObj = $("#addPermissionForm").serializeObject();
	var permissionJson = JSON.stringify(permissionObj);
	$.ajax({
		url:"/system/permission/add",
		type:"POST",
		data:permissionJson,
		contentType:"application/json;charset=utf-8",
		success:function(response){
			if(response.success){
				$("#addPermission").modal('hide');
				swal('','新增权限成功','success');
			}else{
				
			}
		},error:function(){
			
		}
	});
}

//获取指定权限信息
function getPermissionById(pid){
	$.get("/system/permission/"+pid,"",function(response){
		if(response.success){
			//将数据提取到修改窗口
			var permissionInfo = response.data;
			console.log(permissionInfo);
			$("#currTrId").val(permissionInfo.permissionId);
			$("#permissionId").val(permissionInfo.permissionId);
			$("#permissionName").val(permissionInfo.permissionName);
			$("#permissionRemark").val(permissionInfo.remark);
			$("#permissionUrl").val(permissionInfo.url);
		}
	})
}
function updatePermission(){
	var permissionObj = $("#updatePermissionForm").serializeObject();
	var permissionJson = JSON.stringify(permissionObj);
	$.ajax({
		url:"/system/permission/update",
		type:"POST",
		data:permissionJson,
		contentType:"application/json;charset=utf-8",
		success:function(response){
			if(response.success){
				$("#updatePermission").modal('hide');
				//将当前行静态数据修改
				var permissionInfo = response.data;
				$("#"+permissionInfo.permissionId).find('.permissionName').text(permissionInfo.permissionName);
				$("#"+permissionInfo.permissionId).find('.permissionRemark').text(permissionInfo.remark);
				$("#"+permissionInfo.permissionId).find('.permissionUrl').text(permissionInfo.url);
				swal('','修改成功','success');
			}else{
				swal('修改失败',response.errorMsg,'wrong');
			}
		},error:function(){
			
		}
	});
}
