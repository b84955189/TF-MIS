<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8" />
    <title>HTML Preview(markdown to html) - Editor.md examples</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/editor_md/css/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/editor_md/css/editormd.preview.css" />
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    <style>
        .editormd-html-preview {
            width: 90%;
            margin: 0 auto;
        }
    </style>
</head>
<body>
<div id="layout">

    <div id="test-editormd-view">
        <textarea style="display:none;" name="test-editormd-markdown-doc">###Hello world!</textarea>
    </div>

</div>
<!-- <script src="js/zepto.min.js"></script>
<script>
    var jQuery = Zepto;  // 为了避免修改flowChart.js和sequence-diagram.js的源码，所以使用Zepto.js时想支持flowChart/sequenceDiagram就得加上这一句
</script> -->
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/editor_md/lib/marked.min.js"></script>
<script src="${pageContext.request.contextPath}/static/editor_md/lib/prettify.min.js"></script>

<script src="${pageContext.request.contextPath}/static/editor_md/lib/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/static/editor_md/lib/underscore.min.js"></script>
<script src="${pageContext.request.contextPath}/static/editor_md/lib/sequence-diagram.min.js"></script>
<script src="${pageContext.request.contextPath}/static/editor_md/lib/flowchart.min.js"></script>
<script src="${pageContext.request.contextPath}/static/editor_md/lib/jquery.flowchart.min.js"></script>

<script src="${pageContext.request.contextPath}/static/editor_md/editormd.js"></script>
<script type="text/javascript">
    $(function() {
        var testEditormdView;
        $.ajax({
            url: 'http://localhost/test.do?method=getArticleList&t='+new Date(),
            type: 'post',
            success: function (msg) {
                let data=JSON.parse(msg).data;
                testEditormdView = editormd.markdownToHTML("test-editormd-view", {
                    markdown        : data[9].article_content ,//+ "\r\n" + $("#append-test").text(),
                    //htmlDecode      : true,       // 开启 HTML 标签解析，为了安全性，默认不开启
                    htmlDecode      : "style,script,iframe",  // you can filter tags decode
                    // toc             : false,
                    tocm            : true,    // Using [TOCM]
                    //tocContainer    : "#custom-toc-container", // 自定义 ToC 容器层
                    //gfm             : false,
                    //tocDropdown     : true,
                    // markdownSourceCode : true, // 是否保留 Markdown 源码，即是否删除保存源码的 Textarea 标签
                    emoji           : true,
                    taskList        : true,
                    tex             : true,  // 默认不解析
                    flowChart       : true,  // 默认不解析
                    sequenceDiagram : true,  // 默认不解析
                });
            }
        });








    });
</script>
</body>
</html>
<%-- author:Jason Date: 6/14/2020 3:38 PM--%>