<html>
<body>

<?php
$con = mysql_connect("localhost", "root", "root123");
if( !$con )
{
	echo "xingkongdao";
	die("Could not connect:" . mysql_error());
}
mysql_select_db("test", $con);
mysql_query("INSERT INTO person(name, age) VALUES('sh', '12')");

mysql_close($con);
?>
</body>
</html>

