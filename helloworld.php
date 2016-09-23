<!DOCTYPE html>

<html>
  <body>
    <?php
        /*$GLOBALS
        $_SERVER
        $_REQUEST
        $_POST
        $_GET
        $_FILES
        $_ENV
        $_COOKIE
        $_SESSION*/
        $name = "xingkongdao <br>";
        echo "This is my first php program ! <br>";
        echo "<h1> Title </h1><br>";
        $x = 5985;
        echo "<br>";
        var_dump($x);
        echo "<br>";
        $x = -345;
        var_dump($x);
        echo "<br>";
        $x = 0x8C;
        var_dump($x);
        $car=array("Volvo", "BMW", "SAAB");
        var_dump($car);
        define("PI", 3.14);
        echo PI;
        echo "<br>";
    ?>
    <?php
        echo "Hello World <br>";
        echo $name;

        $t = date("H");
        if($t < "20"){
          echo "Have a good day!";
          echo $t;
        }
    ?>
    <form method="post" action="<?php echo $_SERVER['PHP_SELF'];?>">
    Name: <input type="text" name="fname">
    <input type="submit">
    </form>
    <?php
      $name=$_REQUEST['fname'];
      echo $name;
      echo $_SERVER['PHP_SELF'];
      echo $_SERVER['SERVER_ADDR'];
    ?>
    
    <a href="test_get.php?subject=PHP&web=W3school.com.cn">test $GET</a>
    <?php
      $nameErr = $emailErr = $genderErr = $websiteErr = "";
      $name = $email = $gender = $comment = $website = "";

      if($_SERVER["REQUEST_METHOD"] == "POST"){
        if(empty($_POST["name"])){
          $nameErr = "姓名是必填的";
        }
        else {
          $name = test_input($_POST["name"]);
          // 检查姓名是否包含字母和空白字符
          if(!preg_match("/^[a-zA-Z]*$/", $name)){
            $nameErr = "只允许字母和空格";
          }
        }

        if(empty($_POST["email"])){
          $emailErr = "电邮是必填的";
        } else {
          $email = test_input($_POST["email"]);
          // 检查电子邮件地址语法是否有效
          if(!preg_match("/([\w\-]+\@[\w\-]+\.[\w\-]+)/", $email)){
            $emailErr = "无效的email格式";
          }
        }
        if (empty($_POST["website"])) {
          $website = "";
        } else {
          $website = test_input($_POST["website"]);
          // 检查 URL 地址语法是否有效（正则表达式也允许 URL 中的斜杠）
          if (!preg_match("/\b(?:(?:https?|ftp):\/\/|www\.)[-a-z0-9+&@#\/%?=~_|!:,.;]*[-a-z0-9+&@#\/%=~_|]/i",$website)) {
            $websiteErr = "无效的 URL"; 
          }
        }
        if (empty($_POST["comment"])) {
          $comment = "";
        } else {
          $comment = test_input($_POST["comment"]);
        }
     
        if (empty($_POST["gender"])) {
          $genderErr = "性别是必选的";
        } else {
          $gender = test_input($_POST["gender"]);
        }
      } 
      
      function test_input($data){
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
      }
    ?>
    
    <h2> C++ check </h2>
    <p><span class="error"> * 必需的字段 </span> </p>
    

  </body>
</html>
