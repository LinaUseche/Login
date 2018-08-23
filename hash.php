<?php
echo password_hash("123", PASSWORD_DEFAULT)."\n<br /><br />";
$opciones = [
	'cost' => 9,
];
echo password_hash("123", PASSWORD_BCRYPT, $opciones)."\n<br /><br />";

$opciones = [
  'cost' => 9,
  'salt' => mcrypt_create_iv(22, MCRYPT_DEV_URANDOM),
];
echo password_hash("123", PASSWORD_BCRYPT, $opciones)."\n<br /><br />";
$timeTarget = 0.05;
$coste = 8;
do {
  $coste++;
  $inicio = microtime(true);
  password_hash("123", PASSWORD_BCRYPT, ["cost" => $coste]);
  $fin = microtime(true);
} while (($fin - $inicio) < $timeTarget);
  echo "Coste apropiado encontrado:" . $coste . "\n<br /><br />";

//datos de confirmacion de usuario por email
$confir_user = md5(time());
echo time() . "\n<br /><br />";
echo "Confirmacion de usuario: " . $confir_user;
?>
