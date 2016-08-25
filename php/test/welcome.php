<html>
<body>
<script>
var name= $_POST["name"];
var age = $_POST["age"];
</script>

Welcome <?php echo $_POST["name"]; ?><br>
Your email address is: <?php echo $_POST["age"]; ?>

<?php
$con = mysql_connect("localhost", "root", "root123");
if( !$con )
{
	echo "xingkongdao";
	die("Could not connect:" . mysql_error());
}
mysql_select_db("test", $con);
mysql_query("INSERT INTO person(name, age) VALUES('$_POST[name]', '$_POST[age]')");

mysql_close($con);
?>
</body>
</html>

