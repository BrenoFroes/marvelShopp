package br.com.marvelShopp.controller;

import br.com.marvelShopp.dao.TipoCategoriaDao;
import br.com.marvelShopp.model.TipoCategoria;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Gleison
 */
@WebServlet(name = "TipoCategoriaController", urlPatterns = {"/TipoCategoriaController"})
public class TipoCategoriaController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{//deleta a categoria
       
        String id = request.getParameter("idTCat");
        TipoCategoriaDao tipoDao = new TipoCategoriaDao();
        tipoDao.delete(id);
        response.sendRedirect("tipoCategoria.jsp");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{//cria categoria
       
        TipoCategoria tc = new TipoCategoria();
        tc.setNome(request.getParameter("tCat"));
        TipoCategoriaDao tcDao = new TipoCategoriaDao();
        tcDao.create(tc);
        response.sendRedirect("tipoCategoria.jsp");
    }

}
