<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="cs-cz">
    <head>
        <!-- CSS -->
        <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/css/bootstrap.min.css"/>
        <link href="/css/PridatKlientaStyle.css" rel="stylesheet" type="text/css"/>

        <!-- Meta a navbar -->
        <%@include file="common/MetaZaklad.jspf" %>
        <%@include file="common/NavbarAdministrace.jspf" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Přidat klienta</title>
    </head>
    <body>
        <div class="container col-md-6 py-4" id="formularContent">
            <form class="form-group" action="/administrace/novy-klient" method="post" id="formular">
                <div class="row justify-content-center" id="prvniRadek">

                    <div class="col-md-5">
                        <label for="jmeno" class="form-label">Jméno</label>
                        <input class="form-control" type="text" name="jmeno" id="jmeno">
                    </div>

                    <div class="col-md-5">
                        <label for="prijmeni" class="form-label">Příjmení</label>
                        <input class="form-control" type="text" name="prijmeni" id="prijmeni">
                    </div>
                </div>
                <div class="row justify-content-center" id="druhyRadek">

                    <div class="col-md-5 py-2">
                        <label for="email" class="form-label">E-mail</label>
                        <input class="form-control" type="text" name="email" id="email" autocomplete="on">
                    </div>

                    <div class="col-md-5 py-2">
                        <label for="telCislo" class="form-label">Telefonní číslo</label>
                        <input class="form-control" type="text" name="telCislo" id="telCislo">
                    </div>
                </div>
                <div class="row justify-content-center" id="tretiRadek">

                    <div class="col-md-5 py-2">
                        <label for="prvniSchuzka" class="form-label">První návštěva</label>
                        <input class="form-control" type="date" name="prvniSchuzka" id="prvniSchuzka">
                    </div>

                    <div class="col-md-5 py-2">
                        <label for="posledniSchuzka" class="form-label">Poslední návštěva</label>
                        <input class="form-control" type="datetime-local" name="posledniSchuzka" id="posledniSchuzka">
                    </div>
                </div>
                <div class="row justify-content-center" id="ctvrtyRadek">

                    <div class="col-md-5 py-2">
                        <label for="pristiSchuzka" class="form-label">Příští návštěva</label>
                        <input class="form-control" type="datetime-local" name="pristiSchuzka" id="pristiSchuzka">
                    </div>

                    <div class="col-md-5 py-2">
                        <label for="pohlavi" class="form-label">Pohlaví</label>
                        <select class="form-select" name="pohlavi" id="pohlavi"> 
                            <option value="Muž">Muž</option>
                            <option value="Žena">Žena</option>
                        </select>
                    </div>
                </div>

                <div id="patyRadek">
                    <div class="col-md-5" id="odeslatBtnContent">
                        <button type="submit" class="btn btn-success" id="odeslatBtn">Přidat klienta</button>
                    </div>
                </div>
            </form>
        </div>

        <!-- Footer a scripty -->
        <div id="footer">
            <%@include file="common/Footer.jspf" %>
        </div>
        <script src="/webjars/jquery/3.7.1/jquery.min.js"></script>
        <script src="/webjars/bootstrap/5.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
