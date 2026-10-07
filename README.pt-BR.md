# Calculadoras de Amortização em JSP (SAC, Sistema Americano e Tabela Price)

🇧🇷 Português (tradução de apoio) · 🇬🇧 [Read in English](README.md)

> A versão oficial deste README é a em inglês. Este arquivo é uma tradução de apoio.

![Licença: MIT](https://img.shields.io/badge/license-MIT-green)
![Java 17](https://img.shields.io/badge/Java-17-orange)
![Apache Tomcat 9](https://img.shields.io/badge/Tomcat-9-yellow)
![JSP](https://img.shields.io/badge/JSP-scriptlets-blue)

Aplicação web educacional em JSP com três calculadoras de amortização de empréstimos: **SAC** (amortização constante), **SAA** (sistema americano) e **Tabela Price** (sistema francês). Cada uma mostra parcela, amortização, juros e saldo devedor de todos os meses. Foi um trabalho em equipe da disciplina de Programação Orientada a Objetos (Fatec Praia Grande, 2020/2).

## Funcionalidades

- **SAC**: o principal é pago em partes iguais, então as parcelas começam altas e diminuem.
- **SAA**: durante o prazo só se pagam juros, e todo o principal vem na última parcela.
- **Price**: parcelas constantes; os juros caem e a amortização cresce com o tempo.
- Taxa mensal ou anual (a taxa anual é convertida na taxa mensal equivalente).
- Validação das entradas, para que o demo público não seja usado para gerar tabelas absurdas (limites abaixo).
- Links diretos por parâmetros, por exemplo `amortizacao-constante.jsp?vf=100000&tj=1&nm=12&pt=1`.

## Capturas de tela

<!-- adicionadas após o primeiro deploy -->

## Tecnologias

- Java Server Pages (scriptlets), Apache Tomcat 9, Java 17 (Java 11+ funciona)
- Bootstrap 4.5.2, jQuery e Popper via CDN; ícones SVG embutidos do [Bootstrap Icons](https://icons.getbootstrap.com/) (MIT)
- Projeto NetBeans/Ant; a pasta `lib/` tem bibliotecas fornecidas pelo NetBeans, que mantêm suas próprias licenças

## Como executar

**Docker**

```bash
docker build -t jsp-loan-amortization-calculators .
docker run --rm -p 8080:8080 jsp-loan-amortization-calculators
```

Abra <http://localhost:8080/Proj01_Amortizacao/>.

**Qualquer Tomcat 9**: copie a pasta `Proj01_Amortizacao/web` para `<tomcat>/webapps/Proj01_Amortizacao` e inicie o Tomcat.

**NetBeans**: abra a pasta `Proj01_Amortizacao` como projeto, escolha um servidor Tomcat 9 e execute.

## Estrutura do projeto

```
Proj01_Amortizacao/
  web/                 páginas, folha de estilo, imagem
    WEB-INF/jspf/      fragmentos compartilhados: validação, formulário, resumo, menu, rodapé
  nbproject/, lib/     arquivos do projeto NetBeans/Ant
docs/design/           banner.psd, fonte do banner no Photoshop
docs/screenshots/
Dockerfile, render.yaml
```

A interface e os nomes de arquivos são em português, pois o projeto foi feito para um curso brasileiro. A tabela de equivalência está no [README em inglês](README.md#project-structure).

## Escopo e limitações

- Projeto educacional, não é aconselhamento financeiro. Não considera tarifas, seguros nem impostos.
- Limites: valor até R$ 100.000.000, taxa até 1000%, de 1 a 600 meses. A Tabela Price também recusa combinações extremas de taxa e prazo, em que a aritmética de `double` perderia precisão.
- Os valores são calculados em `double` e arredondados só na exibição, então um total pode diferir em alguns centavos da soma das linhas arredondadas. O saldo final é exibido como zero.
- Toda a lógica está em scriptlets JSP, sem classes Java, como no trabalho original.

## Licença

[MIT](LICENSE) © 2020 Ewerton Souza, Sávio Gois, Victor Leme. Bootstrap, jQuery, Popper e Bootstrap Icons são MIT; as bibliotecas do NetBeans em `Proj01_Amortizacao/lib` mantêm suas licenças originais.
