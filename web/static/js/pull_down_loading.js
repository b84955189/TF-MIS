
 //获取页面顶部被卷起来的高度
 function scrollTop(){
 return Math.max(
  //chrome
  document.body.scrollTop,
  //firefox/IE
  document.documentElement.scrollTop);
 }
 //获取页面文档的总高度
 function documentHeight(){
 //现代浏览器（IE9+和其他浏览器）和IE8的document.body.scrollHeight和document.documentElement.scrollHeight都可以
 return Math.max(document.body.scrollHeight,document.documentElement.scrollHeight);
 }
 //获取页面浏览器视口的高度
 function windowHeight(){
 //document.compatMode有两个取值。BackCompat：标准兼容模式关闭。CSS1Compat：标准兼容模式开启。
 return (document.compatMode == "CSS1Compat")?
 document.documentElement.clientHeight:
 document.body.clientHeight;
 }



