<!-- janela modal -->
<form class="form-horizontal" action="/projetoTeste/alunos?acao=cadastrarAlunos" method="post"
      name="frmCadastrarAluno" id="formCadastrarAluno">
    <div class="modal fade" id="modal01" role="dialog" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <div class="modal-header">

                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">&times;</span>
                        <span class="sr-only">Fechar janela modal</span>
                    </button>

                    <h4 class="modal-title">Cadastro de Aluno</h4>
                </div>

                <div class="modal-body">

                    <fieldset>
                        <legend><h5>Dados pessoais</h5></legend>
                        <div class="form-group">
                            <label for="aluno_nome" class="col-xs-2 control-label">Nome:</label>
                            <div class="col-xs-10">
                                <input type="text" class="form-control" id="aluno_nome" name="aluno_nome" placeholder="Nome:" />
                            </div>

                        </div>

                        <div class="form-group">
                            <label for="aluno_telefone" class="col-xs-2 control-label">Telefone:</label>
                            <div class="col-xs-10">
                                <input type="text" class="form-control" id="aluno_telefone" name="aluno_telefone" placeholder="Telefone:" />
                            </div>

                        </div>

                        <div class="form-group">
                            <label for="aluno_celular" class="col-xs-2 control-label">Celular:</label>
                            <div class="col-xs-10">
                                <input type="text" class="form-control" id="aluno_celular" name="aluno_celular" placeholder="Celular:" />
                            </div>

                        </div>

                        <div class="form-group">
                            <label for="aluno_email" class="col-xs-2 control-label">E-mail:</label>
                            <div class="col-xs-10">
                                <input type="text" class="form-control" id="aluno_email" name="aluno_email" placeholder="E-mail:" />
                            </div>

                        </div>

                        <div class="form-group">
                            <label for="aluno_dtNascimento" class="col-xs-2 control-label">Data Nasc.:</label>
                            <div class="col-xs-10">
                                <input type="text" class="form-control" id="aluno_dtNascimento" name="aluno_dtNascimento" placeholder="Data de nascimento:" />
                                <span class="help-block">Texto de ajuda para o campo. Por exemplo: 08/11/1975</span>
                            </div>

                        </div>

                        <div class="form-group">
                            <label for="aluno_sexo" class="col-xs-2 control-label">Sexo:</label>
                            <div class="col-xs-10">
                                <select class="form-control" id="aluno_sexo" name="aluno_sexo">
                                    <option value="M">Masculino</option>
                                    <option value="F">Feminino</option>
                                </select>
                            </div>
                        </div>
                    </fieldset>

                    <fieldset>
                        <legend><h5>Dados do Endereço</h5></legend>

                        <div class="form-group">
                            <label for="aluno_logradouro" class="col-xs-2 control-label">Logradouro:</label>
                            <div class="col-xs-10">
                                <input type="text" class="form-control" id="aluno_logradouro" name="aluno_logradouro" placeholder="Logradouro:" />
                            </div>

                        </div>

                        <div class="form-group">
                            <label for="aluno_bairro" class="col-xs-2 control-label">Bairro:</label>
                            <div class="col-xs-10">
                                <input type="text" class="form-control" id="aluno_bairro" name="aluno_bairro" placeholder="Bairro:" />
                            </div>

                        </div>

                        <div class="form-group">
                            <label for="aluno_numero" class="col-xs-2 control-label">Numero:</label>
                            <div class="col-xs-10">
                                <input type="text" class="form-control" id="aluno_numero" name="aluno_numero" placeholder="Numero:" />
                            </div>

                        </div>

                        <div class="form-group">
                            <label for="aluno_complemento" class="col-xs-2 control-label">Complemento:</label>
                            <div class="col-xs-10">
                                <input type="text" class="form-control" id="aluno_complemento" name="aluno_complemento" placeholder="Complemento:" />
                            </div>

                        </div>

                        <div class="form-group">
                            <label for="aluno_cep" class="col-xs-2 control-label">CEP:</label>
                            <div class="col-xs-10">
                                <input type="text" class="form-control" id="aluno_cep" name="aluno_cep" placeholder="CEP" />
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
                                <select class="form-control" id="aluno_cidade" name="aluno_cidade">
                                    <option value="1">Rio de Janeiro</option>

                                </select>
                            </div>
                        </div>

                    </fieldset>


                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
                    <button type="submit" class="btn btn-primary" >Salvar</button>
                </div>


            </div>
        </div>
    </div>
</form>