$(function(){
	// 初始化下拉框
	$.get("/course/info",function(response){
		$.each(response.data,function(k,v){
			var courseOption = '<option value="'+v.courseId+'">'+v.courseName+'</option>';
			$("#course").append(courseOption);
		})
	})

	$.get("/dept/info",function(response){
		$.each(response.data,function(k,v){
			var deptOption = '<option value="'+v.deptId+'">'+v.deptName+'</option>';
			$("#dept").append(deptOption);
		})
	})

	$(document).on("click","#removeTagOption",function(e){
		var span = $(this).parent();
		$.each($("#tags option"),function(k,v){
			if($(v).text()==span.text()){
				$(v).remove();
			}
		})
		span.remove();
	});

	$(document).on("click","#tagOption span",function(e){
		//'<span class="tag label label-info">'+$(this).text()+'<span data-role="remove"></span></span>'
		var html = $(this).prop("outerHTML");
		html = html.substring(0,html.lastIndexOf("</span>"));
		html = html+'<span data-role="remove" id="removeTagOption"></span></span>';
		$(".bootstrap-tagsinput input").before(html);
		var tag = $("<option selected value="+$(this).text()+">"+$(this).text()+"</option>");
		$("#tags").append(tag);
	});



//	$("#submitAssign").click(function(){
//		var work = $("#assignForm").serializeObject();
//		work.wteacher=$("#userId").text();
//		console.log(work);
//		var workStr = JSON.stringify(work);
//		$.ajax({
//			//访问添加方法
//			url:"/work/add",
//			//data:前台传递到后台的数据
//			//增加修改的form表单必须以POST提交
//			type:"POST",
//			data:workStr,
//			//contentType:你传递的数据格式
//			contentType:"application/json;charset=utf-8",
//			success:function(response){
//				if(response.success){
//					alert("布置成功!");
//				}
//			},error:function(){
//				
//			}
//		})
//	})
})

