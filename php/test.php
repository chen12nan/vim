<?php
$con = mysql_connect("localhost", "test", "test123");
echo con;
if(!$con)
{
	die("Could not connect:" . mysql_error());
}
else
{
	echo "xingkongdao";
}
?>

