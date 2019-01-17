<?php

require_once __DIR__.'/../vendor/autoload.php';

ORM::configure([
    'connection_string' => 'mysql:host=172.18.0.2;dbname=mydb',
    'username' => 'foo',
    'password' => '123456',
]);

$users = ORM::for_table('user')
    ->find_array();

echo json_encode($users);
