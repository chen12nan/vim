<?php
$con = mysql_connect("localhost", "root", "root123");
if(!$con) 
{
  die('Could not connect: ' . mysql_error());
}

echo "Database Created";
if(mysql_query("CREATE DATABASE my_db", $con))
{
  echo "Database Created\n";
}
else
{
  echo "Error creating database: " . mysql_error();
}
mysql_select_db("my_db", $con);
$sql = "Create table Persons(name varchar(20), Age int)";
mysql_query($sql, $con);
mysql_close($con);
?>
