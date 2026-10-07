<%--
    Document   : amortizacao-americana

    SAA (Sistema de Amortização Americano): only interest is paid during the
    term, and the whole principal is repaid in the last installment.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@include file="WEB-INF/jspf/parametros.jspf" %>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <link rel="stylesheet" href="style.css">
        <%@include file="WEB-INF/jspf/head-references.jspf" %>
        <title>Tabela SAA</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf" %>

        <h1>Tabela SAA</h1>

        <%@include file="WEB-INF/jspf/formulario.jspf" %>

        <%if (!enviado) {%>
        <p class="mensagem">Entre com os valores para gerar a tabela.</p>
        <%} else if (erro != null) {%>
        <p class="mensagem"><%=erro%></p>
        <%} else {
            double salddev = vf;
            double contparc = 0;
            double contamort = 0;
            double contjuros = 0;%>
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
                    double amort = 0;
                    if (i == nm) {
                        amort = vf; // the whole principal is repaid in the last installment
                        salddev = 0;
                    }
                    double parc = amort + juros;
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
