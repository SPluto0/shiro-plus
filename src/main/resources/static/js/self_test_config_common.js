/**
 * 改变字体大小
 * @param {Integer} 字体大小
 */
function changeFont(size) {
    $(".jr_font_size").css("font-size", size + "px");
}

$(function () {
    /**
     * 点击面板头部切花面板显示状态
     */
    $(".jr_mbtt").click(function () {
        $(this).next().collapse('toggle');
    });
})