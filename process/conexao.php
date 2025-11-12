<?php
    // incia a sessão 
    session_start();

    // variaveis para conexao do banco 

    $user = "root";
    $pass = "Admin@123";
    $db = "pizzaria";
    $host = "localhost";

    // capturar os erros da conexão (Se houver) 

    try{
        $conn = new PDO("mysql:host={$host};dbname={$db}", $user, $pass);
        // habilita os erros do PDO
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $conn->setAttribute(PDO::ATTR_EMULATE_PREPARES, false);

    }catch(Exception $e){   
        print "Erro: " . $e->getMessage() ."<br/>";
        die(); // encerra 
    }

?>