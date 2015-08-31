<%-- 
    Document   : testeBootstrap
    Created on : 25/08/2015, 11:11:46
    Author     : Rui
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="webjars/bootstrap/3.2.0/css/bootstrap.min.css">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="css/painel.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <!-- YOUR CODE HERE -->
        <jsp:include page="menu.jsp"/>

        <div class="container-fluid">
            <div class="row-fluid">


                <div class="col-sm-3">

                    <!-- menu navegação lateral -->
                    <div class="panel panel-primary">
                        <div id="colGroup1" role="tab" class="panel-heading">
                            <h4 class="panel-title">
                                <a href="#colListGroup1" aria-controls="colListGroup1" aria-expanded="false" data-toggle="collapse">

                                    <span class="glyphicon glyphicon-file"></span>

                                    Gerenciar Posts
                                </a>
                            </h4>
                        </div>
                        <div role="tabpanel" class="panel-collapse collapse" id="colListGroup1" aria-expanded="false">
                            <ul class="list-group">
                                <li class="list-group-item"><a href="#">Criar novo POST</a></li>
                                <li class="list-group-item"><a href="#">Alterar POSTS</a></li>
                                <li class="list-group-item"><a href="#">Excluir POSTS</a></li>
                            </ul>
                            <div class="panel-footer"></div>
                        </div>
                    </div>
                    <!-- /.menu navegação lateral -->

                    <!-- menu navegação lateral -->
                    <div class="panel panel-primary">
                        <div id="colGroup1" role="tab" class="panel-heading">
                            <h4 class="panel-title">
                                <a href="#colListGroup2" aria-controls="colListGroup2" aria-expanded="false" data-toggle="collapse">

                                    <span class="glyphicon glyphicon-user"></span>

                                    Gerenciar Usuários
                                </a>
                            </h4>
                        </div>
                        <div role="tabpanel" class="panel-collapse collapse" id="colListGroup2" aria-expanded="false">
                            <ul class="list-group">
                                <li class="list-group-item"><a href="#">Criar novo usuário</a></li>
                                <li class="list-group-item"><a href="#">Alterar usuário</a></li>
                                <li class="list-group-item"><a href="#">Excluir usuário</a></li>
                            </ul>
                            <div class="panel-footer"></div>
                        </div>
                    </div>
                    <!-- /.menu navegação lateral -->

                </div> 



                <div class="col-sm-9">

                    <div class="conteudo_painel">                    
                        <div class="conteudo_painel_int">

                            <ul class="nav nav-pills" role="tablist">
                                <li class="active"><a href="#">E-mails <span class="badge">10</span></a></li>
                                <li class=""><a href="#">Avisos <span class="badge">10</span></a></li>
                                <li class=""><a href="#">Mensagens <span class="badge">10</span></a></li>
                                <li class=""><a href="#">Aniversariantes <span class="badge">10</span></a></li>
                            </ul>

                            <hr />

                            <div class="well well-sm">
                                <h2>Seja bem vindo Usuário!</h2>
                                <p>Utilize o menu ao lado para acessar as áreas do painel!</p>
                            </div>

                            <div class="pageheader"><h3>Avisos:</h3></div>

                            <div class="alert alert-success">
                                <strong>Parabéns!</strong> Você foi recomendado!
                            </div>

                            <div class="alert alert-warning">
                                <strong>Atenção:</strong> Você têm até o dia /01/01/1111 para ajustar suas férias!
                            </div>

                            <div class="row">
                                <div class="col-sm-4">
                                    <h3>Minhas Tarefas</h3>
                                    <ul>
                                        <li>Ligar para Fulano</li>
                                        <li>Retornar e-mail fulano</li>
                                        <li>Outra Tarefa</li>
                                    </ul>
                                    <a href="#" class="btn btn-primary btn-block">Adicionar nova Tarefa</a>
                                </div>

                                <div class="col-sm-4">
                                    <h3>Minhas Tarefas</h3>
                                    <ul>
                                        <li>Ligar para Fulano</li>
                                        <li>Retornar e-mail fulano</li>
                                        <li>Outra Tarefa</li>
                                    </ul>
                                    <a href="#" class="btn btn-primary btn-block">Adicionar nova Tarefa</a>
                                </div>

                                <div class="col-sm-4">
                                    <h3>Minhas Tarefas</h3>
                                    <ul>
                                        <li>Ligar para Fulano</li>
                                        <li>Retornar e-mail fulano</li>
                                        <li>Outra Tarefa</li>
                                    </ul>
                                    <a href="#" class="btn btn-primary btn-block">Adicionar nova Tarefa</a>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
        <script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    </body>
</html>
