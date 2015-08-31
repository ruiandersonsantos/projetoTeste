/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.ruianderson.command;

import br.com.ruianderson.dbutil.Conexao;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Rui
 */
public interface Command {
    
    public String execute(HttpServletRequest request, Conexao conect);
}
