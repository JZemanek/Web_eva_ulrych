<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="cs-cz">
    <head>
        <!-- CSS -->
        <link rel="stylesheet" href="webjars/bootstrap/5.3.1/css/bootstrap.min.css"/>
        <link href="css/HomepageStyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/BackgroundHory.css" rel="stylesheet" type="text/css"/>

        <%@include file="common/Navbar.jspf" %>
        <%@include file="common/MetaZaklad.jspf"%>
        <title>Úvod</title>
        <link rel="icon" href="images/logo.svg"/>
    </head>
    <body>
        <div class="text-white text-right" id="uvodText">
            <h1>Psychologické<br>poradenství & psychoterapie</h1>
            <h2>v duchu gestalt přístupu</h2>
        </div>

        <div id="spodniCast">
            <div style="font-size: 1.8rem;">
                <p class="text-dark text-center py-4">Jsem pro vás k dispozici pro osobní setkání<br>i pro videohovory.</p>
                <p class="text-dark text-center">Těším se na naše setkání</p>
            </div>
            <div class="container-fluid row" style="padding-top: 4%">
                <div class="container col-md-6 text-center" id="infoSloupecPrvni">
                    <p style="font-size: 1.8rem">Kde se můžeme sejít?</p>
                    <p>Aktuálně mě naleznete na dvou místech.</p>
                    <p>Nám. T. G. Masaryka 24 (Zemánkova vila), Holice v Čechách</p>
                    <p>Holubova 713, Pardubice (budova Fyzioterapie Holubova)</p>
                </div>
                <div class="container col-md-6 text-center" id="infoSloupecDruhy">
                    <p style="font-size: 1.8rem">Kdy se můžeme sejít?</p>
                    <p>Máte-li zájem o terapii, zašlete mi prosím na e-mail kontaktní údaje 
                        a informaci o Vašich časových možnostech.
                        Jakmile se objeví vhodná možnost, budu Vás kontaktovat.
                    </p>
                    <p>Přejete-li domluvit se spíše telefonicky, 
                        může být někdy obtížné mě zastihnout. Zavolám případně zpět.
                    </p>
                </div>
            </div>
            <%@include file="common/Footer.jspf" %>
        </div>  

        <!-- Scripty -->
        <script src="webjars/jquery/3.7.1/jquery.min.js"></script>
        <script src="webjars/bootstrap/5.3.1/js/bootstrap.min.js"></script>
    </body>
</html>

