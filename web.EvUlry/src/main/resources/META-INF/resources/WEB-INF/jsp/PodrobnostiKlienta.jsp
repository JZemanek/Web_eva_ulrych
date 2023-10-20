<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!doctype html>

<html lang="cs-cz">
    <head>
        <!-- CSS -->
        <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/css/bootstrap.min.css"/>
        <link href="/css/PodrobnostiKlientaStyle.css" rel="stylesheet" type="text/css"/>

        <!-- Meta a navbar -->
        <%@include file="common/MetaZaklad.jspf" %>
        <%@include file="common/NavbarAdministrace.jspf" %>

        <title>Klient</title>
    </head>
    <body>
        <!-- Alert v případě úspěšného odstranění poznámky -->
        <c:if test="${!empty SuccesNoteDelete}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${SuccesNoteDelete}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
        <!-- Hlavní obsah -->
        <div class="row">
            <div class="col-md-6 d-flex flex-column">
                <div class="table-responsive table-bordered py-4 mx-4" id="tableContent">
                    <h3 class="mx-4">Klient #${klient.id}</h3>
                    <!-- Začátek tabulky s informacemi -->
                    <table class="table table-hover">
                        <tr>
                            <th>Jméno</th>
                            <td>${klient.jmeno}</td>
                        </tr>
                        <tr>
                            <th>Příjmení</th>
                            <td>${klient.prijmeni}</td>
                        </tr>
                        <tr>
                            <th>E-mail</th>
                            <td>${klient.email}</td>
                        </tr>
                        <tr>
                            <th>Tel číslo</th>
                            <td>${klient.telCislo}</td>
                        </tr>
                        <tr>
                            <th>Pohlaví</th>
                            <td>${klient.pohlavi}</td>
                        </tr>
                        <tr>
                            <th>První schůzka</th>
                            <td>${klient.prvniSchuzka}</td>
                        </tr>
                        <tr>
                            <th>Poslední schůzka</th>
                            <td>${klient.posledniSchuzka}</td>
                        </tr>
                        <tr>
                            <th>Příští schůzka</th>
                            <td>${klient.pristiSchuzka}</td>
                        </tr>
                    </table>
                    <!-- Konec tabulky -->
                </div>
                <!-- Tlačítka pro smazání a úpravy -->
                <div class="mx-3 d-flex " id="tableBtnsContent">
                    <!-- Upravení -->
                    <button data-bs-toggle="modal" data-bs-target="#upravitKlientaModal" class="btn btn-warning" 
                            id="upravitKlientaBtn">Upravit klienta</button>
                    <!-- Odstranění -->
                    <form method="post" action="/administrace/odstranit-klienta/${klient.id}"
                          onsubmit="return confirm('Opravdu chcete odstranit klienta?\nDojde k odstranění veškerých dat spojených s tímto klintem.');">
                        <input hidden="" type="text" name="id" value="${klient.id}">
                        <button class="btn btn-danger mx-2" type="submit">Odstranit klienta</button>
                    </form>
                    <!-- Změna datumu -->
                    <button data-bs-toggle="modal" data-bs-target="#zmenaDatumuModal" class="btn btn-info px-2" 
                            id="zmenaDatumuBtn">Datum příští schůzky</button>
                </div>
            </div>

            <div class="col-md-5 d-flex flex-column">
                <!-- Karta s pozámkou -->
                <c:forEach items="${seznamPoznamek}" var="poznamka">
                    <div class="card my-4">
                        <div class="card-header py-1 d-flex ">
                            Datum sezení: ${poznamka.datumSezeni}
                            <!-- Tlačítko pro odstranění poznámky -->
                            <form method="post" action="/administrace/odstranit-poznamku/${klient.id}/${poznamka.idPoznamky}">
                                <button class="btn btn-sm btn-danger py-0" id="odstranitBtnPoznamka" type="submit" >Odstranit</button>
                            </form>
                        </div>
                        <div class="card-body">
                            <div class="card-text">
                                ${poznamka.text}
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <!-- Konec karty -->
                <!-- Pagination pro přechod mezi pozámkami -->
                <nav>
                    <ul class="pagination justify-content-center">
                        <li class="page-item ${stranka <= 1 ? 'disabled' : ''}">
                            <a class="page-link" href="/administrace/podrobnosti-klienta/${klient.id}?stranka=${stranka - 1}" aria-label="Předchozí">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item ${stranka >= maxStranek ? 'disabled' : ''}">
                            <a class="page-link" href="/administrace/podrobnosti-klienta/${klient.id}?stranka=${stranka + 1}" aria-label="Další">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>

                    </ul>
                </nav>
                <!-- Konec paginationu -->
                <!-- Tlačítko pro vytvoření nové poznámky -->
                <div class="text-end" id="novaPoznamkaBtnContent">
                    <button class="btn btn-warning" data-bs-toggle="modal" data-bs-target="#pridatPoznamkuModal" id="novaPoznamkaBtn">
                        Přidat poznámku</button>
                </div>
            </div>  
        </div>  
                                
                                <!-- MODALY -->
                                <!-- Modal pro změnu data -->
        <div class="modal fade" id="zmenaDatumuModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="zmenaDatumuModalLabel">Nastavení datumu schůzky</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="/administrace/zmenit-datum/${klient.id}">

                            <label class="form-label" for="pristiSchuzka">Příští návštěva</label>
                            <input class="form-control" type="datetime-local" name="pristiSchuzka" id="pristiSchuzka" required="">

                            <label class="form-label my-2" for="posledniSchuzka">Poslední návštěva</label>
                            <input class="form-control py-2" type="datetime-local" name="posledniSchuzka" id="posledniSchuzkaField">

                            <div class="form-check py-4">
                                <label class="form-check-label" for="checkboxDatumPrevod">Převést datum</label>
                                <input class="form-check-input" type="checkbox" name="prevestDatum" value="on" id="checkboxDatumPrevod"/>
                            </div>

                            <input hidden="" type="text" name="id" value="${klient.id}">
                            <div class="text-end mx-4">
                                <button type="submit" class="btn btn-success my-4">Odeslat</button>
                            </div>
                            
                        </form>
                    </div>
                    <div class="modal-footer">
                        <p>
                            <small>
                                Při zaškrtnutí "Převést datum", bude automaticky aktualizované datum poslední schůzky.
                            </small>
                        </p>
                    </div>
                </div>
            </div>
        </div>

                            <!-- Modal pro úpravu klienta -->
        <div class="modal fade" id="upravitKlientaModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="upravitKlientaModalTittle">Upravení klienta</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="/administrace/upravit-klienta/${klient.id}">
                            <div class="row justify-content-center">
                                
                                <div class="col-md-5">
                                    <label for="jmeno" class="form-label">Jméno</label>
                                    <input class="form-control" type="text" name="jmeno" id="jmeno" >
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
                                    <label for="pohlavi" class="form-label">Pohlaví</label>
                                    <select class="form-select" name="pohlavi" id="pohlavi"> 
                                        <option value="Muž">Muž</option>
                                        <option value="Žena">Žena</option>
                                    </select>
                                </div>
                            </div>

                            <div id="patyRadek">
                                <div class="col-md-10 py-4 text-end" id="odeslatBtnContent">
                                    <button type="submit" class="btn btn-success" id="odeslatBtn">Odeslat</button>
                                </div>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer justify-content-start">
                        <small>Veškeré provedené změny jsou nevratné.</small>
                    </div>
                </div>
            </div>
        </div>

                            <!-- Modal pro vytvoření poznámky -->
        <div class="modal fade" id="pridatPoznamkuModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="pridatPoznamkuModalTittl">Nová poznámka</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form method="post" action="/administrace/pridat-poznamku/${klient.id}">
                            
                            <div class="mb-3">
                                <label class="form-label my-2" for="textPoznamky">Text</label>
                                <textarea class="form-control py-2" name="textPoznamky" id="textPoznamky" required></textarea>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label" for="datumSezeni">Datum sezení</label>
                                <input class="form-control" type="date" name="datumSezeni" id="datumSezeni">
                            </div>
                            
                            <div class="mb-3">
                                <input hidden="" type="text" name="id" value="${klient.id}">
                            </div>
                            
                            <div class="text-end mx-4" id="odeslatPoznamkuBtnContent">
                                <button type="submit" class="btn btn-success my-4" id="odeslatPoznamkuBtn">Odeslat</button>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer text-left">
                        <small>
                            Poznámku lze později upravit.
                        </small>
                    </div>
                </div>
            </div>
        </div>


                            <!-- Footer a scripty -->
        <div id="footer">
            <%@include file="common/Footer.jspf" %>
        </div>
        <script src="/webjars/jquery/3.7.1/jquery.min.js"></script>
        <script src="/webjars/bootstrap/5.3.1/js/bootstrap.min.js"></script>
        <script src="/javascript/PodrobnostiKlientaJavascript.js" type="text/javascript"></script>
    </body>
</html>