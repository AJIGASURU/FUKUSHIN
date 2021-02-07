<?php
//GGGGGEEEEETTTTT
  
$mysqli = new mysqli('localhost', 'testuser', '111', 'test_db_1');
if ($mysqli->connect_errno){
  die("データベースの接続に失敗<br　/>");
}else{
  //echo "DB接続成功<br />";
  //$mysqli->set_charset("utf8");
  }
  
//SELECT
$sql_select = "SELECT name, score FROM tb1";
if ($result = $mysqli->query($sql_select)){
  // 連想配列を取得
  $result_json = array();
  while ($row = $result->fetch_assoc()) {
    //echo $row["name"] ,":", $row["score"] , "<br />";
    $result_json[]=array(
        'name'=>$row['name'],
        'score'=>$row['score'],
        );
  }
  //echo "fin";
  //print_r($result_json);
  echo json_encode($result_json);
  /////
  $result->close();
}else{
  die("SELECT 失敗<br />");
}
//
  
$mysqli->close();
?>
