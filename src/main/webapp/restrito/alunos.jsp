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

        <link rel="stylesheet" href="webjars/bootstrap/3.2.0/css/bootstrap.min.css">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="css/painel.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>

        <!-- YOUR CODE HERE -->
        <jsp:include page="menusuperior.jsp"/>

        <!-- inicio da parte central -->
        <div class="container-fluid">
            <div class="row-fluid">

                <!-- include do menu lateral -->
                <jsp:include page="menulateral.jsp"/>
                <!-- include do modal para cadastro de alunos -->
                <jsp:include page="cadastroaluno.jsp"/>

                <div class="col-sm-9">

                    <div class="conteudo_painel">                    
                        <div class="conteudo_painel_int">
                            <div class="pageheader"><h3>Cadastro de alunos</h3></div>

                            <div class="table-responsive">
                                <table class="table table-bordered table-striped table-hover table-condensed">
                                    <thead>
                                        <tr >
                                            <th>Matricula</th>
                                            <th>Nome</th>
                                            <th>Telefone</th>
                                            <th>Celular</th>
                                            <th>Data Nascimento</th>
                                            <th>Editar</th>
                                            <th>Excluir</th>
                                            
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listaDeAluno}" var="aluno">
                                            <tr >
                                                <td>${aluno.id}</td>
                                                <td>${aluno.nome}</td>
                                                <td>${aluno.telefone}</td>
                                                <td>${aluno.celular}</td>
                                                <td>
                                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${aluno.dtNascimento}" />  
                                                
                                                </td>
                                                <td>
                                                    <c:url var="update" value="/alunos?acao=preparaUpdate&id=${aluno.id}"></c:url> 
                                                    <a href="${update}" class="btn btn-warning btn-xs btn-block">
                                                        <span class="glyphicon glyphicon-pencil"></span>                            
                                                    
                                                    </a>
                                                  
                                                </td>
                                                
                                                <td>
                                                    <c:url var="delete" value="/alunos?acao=delete&id=${aluno.id}"></c:url> 
                                                    <a href="${delete}" class="btn btn-danger btn-xs btn-block">
                                                        <span class="glyphicon glyphicon-remove"></span>                            
                                                    
                                                    </a>
                                                  
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
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
