/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ruianderson.servlet;


import br.com.ruianderson.arrays.OpcaoTRANSACAO;
import br.com.ruianderson.command.Command;
import br.com.ruianderson.command.UsuarioCommand;
import br.com.ruianderson.dbutil.Conexao;
import br.com.ruianderson.servicos.TransationSRV;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rui
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/Login"})
public class LoginServlet extends HttpServlet {

    private Map<String, Command> comandos = new HashMap<String, Command>();

    @Override
    public void init() throws ServletException {
        comandos.put("logar", new UsuarioCommand());

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            
            Conexao conect = TransationSRV.begin(OpcaoTRANSACAO.SEM_TRANSACAO);
            String acao = request.getParameter("acao");
            String proxima = null;
            
            try {
                Command comando = verificarComando(acao);
                proxima = comando.execute(request,conect);
                
            } catch (Exception e) {
                request.setAttribute("msgErro", e.getMessage());
                
            }
            
            request.getRequestDispatcher(proxima).forward(request, response);
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);

        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    //Metodo monta o comando dinamicamente
    private Command verificarComando(String acao) {
        Command comando = null;

        for (String key : comandos.keySet()) {
            if (key.equalsIgnoreCase(acao)) {
                comando = comandos.get(key);
            }
        }

        return comando;
    }

}
