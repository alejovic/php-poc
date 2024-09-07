<?php

try {
    $dbh = new PDO('mysql:host=mariadb;dbname=mysite.v1', 'mysite.v1', 'secret');
    echo '<h4 style="color: green">Connected to database sucessfully.</h4>';
}
catch (PDOException $e) {
    echo '<h4 style="color: red">Fail to connect to database.</h4>';
}