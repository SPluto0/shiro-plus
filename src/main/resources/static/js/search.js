//图片搜索框，显示配置
    $("#file-1").fileinput({
        uploadUrl: '#', // 上传路径
        allowedFileExtensions : ['jpg', 'png','gif'],
        maxFileSize: 1000,
        maxFilesNum: 10,
        dropZoneTitle:"拖拽图片到这里",
        showCaption: false,
        showPreview: true, //是否显示预览区域
        showRemove: false,
        showUpload: false,
        browseLabel:'', //取消上传按钮的提示
        browseIcon: '', //取消上传按钮的图标
        browseClass:'display:none', //隐藏上传按钮
        showCancel: false,
        //预览图片的尾部图标
        layoutTemplates:{
            footer :'',//footer置为空
        }
    });
    $("#file-2").fileinput({
        uploadUrl: '#', // 上传路径
        allowedFileExtensions : ['jpg', 'png','gif'],
        maxFileSize: 1000,
        maxFilesNum: 10,
        dropZoneTitle:"拖拽图片到这里",
        showCaption: false,
        showPreview: false, //是否显示预览区域
        showRemove: false,
        showUpload: false,
        browseLabel:'上传本地图片',
        // browseLabel:'', //取消上传按钮的提示
        // browseIcon: '', //取消上传按钮的图标
        // browseClass:'display:none', //隐藏上传按钮
        showCancel: false,
        //预览图片的尾部图标
        layoutTemplates:{
            footer :'',//footer置为空
        }
    });

    $("#picSearch").click(function(event) {
        $("#picHere").show(300);
        $("#textSearch").hide();
        $("#hotSearch").hide();
        $("#imageSearch").show();
    });