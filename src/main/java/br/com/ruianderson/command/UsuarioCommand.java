/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ruianderson.command;

import br.com.ruianderson.dbutil.Conexao;
import br.com.ruianderson.model.Usuario;
import br.com.ruianderson.servicos.UsuarioSRV;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Rui
 */
public class UsuarioCommand implements Command {

    @Override
    public String execute(HttpServletRequest request, Conexao conect) {

        String acao = request.getParameter("acao");
        String proxima = "";

        if ("logar".equals(acao)) {
            String login = request.getParameter("inputLogin");
            String senha = request.getParameter("inputSenha");

            Usuario usr = null;
            usr = UsuarioSRV.logar(login, senha, 1, conect);
            if (usr != null) {
                System.out.println("Usuario logado");
                proxima = "restrito/index.jsp";
                request.getSession().setAttribute("usuario", usr);
                
            }

        }
        return proxima;
    }

}
