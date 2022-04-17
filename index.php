<?php
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;
use \Twig\Loader\FilesystemLoader;
use \Twig\Environment;
use database\DatabaseMapper;

require __DIR__ . '/vendor/autoload.php';
try {
    $pdo = new PDO('mysql:host=localhost;dbname=blog;charset=utf8','root','');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
}
catch (PDOException $exception){
    echo $exception->getMessage();
    exit();
}
$DatabaseMapper= new DatabaseMapper($pdo);

$loader = new FilesystemLoader('template');
$view = new Environment($loader);

$app = AppFactory::create();
$app->addBodyParsingMiddleware();


$app->get('/', function (Request $request, Response $response) use ($view,$DatabaseMapper) {
    $articles=$DatabaseMapper->getList();
    $response->getBody()->write($view->render('index.twig' ,['articles'=>$articles]));
    return $response;
});



$app->get('/article/{url}', function (Request $request, Response $response, $args) use ($view,$DatabaseMapper) {
    $article = $DatabaseMapper->geturlart($args['url']);
    if(empty( $article)){
        $page =  $view->render('error.twig');
    }
    else{
        $comments = $DatabaseMapper->getComm( $article['id']);
        $page = $view->render('article.twig',[
            'article'=>$article,
            'comments'=>$comments
        ]);
    }
    $response->getBody()->write($page);
    return $response;

});


$app->get('/add-art', function (Request $request, Response $response) use ($view) {
    $response->getBody()->write($view->render('add-art.twig' ));
    return $response;
});


$app->post('/edit', function (Request $request, Response $response) use ($view) {
    $id = (array) $request->getParsedBody();
    $response->getBody()->write($view->render('edit.twig',[
        'id'=>$id['id'],
        'title'=>$id['title'],
        'content'=>$id['content'],
        'url'=>$id['url']
    ]));
    return $response;
});

$app->post('/edit-com', function (Request $request, Response $response) use ($view) {
    $parameters = (array) $request->getParsedBody();
    $response->getBody()->write($view->render('edit-com.twig',[
        'id'=>$parameters['id'],
        'text'=>$parameters['content'],
        'url'=>$parameters['page']

    ]));
    return $response;
});

$app->post('/edit-comment', function (Request $request, Response $response) use ($DatabaseMapper) {
    $parameters = (array) $request->getParsedBody();
    $DatabaseMapper->edit_com( $parameters);
    return $response->withHeader("location","/article/".$parameters['url']."#comments")->withStatus(302);
});


$app->post('/register', function (Request $request, Response $response) use ($DatabaseMapper) {
    $parametrs=(array) $request->getParsedBody();
    $post=$DatabaseMapper->add_art($parametrs);
    if($post)return $response->withHeader("location","/")->withStatus(302);
    return $response->withHeader("location","/add-art")->withStatus(302);
});


$app->post('/del-art', function (Request $request, Response $response) use ($DatabaseMapper) {
    $id = (array) $request->getParsedBody();
    $DatabaseMapper->del_art($id['id']);
    return $response->withHeader("location","/")->withStatus(302);
});

$app->post('/del-com', function (Request $request, Response $response) use ($DatabaseMapper) {
    $id = (array) $request->getParsedBody();
    $DatabaseMapper->del_com($id['del']);
    return $response->withHeader("location","/article/".$id['page']."#comments")->withStatus(302);
});


$app->post('/edit-art', function (Request $request, Response $response) use ($DatabaseMapper) {
    $parameters = (array) $request->getParsedBody();
    $DatabaseMapper->edit_art($parameters);
    return $response->withHeader("location","/article/".$parameters['url'])->withStatus(302);
});


$app->run();


