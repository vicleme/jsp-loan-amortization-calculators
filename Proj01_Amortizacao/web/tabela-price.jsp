<%--
    Document   : tabela-price

    Price table (French system): constant installments. The interest falls
    and the amortization grows over time, so the installment stays the same.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@include file="WEB-INF/jspf/parametros.jspf" %>
<%
    // Price only: when (1 + rate)^months is huge, the balance recursion loses
    // precision (and can overflow), so such combinations are refused.
    if (erro == null && enviado && Math.pow(1 + tjc, nm) > 1.0E6) {
        erro = "Para a Tabela Price, esta combinação de taxa de juros e prazo é grande demais para ser calculada com precisão.";
    }
%>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <link rel="stylesheet" href="style.css">
        <%@include file="WEB-INF/jspf/head-references.jspf" %>
        <title>Tabela Price</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>

        <h1>Tabela Price</h1>

        <%@include file="WEB-INF/jspf/formulario.jspf" %>

        <%if (!enviado) {%>
        <p class="mensagem">Entre com os valores para gerar a tabela.</p>
        <%} else if (erro != null) {%>
        <p class="mensagem"><%=erro%></p>
        <%} else {
            double salddev = vf;
            double contparc = 0;
            double contamort = 0;
            double contjuros = 0;
            double parc;
            if (tjc == 0) {
                parc = vf / nm; // with a 0% rate the usual formula divides 0 by 0
            } else {
                parc = vf * ((Math.pow(1 + tjc, nm) * tjc) / (Math.pow(1 + tjc, nm) - 1));
            }%>
        <hr>

        <%@include file="WEB-INF/jspf/resumo.jspf" %>

        <table class="tabela">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Parcelas</th>
                    <th scope="col">Amortizações</th>
                    <th scope="col">Juros</th>
                    <th scope="col">Saldos devedores</th>
                </tr>
            </thead>
            <tbody>
                <%for (int i = 1; i <= nm; i++) {
                    double juros = salddev * tjc;
                    double amort = parc - juros;
                    salddev = salddev - amort;
                    if (i == nm) {
                        salddev = 0; // drops floating-point residue (would print as -R$ 0,00)
                    }
                    contparc = contparc + parc;
                    contamort = contamort + amort;
                    contjuros = contjuros + juros;%>
                <tr>
                    <td class="centro"><%=i%></td>
                    <td class="numero"><%=dinheiro.format(parc)%></td>
                    <td class="numero"><%=dinheiro.format(amort)%></td>
                    <td class="numero"><%=dinheiro.format(juros)%></td>
                    <td class="numero"><%=dinheiro.format(salddev)%></td>
                </tr>
                <%}%>
            </tbody>
            <tfoot>
                <tr>
                    <td class="rotulo-total"><strong>Total</strong></td>
                    <td class="numero"><%=dinheiro.format(contparc)%></td>
                    <td class="numero"><%=dinheiro.format(contamort)%></td>
                    <td class="numero"><%=dinheiro.format(contjuros)%></td>
                    <td class="centro">---</td>
                </tr>
            </tfoot>
        </table>
        <%}%>

        <%@include file="WEB-INF/jspf/body-references.jspf" %>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
