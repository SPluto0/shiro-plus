function delwork(wid){
	swal({
        title: '确定?',
        text: '您将无法恢复该作业!',
        type: 'info',
        showCancelButton: true,
        confirmButtonText: '确定',
        cancelButtonText: '取消',
	}).then(function(isConfirm) {
        if (isConfirm.value) {
        	$.ajax({
        		url:"/work/delete/"+wid,
        		success:function(response){
                	if(response.success){
                		$("#"+wid).remove();
                		swal('已删除!','文件已删除','success');
                	}
        		},
        		error:function(){
        			
        		}
        	});
        }
    });
}

//下拉框改变显示条数
function selectSize(){
	var pageSize = $(".pageSize option:selected").val();
	location.href="/work/list.html?pageSize="+pageSize;
}

//输入框改变页码
function changePage(event){
	var pageNum = $(event).val();
	var pageSize = $(".pageSize option:selected").val();
	location.href="/work/list.html?pageNum="+pageNum+"&&pageSize="+pageSize;
}

/*
function init(uid,pageNum,pageSize){
	$.get("/work/list/"+uid+"?pageNum="+pageNum+"&&pageSize="+pageSize,function(response){
		$("#workContent").html("");
		$(".pageInfo").html("");
		var data = response.data;
		console.log(data);
		$.each(data.list,function(k,v){
			var workTbody = '<tr>'+
								'<td>'+v.id+'</td>'+
								'<td>'+v.name+'</td>'+
								'<td>'+v.teacherName+'</td>'+
								'<td>'+v.subjectName+'</td>'+
								'<td>'+v.decoratetime+'</td>'+
								'<td>'+v.takingtime+'</td>'+
								'<td>'+v.status+'</td>'+
								'<td>'+
									'<a href="jcjl_info.html">查看详情</a> &nbsp;'+
//									"<span sec:authorize=hasRole('ROLE_WORK_DELETE')>"+
//										'<a href="javascript:;">删除</a>'+
//									'</span>'+
								'</td>'+
							'</tr>';
			$("#workContent").append(workTbody);
		})
		
		var pageInfo =	'<div class="panel-body text-center">';
//		if(!data.isFirstPage){
			pageInfo += '<a onclick="init('+uid+','+data.firstPage+','+data.pageSize+')">首页</a> &nbsp;';
			pageInfo += '<a onclick="init('+uid+','+data.prePage+','+data.pageSize+')">上一页</a> &nbsp;';
//		}
//		if(!data.isLastPage){
			pageInfo += '<a onclick="init('+uid+','+data.nextPage+','+data.pageSize+')">下一页</a> &nbsp;';
			pageInfo += '<a onclick="init('+uid+','+data.lastPage+','+data.pageSize+')">尾页</a> &nbsp;';
//		}
		
		pageInfo += '<span>共&nbsp;<span id="totalSize">'+data.total+'</span>&nbsp;条记录</span>&nbsp;&nbsp;';	
		pageInfo += '<span class="form-inline">';
		pageInfo += '<span>';
		pageInfo += '<input id="jr_page" class="form-control currPage" value='+data.pageNum+' type="number" style="width: 42px;" />&nbsp;/&nbsp;';
		pageInfo += '<span id="totalPage">'+data.lastPage+'</span>&nbsp;页&nbsp;&nbsp;';
		pageInfo += '</span>' + '<span>' + '每页显示&nbsp;' ;
		pageInfo += '<select class="form-control">';
		pageInfo += '<option selected="selected">5</option>';
		pageInfo += '<option>10</option>';
		pageInfo += '<option>15</option>';
		pageInfo += '</select>';
		pageInfo += '&nbsp;条';
		pageInfo += '</span>'+'</span>';
		pageInfo += '</div>';
		$(".pageInfo").append(pageInfo);
	});
}
$(function(){
	//初始化数据
	init(1,1,5);
})*/