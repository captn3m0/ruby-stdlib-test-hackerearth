<?php
$libs = file('libs.txt');
foreach($libs as $lib){
  $lib = trim($lib);
  $result = json_decode(file_get_contents("$lib.json"), true);
  echo "$lib - ".$result['run_status']['status']."\n";
}
