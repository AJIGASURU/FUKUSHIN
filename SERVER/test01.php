<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html lang="ja">
<head>
<meta http-equiv="Content-Type"
        content="text/html; charset=Shift_Jis">
<title>PHP入門</title>
</head>

<body>

<p>---送信されたコメント---</p>
<p>
<?php
$comment = $_GET['com_ment'];
echo $comment;
  
//ini_set("mysql.default_socket","/var/mysql/mysql.sock");

$mysqli = new mysqli('localhost', 'testuser', '111', 'test_db_1');
if ($mysqli->connect_errno){
  die("データベースの接続に失敗しました");
}else{
  echo "DB接続成功";
  //$mysqli->set_charset("utf8");
  }
  
  //SELECT
  $sql = "SELECT name, score FROM tb1";
  if ($result = $mysqli->query($sql)) {
      // 連想配列を取得
      while ($row = $result->fetch_assoc()) {
          echo $row["name"] , $row["score"] , "<br>";
      }
      // 結果セットを閉じる
      $result->close();
    }
  
$mysqli->close();
?>
</p>

<p>今日は、<?php echo date("Y/m/d"); ?> です。</p>

</body>
</html>
