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
         <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
          <div class="container-fluid">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="#">NomeEmpresa</a>
            </div>

            
          </div><!-- /.container-fluid -->
        </nav>
      
      <div class="container-fluid">
        <div class="row-fluid">
            <div class="col-xs-12">
                
                <div class="form-login">
                    <h2>Efetue Login</h2>
                    <form action="/projetoTeste/Login?acao=logar" method="post">
                        <label class="sr-only" for="inputLogin">E-mail:</label>
                        <input type="email" id="inputLogin" name="inputLogin" class="form-control input-lg" placeholder="Seu E-mail" maxlength="50" required />
                        <label class="sr-only" for="inputSenha">Senha:</label>
                        <input type="password" id="inputSenha" name="inputSenha" class="form-control input-lg" placeholder="Sua senha" maxlength="15" required />
                        
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="s" /> Lembre-me
                            </label>
                        </div>
                        
                        <button type="submit" class="btn btn-primary btn-lg btn-block">
                            <span class="glyphicon glyphicon-ok"></span>                            
                            Acessar
                        </button>
                        
                    </form>
                </div>
                
            </div>
        </div>
      </div>
     
        <script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    </body>
</html>
