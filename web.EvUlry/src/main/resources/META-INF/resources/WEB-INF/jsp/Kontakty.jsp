<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="cs-cz">
    <head>
        <!-- CSS -->
        <link rel="stylesheet" href="webjars/bootstrap/5.3.1/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/BackgroundKontakty.css" type="text/css"/>
        <link rel="stylesheet" href="css/KontaktyStyle.css" type="text/css"/>

        <%@include file="common/Navbar.jspf" %>
        <%@include file="common/MetaZaklad.jspf" %>
        <title>Kontakty</title>
        <link rel="icon" href="images/logo.svg"/>
    </head>
    <body>

        <c:if test="${not empty uspesneOdeslano}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${uspesneOdeslano}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <div class="row py-4 m" id="hlavniCast">
            <div class="container col-md-8 text-center py-2">
                <p style="font-size: 1.4rem">
                    Aktuálně přijímám nové klienty pro spolupráci v Holicích na náměstí T. G. Masaryka i v Pardubicích.
                </p>
            </div>
            <div class="row" style="padding-top: 4%">
                <div class="container col-md-5" id="prvniSloupecFormular">

                    <form method="post" action="/odeslat-email">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label" for="jmenoBunka">Jméno</label>
                                <input class="form-control" type="text" id="jmenoBunka" name="jmeno" placeholder="Jan"required="">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label" for="prijmeniBunka">Příjmení</label>
                                <input class="form-control" type="text" id="prijmeniBunka" name="prijmeni" placeholder="Novák" required="">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label" for="emailBunka">E-mail</label>
                                <input class="form-control" type="text" id="emailBunka" name="email" placeholder="jan.novak@email.cz" required="">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label" for="telBunka">Telfonní číslo</label>
                                <input class="form-control" value="" type="text" id="telBunka" name="telefon" required placeholder="123456789">
                            </div>
                            <div class="col-md-12 mb-3">
                                <label class="form-label" for="zpravaTextArea">Zpráva</label>
                                <textarea class="form-control" id="zpravaTextArea" name="zprava" placeholder="Zde napište svou zprávu" rows="5"></textarea>
                            </div>
                            <div>
                                <input class="btn btn-outline-primary"  id="odeslatBtn" 
                                       type="submit"/>
                            </div>
                        </div>

                    </form>

                </div>
                <div class="container col-md-4" id="druhySloupecInfo">
                    <div>
                        <p>
                            <strong>Mgr. Eva Ulrychová</strong><br>
                        </p>
                        <p>
                            <b>IČ:</b> 06586651
                        </p>
                    </div>
                    <hr>
                    <p>
                        <img src="images/phone.svg" alt="Eva ulrychová telefon"/>
                        &nbsp;&nbsp;
                        <strong>+420 605 934 287</strong>
                    </p>
                    <hr>
                    <p>
                        <img src="images/mail.svg" alt="Eva ulrychová email"/>
                        &nbsp;&nbsp;
                        <strong>e.ulrychova@email.cz</strong>
                    </p>

                    <p>Náměstí T.G. Masaryka 24, Holice v Čechách</p>
                    <p>
                        <a href="https://maps.app.goo.gl/ooDhSxGz8H2S4fqQ8" target="_blank">
                            <img src="/images/map-holice-google.png" width="500"/>
                        </a>
                    </p>
                    <p>Holubova 713, Pardubice</p>
                    <p>
                        <a href="https://maps.app.goo.gl/xwUoeGQ3GEgZJsr87" target="_blank">
                            <img src="images/map-pce-google.png" width="500"/>
                        </a>
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
