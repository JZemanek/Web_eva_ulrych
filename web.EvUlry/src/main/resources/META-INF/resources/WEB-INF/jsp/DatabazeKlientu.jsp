<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="cs-cz">
    <head>
        <!-- CSS -->
        <link rel="stylesheet" href="/webjars/bootstrap/5.3.1/css/bootstrap.min.css"/>
        <link href="/css/DatabazeKlientuStyle.css" rel="stylesheet" type="text/css"/>

        <%@include file="common/MetaZaklad.jspf" %>
        <%@include file="common/NavbarAdministrace.jspf" %>
        <title>Databaze</title>
    </head>
    <body>

        <c:if test="${not empty successMessage}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${successMessage}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>

        <div class="container py-4 col-10 table-responsive">
            <table class="table table-stripped table-hover">
                <tr>
                    <th>Jméno</th>
                    <th>Příjmení</th>
                    <th>email</th>
                    <th>Tel číslo</th>
                    <th>První návštěva</th>
                    <th>Poslední návštěva</th>
                    <th>Příští návštěva</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach items="${seznamKlientu}" var="klient" >
                    <tr>
                        <td>${klient.jmeno}</td>
                        <td>${klient.prijmeni}</td>
                        <td>${klient.email}</td>
                        <td>${klient.telCislo}</td>
                        <td>${klient.prvniSchuzka}</td>
                        <td>${klient.posledniSchuzka}</td>
                        <td>${klient.pristiSchuzka}</td>
                        <td class="text-center">
                            <a class="btn btn-success btn-sm" href="/administrace/podrobnosti-klienta/${klient.id}">Podrobnosti</a>
                        </td>

                        <td class="text-center">
                            <form method="post" action="/administrace/odstranit-klienta/${klient.id}"
                                  onsubmit="return confirm('Opravdu chcete odstranit klienta?\nDojde k odstranění veškerých dat spojených s tímto klintem.');">
                                <input hidden="" type="text" name="id" value="${klient.id}">
                                <button class="btn btn-danger btn-sm" type="submit">Odstranit</button>
                            </form>
                        </td>

                    </c:forEach>
            </table>
        </div>
        <div id="footer">
            <%@include file="common/Footer.jspf" %>
        </div>

        <script src="/webjars/jquery/3.7.1/jquery.min.js"></script>
        <script src="/webjars/bootstrap/5.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
