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


                <div class="col-sm-9">

                    <div class="conteudo_painel">                    
                        <div class="conteudo_painel_int">
                            <div class="pageheader"><h3>Atualizando aluno</h3></div>

                            <form class="form-horizontal" action="/projetoTeste/alunos?acao=atualizarAluno" method="post"
                                  name="frmCadastrarAluno" id="formCadastrarAluno">
                                <fieldset>
                                    <legend><h5>Dados pessoais</h5></legend>


                                    <div class="form-group">
                                        <label for="aluno_id" class="col-xs-2 control-label">Matricula:</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control" id="aluno_id" name="aluno_id" disabled="disabled" value="${aluno.id}" />
                                        </div>

                                    </div>


                                    <div class="form-group">
                                        <label for="aluno_nome" class="col-xs-2 control-label">Nome:</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control" id="aluno_nome" name="aluno_nome" value="${aluno.nome}" />
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label for="aluno_telefone" class="col-xs-2 control-label">Telefone:</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control" id="aluno_telefone" name="aluno_telefone" value="${aluno.telefone}"/>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label for="aluno_celular" class="col-xs-2 control-label">Celular:</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control" id="aluno_celular" name="aluno_celular" value="${aluno.celular}"/>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label for="aluno_email" class="col-xs-2 control-label">E-mail:</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control" id="aluno_email" name="aluno_email" value="${aluno.email}" />
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label for="aluno_dtNascimento" class="col-xs-2 control-label">Data Nasc.:</label>
                                        <div class="col-xs-10">
                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${aluno.dtNascimento}" var="dataFormatada"/>  
                                            <input type="text" class="form-control" id="aluno_dtNascimento" name="aluno_dtNascimento" value="${dataFormatada}" />
                                            <span class="help-block">Texto de ajuda para o campo. Por exemplo: 08/11/1975</span>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label for="aluno_sexo" class="col-xs-2 control-label">Sexo:</label>
                                        <div class="col-xs-10">

                                            <c:set var="sexo" value="${aluno.sexo}"/>

                                            <select class="form-control" id="aluno_sexo" name="aluno_sexo" value="${aluno.sexo}">
                                                <c:if test="${sexo == 'M'}">
                                                    <option value="M" selected="">Masculino</option>
                                                    <option value="F" >Feminino</option>

                                                </c:if>

                                                <c:if test="${sexo == 'F'}">
                                                    <option value="M" >Masculino</option>
                                                    <option value="F" selected="">Feminino</option>
                                                </c:if>

                                            </select>
                                        </div>
                                    </div>
                                </fieldset>

                                <fieldset>
                                    <legend><h5>Dados do Endereço</h5></legend>

                                    <div class="form-group">
                                        <label for="aluno_logradouro" class="col-xs-2 control-label">Logradouro:</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control" id="aluno_logradouro" name="aluno_logradouro" value="${endereco.logradouro}" />
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label for="aluno_bairro" class="col-xs-2 control-label">Bairro:</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control" id="aluno_bairro" name="aluno_bairro" value="${endereco.bairro}" />
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label for="aluno_numero" class="col-xs-2 control-label">Numero:</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control" id="aluno_numero" name="aluno_numero" value="${endereco.numero}" />
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label for="aluno_complemento" class="col-xs-2 control-label">Complemento:</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control" id="aluno_complemento" name="aluno_complemento"  value="${endereco.complemento}"/>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label for="aluno_cep" class="col-xs-2 control-label">CEP:</label>
                                        <div class="col-xs-10">
                                            <input type="text" class="form-control" id="aluno_cep" name="aluno_cep"  value="${endereco.cep}"/>
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label for="aluno_estado" class="col-xs-2 control-label">Estado:</label>
                                        <div class="col-xs-10">
                                            <select class="form-control" id="aluno_estado" name="aluno_estado">
                                                <option value="1">RJ</option>

                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="aluno_cidade" class="col-xs-2 control-label">Cidade:</label>
                                        <div class="col-xs-10">
                                            <select class="form-control" id="aluno_cidade" name="aluno_cidade" value="${endereco.cidadeId.id}">
                                                <option value="1">Rio de Janeiro</option>

                                            </select>
                                        </div>
                                    </div>

                                </fieldset>

                                <div class="modal-footer">

                                    <button type="submit" class="btn btn-primary" >Atualizar</button>
                                </div>

                            </form>                                     

                        </div>
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
