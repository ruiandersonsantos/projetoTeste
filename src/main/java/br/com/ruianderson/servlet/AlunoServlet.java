/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ruianderson.servlet;

import br.com.ruianderson.arrays.OpcaoTRANSACAO;
import br.com.ruianderson.command.AlunoCommand;
import br.com.ruianderson.command.Command;
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
@WebServlet(name = "AlunoServlet", urlPatterns = {"/alunos"})
public class AlunoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private Map<String, Command> comandos = new HashMap<String, Command>();

    @Override
    public void init() throws ServletException {
        comandos.put("listarAlunos", new AlunoCommand());
        comandos.put("cadastrarAlunos", new AlunoCommand());
        comandos.put("preparaUpdate", new AlunoCommand());
        comandos.put("delete", new AlunoCommand());

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Conexao conect = null;

        try {

            conect = TransationSRV.begin(OpcaoTRANSACAO.COM_TRANSACAO);
            String acao = request.getParameter("acao");

            String proxima = null;

            Command comando = verificarComando(acao);
            proxima = comando.execute(request, conect);
            request.getRequestDispatcher(proxima).forward(request, response);

            TransationSRV.commit(conect);

        } catch (IOException | ClassNotFoundException | SQLException ex) {
            try {
                TransationSRV.rollback(conect);
            } catch (ClassNotFoundException ex1) {
                Logger.getLogger(AlunoServlet.class.getName()).log(Level.SEVERE, null, ex1);
            } catch (SQLException ex1) {
                Logger.getLogger(AlunoServlet.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(AlunoServlet.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         Conexao conect = null;

        try {

            conect = TransationSRV.begin(OpcaoTRANSACAO.COM_TRANSACAO);
            String acao = request.getParameter("acao");

            String proxima = null;

                Command comando = verificarComando(acao);
                proxima = comando.execute(request, conect);
                TransationSRV.commit(conect);
                //request.getRequestDispatcher(proxima).forward(request, response);
                response.sendRedirect("/projetoTeste/alunos?acao=listarAlunos");

         

        }catch (IOException | ClassNotFoundException | SQLException ex) {
             try {
                 TransationSRV.rollback(conect);
             } catch (ClassNotFoundException ex1) {
                 Logger.getLogger(AlunoServlet.class.getName()).log(Level.SEVERE, null, ex1);
             } catch (SQLException ex1) {
                 Logger.getLogger(AlunoServlet.class.getName()).log(Level.SEVERE, null, ex1);
             }
            Logger.getLogger(AlunoServlet.class.getName()).log(Level.SEVERE, null, ex);

        }
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
