<%-- 
    Document   : header
    Created on : 15/09/2019, 21:13:24
    Author     : Victor
--%>

<%@page import="br.com.marvelShopp.model.Item"%>
<%@page import="br.com.marvelShopp.model.Carrinho"%>
<%@page import="br.com.marvelShopp.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/css_bootstrap/bootstrap.min.css" />
    <% Usuario login = (Usuario)request.getSession().getAttribute("user");%>
    <header id="cabecalho">                
        <a href="index.jsp"><img id="logo" src="imagens/logo.PNG"/></a> 
        <nav id="menu">
            <ul >
                <li><a href="index.jsp">Home</a></li>
                <li><a href="#">Produtos</a>
                    <ul>
                        <li><a href="#">Ocupação</a>
                            <ul>
                                <li><a href="/marvelShopp/BuscaController?busca=heroi">Herói</a></li>
                                <li><a href="/marvelShopp/BuscaController?busca=anti-heroi">Anti-Herói</a></li>
                                <li><a href="/marvelShopp/BuscaController?busca=vilao">Vilão</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Categoria</a>
                            <ul>
                                <li><a href="/marvelShopp/BuscaController?busca=cosmico">Cósmico</a></li>
                                <li><a href="/marvelShopp/BuscaController?busca=habilidade">Habilidade</a></li>
                                <li><a href="/marvelShopp/BuscaController?busca=mistico">Místico</a></li>
                                <li><a href="/marvelShopp/BuscaController?busca=mutante">Mutante</a></li>
                                <li><a href="/marvelShopp/BuscaController?busca=tecnologia">Tecnologia</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Sexo</a>
                            <ul>
                                <li><a href="/marvelShopp/BuscaController?busca=masculino">Masculino</a></li>
                                <li><a href="/marvelShopp/BuscaController?busca=feminino">Feminino</a></li>
                                <li><a href="/marvelShopp/BuscaController?busca=indeterminado">Indeterminado</a></li>
                            </ul>
                        </li>
                    </ul>

                </li>
                <li><a href="top6.jsp">Top 6</a></li>
                <% if(login != null){%>
                <% Usuario user = (Usuario)request.getSession().getAttribute("user"); %>
                    <li><a><%= user.getNome() %></a>
                        <ul>
                            <li><a href="listaFavoritos.jsp">Favoritos</a></li>
                            <li><a href="editarUsuario.jsp">Editar Dados</a></li>
                            <li><a href="enderecoUsuario.jsp">Meus Endereços</a></li>
                            <li><a href="pedidosUsuario.jsp">Meus Pedidos</a></li>
                            <% if(user.getHasAdm()){ %>
                            <li><a href="cadastroDeProduto.jsp">Cadastrar Produto</a></li>
                            <li><a href="tipoOcupacao.jsp">Cadastrar Ocupação</a></li>
                            <li><a href="tipoCategoria.jsp">Cadastrar Categoria</a></li>
                            <li><a href="tipoSexo.jsp">Cadastrar Sexo</a></li>
                            <li><a href="listaadmin.jsp">Listar Produtos</a></li>                            
                            <% } %>
                            <li><a method="GET" href="LoginController">Logout</a></li>
                        </ul>

                    </li>
                <%}else{%>
                    <li><a href="login.jsp">Login</a></li>
                <%} %>
            </ul>
            <form  action="BuscaController" method="GET" id= "busca">
                <div class="form-group row">
                    <div class="col-sm-10">
                        <input class="form-control" type="search" id="busca" name="busca" placeholder="Buscar">
                    </div>
                    <button type="submit" class="btn btn-primary" style="background: #000">Buscar</button>
                </div>
            </form>
            <a href='/marvelShopp/CarrinhoController'>
                <% Carrinho car = (Carrinho)request.getSession().getAttribute("carrinho");
                    int total=0;
                    if(car == null){%>
                <img id='carrinho' class="carrinho-img" src="imagens/carrinhoDeCompras.png" title="Carrinho" width="10%"/>
                <%}else{%>
                <img id='carrinho' class="carrinho-img" src="imagens/carrinhoDeComprasC.png" title="Carrinho" width="10%"/>
                <%for(Item item : car.getItens()){total+=item.getQtd();}%>
                <div style="position:absolute;left: 87%;top: -18px;"><%=total%> Itens</div>
                <%}%>
            </a> 
        </nav>
                           
        
    </header>     
</html>
