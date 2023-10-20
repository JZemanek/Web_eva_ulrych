<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="cs-cz">
    <head>
        <!-- CSS -->
        <link rel="stylesheet" href="webjars/bootstrap/5.3.1/css/bootstrap.min.css"/>
        <link href="/css/CenikStyle.css" rel="stylesheet" type="text/css"/>
        <link href="/css/BackgroundCenik.css" rel="stylesheet" type="text/css"/>

        <%@include file="common/Navbar.jspf" %>
        <%@include file="common/MetaZaklad.jspf" %>
        <title>Ceník</title>
        <link rel="icon" href="images/logo2.png"/>
    </head>
    <body>
        <div id="hlavniCast">
            <div class="container col-md-7 py-4">
                <p>
                    Od ledna 2022 se jakožto člen České asociace pro psychoterapii účastním projektu psychosociální podpory,
                    které realizují některé pojišťovny: 111 (VZP), 205 (ČPP), 211 (ZP MV) a další.
                </p>
                <p>
                    Podmínky pro čerpání příspěvků naleznete na jejich webových stránkách.
                </p>
                <p>
                    V případě příspěvku od VZP si před první návštěvou u mě prosím zažádejte o tzv. <b>Poukaz</b>.<br>
                    Více informací zde: <a href="https://dusevnizdravi.vzp.cz/">www.dusevnizdravi.vzp.cz</a>
                </p>
            </div>
            <div class="container col-md-7 py-2">
                <p>
                    Nejsem klinický psycholog (pracovník ve zdravotnictví). Nemám proto smlouvy se zdravotními pojišťovnami.<br>
                    Pracuji v rámci vázané živnosti <i>Psychologické poradenství a diagnostika</i>.
                </p>
            </div>
            <div class="container col-md-4 py-2">
                <table class="table table-responsive">
                    <tbody>
                        <tr>
                            <td>Individuální konzultace - 60 minut</td>
                            <td>1000,- Kč</td>
                        </tr>
                        <tr>
                            <td>Prodloužená konzultace - 90 minut</td>
                            <td>1500,- Kč</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="container col-md-7 py-2">
                <p>
                    V případě, že by ve vaší situaci výše ceny tvořila bariéru pro možnost psychoterapeutickou pomoc využívat, 
                    jsem otevřená jejímu individuálnímu nastavení.
                </p>
                <p>
                    Ceny pro online konzultace jsou stejné. Na konkrétní platformě se domlouváme individuálně.
                </p>
                <div class="container col-md-8 row">
                    <div class="container col-md-4" id="asociaceLogo">
                        <a href="https://czap.cz/" target="_blank">
                            <img src="/images/CAP_odznak_radna_F_web.webp" style="text-right" width="300" alt="řádná členka asociace psychologů"/>
                        </a>
                    </div>
                    <div class="container col-md-4" id="deepsyLogo">
                        <a href="https://www.deepsy.cz/" target="_blank">
                            <img src="/images/deepsy-logo.png" width="300" alt="deepsy"/>
                        </a>
                    </div>
                </div>
            </div>

            <%@include file="common/Footer.jspf" %>
        </div>

        <!-- Scripty -->
        <script src="webjars/jquery/3.7.1/jquery.min.js"></script>
        <script src="webjars/bootstrap/5.3.1/js/bootstrap.min.js"></script>
    </body>
</html>

