<%-- 
    Document   : listaprodutos
    Created on : 16/10/2019, 20:16:36
    Author     : victo
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="br.com.marvelShopp.model.Personagem"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="br.com.marvelShopp.utilitarios.Conexao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Marvel Shopp</title>
        <link rel="icon" type="imagem/png" href="imagens/deadpoolLogo.png" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css" /> 
    </head>
    <body>
        <% Usuario loginUser = (Usuario)request.getSession().getAttribute("user");%>
        <div id="interface">
            <%@ include file="header.jsp"%>
            <h1 align="center">Lista de produtos</h1>
            
            <%
               // int limite=6;
                //String numpagina=request.getParameter("numpagina");
//                if(numpagina==null){
//                numpagina="1";
//                }
//                int offset=(Integer.parseInt(numpagina)*limite)-limite;
                String busca = (String)request.getAttribute("busca");
                List<Personagem> lista = (List<Personagem>)request.getAttribute("lista");
//                 int limitf= offset+limite; 
//                if(limitf > lista.size()){
//                  limitf= lista.size();
//                }
               out.print("<div class='container'>");
                out.print("<div class='row'>");
                for(Personagem perso : lista){
//                    Personagem perso=lista.get(i);
                   
                   out.print("<div class='col-sm-4 listspace'>"+
                                "<div class='card' style='width: 18rem;'>"+
                                    "<hr><img class='card-img-top' src='imagens/"+perso.getImagemRef()+"' width=150px height=230px alt='Card image cap'>"+
                                    "<div class='card-body'>"+
                                        "<h5 class='card-title'>"+perso.getIdentidade()+"</h5>");
    if(perso.getQtdEstoque()<1){
       out.print("<p class='card-text' style='color: red;'>Personagem indisponível</p>"); 
    }else{             
        out.print("<p class='card-text'>"+"R$"+perso.getPreco()+"</p>");
    }
    out.print("<a href='/marvelShopp/PagProdutoController?id="+perso.getId()+"' class='btn btn-primary'>Visualizar</a>"+
  "</div>"+
"</div></div>");
                  
               }
           out.print("</div>"+"</div>");
               //out.println("<a href=listaprodutos.jsp?numpagina=1>1</a>");
               //out.println("<a href=listaprodutos.jsp?numpagina=2>2</a>");
               //out.println("<a href=listaprodutos.jsp?numpagina=3>3</a><br>");
                Integer limit = (Integer)request.getAttribute("limit");
                Integer numPagina = (Integer)request.getAttribute("qtdBusca");
                int totalpaginas= numPagina/limit;
                
               out.println( "<hr><nav aria-label='Page navigation example' align='center'><nav aria-label='Page navigation example'>");
               out.println("<ul class='pagination list'>");
             for(int j=1;j<=totalpaginas;j++){
                 out.println("<li class='page-item'><a  class='page-link'href='BuscaController?busca="+busca+"&numpagina="+j+"'>"+j+"</a></li>");
             }
             out.println("</ul></nav></nav><hr>");
                
                %>
         <%@ include  file="footer.jsp"%>      
        </div>
        
    </body>
</html>
