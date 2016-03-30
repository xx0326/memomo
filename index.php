<?php
$pid=$_GET['pid'];

$normal = "http:////7xqnk9.com1.z0.glb.clouddn.com/L_NORMAL_".$pid."_1.png";

$broken = "http:////7xqnk9.com1.z0.glb.clouddn.com/L_BROKEN_".$pid."_1.png";

?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta property="qc:admins" content="50632727557576100416216375" />
<title>PM</title>

<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>
<body>
<?php include 'head.html';?>


<div style="float: left;width: 50%;">
<img style="width: 100%" src="<?php echo $normal;?>">
</div>
<div style="float: left;width: 50%;">
<img style="width: 100%" src="<?php echo $broken;?>">
</div>

</body>
</html>