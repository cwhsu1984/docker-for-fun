<?php

require_once __DIR__.'/../vendor/autoload.php';

ORM::configure([
    'connection_string' => 'mysql:host=172.18.0.2;dbname=mydb',
    'username' => 'foo',
    'password' => '123456',
]);

$redis = new Redis();
$redis->connect('172.18.0.5', 6379);
$userJsonString = $redis->get('users');
print "<pre>";
if ($userJsonString) {
    echo "user from cache:\n";
} else {
    echo "user from db:\n";
    $users = ORM::for_table('user')
        ->find_array();

    $userJsonString = json_encode($users);
    $redis->setEx('users', 5, $userJsonString);
}

echo $userJsonString;
