<?php
require '../vendor/autoload.php';

define('DEBUG_TIME', microtime(true));

$whoops = new \Whoops\Run;
$whoops->pushHandler(new \Whoops\Handler\PrettyPageHandler);
$whoops->register();


$router = new App\Router(dirname(__DIR__) . '/views');
$router 
->get('/blog', 'post/index', 'blog')
->get('/blog/category', 'category/index', 'category')
->run();