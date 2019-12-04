$(function(){
	//设置初始登陆窗体位置
	var height = $(window).height();
    $(".right-bg").css("height",height);
	$(".login").css("margin-top",height/6);
});

//获取调整窗体大小事件
$(window).resize(function(){
	//实时获取宽高
	var height = $(window).height();
	$(".login").css("margin-top",height/6);
//	var width = $(window).width();
});

$("#imageCode").click(function (event) {
    $(this).attr('src',$(this).attr('src')+1);
})
// $("#loginForm").submit(function() {
// 	var username = $("#idcard").val();
// 	var password = $("#pwd").val();
// 	$.ajax({
// 		type: "POST",
// 		/*dataType: "jsonp", //跨域请求json
// 		jsonp:'callback',
// 		jsonpCallback:"successCallback",*/
// 		url: "/student/login",
// 		data: {
// 			"sname": username,
// 			"pwd": password,
// 			"ran":(new Date()).valueOf()
// 		},
// 		async: false,
// 		beforeSend: function() {
// 			//请求前的处理
// 		},
// 		success: function(response) {
// 			//请求成功处理，和本地回调完全一样
// 			if(response.status==200){
// 				var redirect = $(".redirect").text();
// 				if(redirect!=""&&redirect!=null){
// 					location.href=redirect;
// 				}else{
// 					location.href="http://localhost:8080/index.html";
// 				}
// 			}
// 		},
// 		complete: function() {
// 			//请求完成的处理
// 		},
// 		error: function(response) {
// 			//请求出错处理
// 			console.log(response);
// 			alert("登录出错");
// 		}
// 	});
// })