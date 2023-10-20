<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="cs-cz">
    <head>
        <link rel="stylesheet" href="webjars/bootstrap/5.3.1/css/bootstrap.min.css"/>
        <link href="css/BackgroundSluzby.css" rel="stylesheet" type="text/css"/>
        <link href="css/SluzbyStyle.css" rel="stylesheet" type="text/css"/>

        <%@include file="common/Navbar.jspf" %>
        <%@include file="common/MetaZaklad.jspf" %>
        <title>Služby</title>
        <link rel="icon" href="images/logo.svg"/>
    </head>
    <body>
        <div id="hlavniCast">
            <h2 class="text-center py-4">Mohu Vám nabídnout</h2>
            <div class="container col-md-8 py-2" id="text">

                <div id="prvniOdstavec">
                    <p><strong>Psychologické a psychoterapeutické poradenství</strong></p> 
                    <p>
                        Společné hledání způsobu, jak se lépe vyznat ve Vaší situaci a jak můžete dál utvářet svou cestu pomocí vědomého
                        rozhodování místo uvíznutí v zajetých kolejích či vzorcích z minulosti. <strong>Tak, abyste lépe rozuměli sami sobě a svým
                            potřebám a mohli se svobodněji a přiléhavěji rozhodovat.</strong>
                    </p>
                    <p>Taková práce může být kratší  - zacílená více na konkrétní problémovou situaci (více poradensky orientovaná) 
                        - nebo delší - zacílená více na osobnost člověka a jeho způsoby kontaktu s okolím (více terapeuticky zaměřená). 
                        Obojí může mít svůj význam. Způsob práce společně "šijeme na míru" právě Vám. 
                    </p>
                </div>

                <div id="druhyOdstavec">
                    <p><strong>Osobní rozvoj</strong></p>
                    <p>V rámci svého výcviku a praxe jsem viděla řadu lidí díky gestalt přístupu <strong>růst</strong>. 
                        Troufnu si říct, že i já díky němu rostu. 
                        Proto jsem přesvědčená, že se hodí nejen pro lidi trpící duševním onemocněním nebo pro ty, 
                        kteří se aktuálně potýkají se závažnými problémy. Metody gestalt terapie je možné využít i jako užitečný nástroj 
                        osobního rozvoje - hodí se tedy i pro zájemce o to, jak dovedněji zvládat svůj život 
                        a cítit se více v souladu sami se sebou.
                    </p>
                </div>

                <div id="tretiOdstavec">
                    <p><strong>Co můžete očekávat na první hodině?</strong></p>
                    <p>
                        Seznámíme se. Povíte mi, co vás přivádí a co od spolupráce se mnou očekáváte.
                        Dostaneme se také k některým důležitým událostem z Vašeho života.
                    </p>
                    <p>
                        Budeme mluvit o cíli, kterého společnou prací chcete dosáhnout. Dáme prostor Vašim otázkám. 
                    </p>
                    <p>
                        Budu k dispozici pro dialog - rozhovor, v kterém se budeme soustředit na vaše prožívání.
                    </p>
                    <p>V závěru hodiny se rozhodnete zda stojíte o formu spolupráce, kterou nabízím.
                        Pokud ano, domluvíme se na organizačních záležitostech.</p>
                </div>
            </div>

            <div class="container col-md-8" id="carouselProblemy">
                <p><strong>Kdy se stát klientem?</strong></p>
                <p>Na tyto stránky jste pravděpodobně zavítali proto, že Vás něco ve Vašem životě trápí nebo Vám nevyhovuje.
                    Může to být mnoho různých věcí a situací. 
                    Zde je pár příkladů.
                </p>
                <div class="d-flex justify-content-center">
                    <div id="carouselExample" class="carousel slide mx-auto">
                        <div class="carousel-inner">

                            <div class="carousel-item active">
                                <img src="/images/carousel-slozita-rodinna-situace.jpg" class="d-block w-100" alt="Eva Ulrychová">
                                <div class="carousel-caption d-block" style="margin-bottom: 10%" id="carouselJedna">
                                    <h5>Složitá rodinná situace</h5>
                                    <p>
                                        <button type="button" class="btn btn-outline-light" data-bs-toggle="modal" data-bs-target="#modalRodinnaSituace">
                                            Více informací
                                        </button>
                                    </p>
                                    <div class="modal fade" id="modalRodinnaSituace" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body text-dark">
                                                    <p>rozpad vztahu, nevěra, obtížná komunikace s partnerem, otázky závislosti či domácího násilí v rodině...</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="carousel-item">
                                <img src="/images/carousel-problem-prace.jpg" class="d-block w-100 img-fluid" alt="Eva Ulrychová">
                                <div class="carousel-caption d-block" style="margin-bottom: 5%" id="carouselDva">
                                    <h5>Obtíže v pracovní oblasti</h5>
                                    <p>
                                        <button type="button" class="btn btn-outline-light" data-bs-toggle="modal" data-bs-target="#modalPracovniOblast">
                                            Více informací
                                        </button>
                                    </p>
                                    <div class="modal fade" id="modalPracovniOblast" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body text-dark">
                                                    <p>obtíže v pracovní oblasti (nerozhodnost ve volbě studia, ztráta práce, potíže s
                                                        nalezením vhodného pracovního místa nebo profesní orientace, obtíže s kolegy na pracovišti, s nadřízenými či podřízenými...)</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            ¨
                            <div class="carousel-item">
                                <img src="/images/carousel-krize.jpg" class="d-block w-100 img-fluid" alt="Eva Ulrychová">
                                <div class="carousel-caption d-block" style="margin-bottom: 5%" id="carouselTri">
                                    <h5>Krize v období změny</h5>
                                    <p>
                                        <button type="button" class="btn btn-outline-light" data-bs-toggle="modal" data-bs-target="#modalKrizeZmena">
                                            Více informací
                                        </button>
                                    </p>
                                    <div class="modal fade" id="modalKrizeZmena" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body text-dark">
                                                    <p>krize v období změny rolí (dokončení studia, mateřství, nové zaměstnání, úmrtí blízkého člověka...)</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="carousel-item">
                                <img src="/images/carousel-otazka-zivot.jpg" class="d-block w-100 img-fluid" alt="Eva Ulrychová">
                                <div class="carousel-caption d-block" style="margin-bottom: 5%" id="carouselCtyri">
                                    <h5>Spirituální záležitosti</h5>
                                    <p>
                                        <button type="button" class="btn btn-outline-light" data-bs-toggle="modal" data-bs-target="#modalSpiritualZaleziost">
                                            Více informací
                                        </button>
                                    </p>
                                    <div class="modal fade" id="modalSpiritualZaleziost" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body text-dark">
                                                    <p>záležitosti spirituální (otázka smyslu života, místa ve světě a vztahů s druhými obecně)<p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="carousel-item">
                                <img src="/images/carousel-vyrovnani-s-traumatem.jpg" class="d-block w-100 img-fluid" alt="Eva Ulrychová">
                                <div class="carousel-caption d-block" style="margin-bottom: 5%" id="carouselPet">
                                    <h5 class="text-white">Vyrovnání se s psychickým traumatem</h5>
                                    <p>
                                        <button type="button" class="btn btn-outline-light" data-bs-toggle="modal" data-bs-target="#modalVyrovnaniTrauma">
                                            Více informací
                                        </button>
                                    </p>
                                    <div class="modal fade" id="modalVyrovnaniTrauma" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body text-dark">
                                                    <p>vyrovnávání se se zdravotními problémy, zraněním nebo psychickým 
                                                        traumatem (svědectví zátěžové události apod.), problematika vyhoření...</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
            </div>

            <div class="container col-md-8 py-4" id="text2">
                <div>
                    <p style="font-weight: bold; font-size: 1.2rem">Zásady mojí práce</p>
                    <ul>
                        <li>
                            <p>
                                Budu k Vám přistupovat s respektem jako k jedinečné lidské 
                                bytosti a se zvídavostí. Jsem člověk, který nedělá předčasné a nebo definitivní závěry.
                            </p>
                        </li>
                        <li>
                            <p>Věřím, že lidé se mohou měnit a vyvíjet, když o to stojí.</p>
                        </li>
                        <li>
                            <p>
                                Samozřejmostí je pro mě etický přístup k práci s osobními údaji a profesionální mlčenlivost. 
                                Vycházím z 
                                <a class="text-dark" target="_blank" href="https://czap.cz/resources/Documents/kl%c3%ad%c4%8dov%c3%a9%20dokumenty%20kodex%20a%20z%c3%a1sady/ETICKY_KODEX_C%cc%8cAP_tisk.pdf">
                                    <u>Etického kodexu České asociace pro psychoterapii</u>
                                </a>. 
                            </p>
                        </li>
                        <li>
                            <p>Za důležitý nástroj profesního rozvoje pokládám supervizi.</p>
                        </li>
                    </ul>
                </div>
            </div>
            <%@include file="common/Footer.jspf" %>
        </div>


        <!-- Scripty -->
        <script src="webjars/jquery/3.7.1/jquery.min.js"></script>
        <script src="webjars/bootstrap/5.3.1/js/bootstrap.min.js"></script>
    </body>
</html>