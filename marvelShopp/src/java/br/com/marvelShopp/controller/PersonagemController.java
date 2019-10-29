package br.com.marvelShopp.controller;

import br.com.marvelShopp.dao.PersonagemDao;
import br.com.marvelShopp.dao.TipoCategoriaDao;
import br.com.marvelShopp.dao.TipoOcupacaoDao;
import br.com.marvelShopp.dao.TipoSexoDao;
import br.com.marvelShopp.model.Personagem;
import br.com.marvelShopp.model.TipoCategoria;
import br.com.marvelShopp.model.TipoOcupacao;
import br.com.marvelShopp.model.TipoSexo;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author victo
 */
public class PersonagemController extends HttpServlet {
     private TipoSexoDao sexoDao;
     private TipoOcupacaoDao ocupacaoDao;
     private TipoCategoriaDao categoriaDao ;
     private PersonagemDao personagemDao;
    
  public PersonagemController(){
      super();
      sexoDao=new TipoSexoDao();
      ocupacaoDao=new TipoOcupacaoDao();
      categoriaDao=new TipoCategoriaDao();
      personagemDao= new PersonagemDao();
      }
   
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)//cria personagem 
            throws ServletException, IOException {
        
        Personagem persona= new Personagem();
        TipoCategoria categoria = categoriaDao.getById(request.getParameter("categoria"));//pega a categoria
        persona.setCategoria(categoria);
        persona.setDescricao(request.getParameter("descricao"));
        persona.setIdentidade(request.getParameter("identidade"));
        persona.setImagemRef(request.getParameter("imagemRef"));
        persona.setLugar(request.getParameter("lugar"));
        persona.setNomeReal(request.getParameter("nomeReal"));
        TipoOcupacao ocupacao= ocupacaoDao.getById(request.getParameter("ocupacao"));//pega a ocupacao
        persona.setOcupacao(ocupacao);
        persona.setPreco(Double.parseDouble(request.getParameter("preco")));
        persona.setQtdEstoque(Integer.parseInt(request.getParameter("estoque")));
        TipoSexo sexo = sexoDao.getById(request.getParameter("sexo"));//pega o sexo
        persona.setSexo(sexo);
        
        this.personagemDao.create(persona);//cria personagem
        RequestDispatcher view= request.getRequestDispatcher("/cadastroDeProduto.jsp");//redireciona para cadastro de produto
        view.forward(request, response);    
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

}
