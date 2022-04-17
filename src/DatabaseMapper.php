<?php

namespace database;
use PDO;

class DatabaseMapper
{
    /**
     * @var PDO
     */
    private PDO $pdo;

    /**
     * @param PDO $pdo
     */
    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    /**
     * @return array
     */
    public function getList() :array
    {
        $arr_db = $this->pdo->prepare('SELECT * FROM articles ORDER BY date');
        $arr_db ->execute();
        return $arr_db->fetchALL();
    }

    /**
     * @param $id
     * @return array|null
     */
    public function getComm($id) :?array
    {
        $arr_db = $this->pdo->prepare('SELECT * FROM comments WHERE id_art = :id ORDER BY date DESC');
        $arr_db ->execute([
            'id'=>$id
        ]);
        return $arr_db->fetchALL();
    }

    /**
     * @param string $url
     * @return array|null
     */
    public function geturlart(string $url) :?array
    {
        $arr_db = $this->pdo->prepare('SELECT * FROM articles WHERE url = :url');
        $arr_db ->execute([
            'url'=>$url
        ]);
        $arr = $arr_db->fetchALL();
        return array_shift($arr);
    }

    /**
     * @param array $parametrs
     * @return bool
     */
    public function add_art(array $parametrs) :bool
    {
        $arr_db = $this->pdo->prepare('INSERT INTO articles (title,url,content) VALUES (:title,:url,:text)');
        if($parametrs['title']!="" && $parametrs['url']!=""  && $parametrs['content']!=""){
            $arr_db ->execute([
                'title'=>$parametrs['title'],
                'url'=>$parametrs['url'],
                'text'=>$parametrs['content']
            ]);
            return true;
        }
        return false;
    }

    /**
     * @param $id
     * @return void
     */
    public function del_art($id) {
        $arr_db = $this->pdo->prepare('DELETE FROM articles WHERE id = :id ');
        $arr_db ->execute([
           'id'=>$id
        ]);
    }

    /**
     * @param array $parameters
     * @return void
     */
    public function edit_art(array $parameters) {
        $arr_db = $this->pdo->prepare('UPDATE articles SET title = :title, content = :text WHERE id=:id ');
        $arr_db ->execute([
            'title'=>$parameters['title'],
            'text' =>$parameters['content'],
            'id' =>$parameters['id']
        ]);
    }

    /**
     * @param $id
     * @return void
     */
    public function del_com($id) {
        $arr_db = $this->pdo->prepare('DELETE FROM comments WHERE id = :id ');
        $arr_db ->execute([
            'id'=>$id
        ]);
    }
    public function edit_com(array $parameters) {
        $arr_db = $this->pdo->prepare('UPDATE comments SET content = :content WHERE id=:id ');
        $arr_db ->execute([
            'content' =>$parameters['text'],
            'id' =>$parameters['id']
        ]);
    }


}