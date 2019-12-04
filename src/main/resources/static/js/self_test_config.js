$(function () {

});

var tb = $("#jr_addTager").html(); // 重复增加的内部表格

// 添加新的章节设置
$("#jr_btn_add").click(function () {
    $(tb).appendTo("#jr_addTager");
});

// 删除章节设置
function delzjsz(e) {
    $(e).closest("table").remove();
}