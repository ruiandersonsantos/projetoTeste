/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ruianderson.command;

import br.com.ruianderson.arrays.OpcaoDAO;
import br.com.ruianderson.arrays.OpcaoSTATUS;
import br.com.ruianderson.arrays.OpcaoTRANSACAO;
import br.com.ruianderson.dbutil.Conexao;
import br.com.ruianderson.model.Academia;
import br.com.ruianderson.model.Aluno;
import br.com.ruianderson.model.Cidade;
import br.com.ruianderson.model.Endereco;
import br.com.ruianderson.model.Matricula;
import br.com.ruianderson.servicos.AlunoSRV;
import br.com.ruianderson.servicos.EnderecoSRV;
import br.com.ruianderson.servicos.MatriculaSRV;
import br.com.ruianderson.servicos.TransationSRV;
import br.com.ruianderson.servlet.LoginServlet;
import br.com.ruianderson.utilitarios.Obj_gen;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Rui
 */
public class AlunoCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, Conexao conect) {
        String acao = request.getParameter("acao");

        String proxima = "";
        if ("listarAlunos".equals(acao)) {
            proxima = listarAlunos(request);
        }

        if ("cadastrarAlunos".equals(acao)) {
            proxima = cadastrarAlunos(request, conect);
        }

        if ("preparaUpdate".equals(acao)) {
            proxima = preparaAluno(request, conect);
        }

        return proxima;
    }

    private String preparaAluno(HttpServletRequest request, Conexao conect) {
        String proxima = "";
        
        int id_aluno = 0;
        id_aluno = Integer.parseInt(request.getParameter("id"));
         Aluno aluno = null;
         Endereco endereco = null;
        
        if(id_aluno > 0){
           
            aluno =  AlunoSRV.localizarAlunoPorId(conect, id_aluno);
                      
            endereco =  EnderecoSRV.localizarEnderecoPorIdDoAluno(conect, id_aluno, 1);
            
            request.setAttribute("aluno", aluno);
            request.setAttribute("endereco", endereco);
                       
            proxima = "/restrito/atualizaAluno.jsp";
            
        }
                
        
        return proxima;
    }

    private String cadastrarAlunos(HttpServletRequest request, Conexao conect) {
        String proxima = "";
        try {

            Aluno usr = new Aluno();
            Endereco end = new Endereco();
            Cidade cidade = new Cidade();
            Academia academia = new Academia();

            cidade.setId(1);
            academia.setId(1);

            usr.setNome(request.getParameter("aluno_nome"));
            usr.setTelefone(request.getParameter("aluno_telefone"));
            usr.setCelular(request.getParameter("aluno_celular"));
            usr.setEmail(request.getParameter("aluno_email"));
            usr.setDtNascimento(Obj_gen.convertStringToSqlDate(request.getParameter("aluno_dtNascimento")));
            usr.setSexo(request.getParameter("aluno_sexo"));
            usr.setAcademia(academia);

            int id_aluno = 0;
            id_aluno = AlunoSRV.mergeAluno(conect, OpcaoDAO.ADICIONAR, usr);

            if (id_aluno > 0) {
                int id_endereco = 0;
                usr.setId(id_aluno);

                end.setLogradouro(request.getParameter("aluno_logradouro"));
                end.setBairro(request.getParameter("aluno_bairro"));
                end.setNumero(Integer.parseInt(request.getParameter("aluno_numero")));
                end.setComplemento(request.getParameter("aluno_complemento"));
                end.setCep(request.getParameter("aluno_cep"));
                end.setAcademiaId(academia);
                end.setCidadeId(cidade);
                end.setAlunoId(usr);

                id_endereco = EnderecoSRV.mergeEndereco(conect, OpcaoDAO.ADICIONAR, end);

                if (id_endereco > 0) {

                    Matricula matricula = new Matricula();
                    matricula.setId(id_aluno);
                    matricula.setAcademia(academia);
                    matricula.setAluno(usr);
                    matricula.setDtMatricula(Obj_gen.convertStringToSqlDate("2015/08/28"));
                    matricula.setObservacao("Teste de inserte geral");
                    matricula.setStatus(OpcaoSTATUS.ATIVO.getValor());

                    int id_matricula = 0;
                    id_matricula = MatriculaSRV.mergeMatricula(conect, OpcaoDAO.ADICIONAR, matricula);

                    if (id_matricula > 0) {
                        proxima = listarAlunos(request);;

                    } else {
                        System.out.println("Problema Adicionando matricula.");

                    }

                } else {
                    System.out.println("Problema Adicionando endereco.");
                    TransationSRV.rollback(conect);
                }
            } else {
                System.out.println("Problema Adicionando aluno.");
                TransationSRV.rollback(conect);
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AlunoCommand.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AlunoCommand.class.getName()).log(Level.SEVERE, null, ex);
        }

        return proxima;
    }

    private String listarAlunos(HttpServletRequest request) {
        String proxima = "";

        try {
            Conexao conect = TransationSRV.begin(OpcaoTRANSACAO.SEM_TRANSACAO);
            List<Aluno> lista = null;
            lista = AlunoSRV.listarAlunos(conect, 1);

            if (lista != null) {
                request.getSession().setAttribute("listaDeAluno", lista);
                proxima = "/restrito/alunos.jsp";
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);

        }

        return proxima;
    }

}
