<?php
$pdo = new PDO('mysql:dbname=mysite.v1;host=mariadb', 'mysite.v1', 'secret', [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]);

$query = $pdo->query('SHOW VARIABLES like "version"');

$row = $query->fetch();

echo 'MariaDB version:' . $row['Value'];
