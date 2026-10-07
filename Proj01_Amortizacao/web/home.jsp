<%--
    Document   : home
    Created on : 5 de set de 2020, 15:47:41
    Author     : Victor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <link rel="stylesheet" href="style.css">
        <%@include file="WEB-INF/jspf/head-references.jspf" %>
        <title>Calculadoras de Amortização</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <div id="container">
            <h1>Calculadoras de Amortização</h1>
            <hr>
            <img alt="Banner com casa, calculadora e cifrões" src="images/banner.jpg"><br><br>
            <p>Estas calculadoras de amortização permitem estimar pagamentos periódicos de empréstimos e financiamentos, exibindo os valores das parcelas, das amortizações, dos juros e dos saldos devedores a partir dos valores dos empréstimos, das taxas de juros, da periodicidade dos juros e dos prazos.</p>
            <br>
            <table class="fluxo">
                <tr>
                    <td><p class="h4">Empréstimo</p></td>
                    <td rowspan="4"><div class="seta h1"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-right-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                            <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-11.5.5a.5.5 0 0 1 0-1h5.793L8.146 5.354a.5.5 0 1 1 .708-.708l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L10.293 8.5H4.5z"/>
                            </svg></div></td>
                    <td><p class="h4">Parcelas</p></td>
                </tr>
                <tr>
                    <td><p class="h4">Taxa de juros</p></td>
                    <td><p class="h4">Amortizações</p></td>
                </tr>
                <tr>
                    <td><p class="h4">Periodicidade dos juros</p></td>
                    <td><p class="h4">Juros</p></td>
                </tr>
                <tr>
                    <td><p class="h4">Prazo</p></td>
                    <td><p class="h4">Saldos devedores</p></td>
                </tr>
            </table>
        </div>
        <br>
        <%@include file="WEB-INF/jspf/body-references.jspf" %>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
