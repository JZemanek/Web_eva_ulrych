
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="cs-cz">
    <head>
        <!-- CSS -->
        <link rel="stylesheet" href="webjars/bootstrap/5.3.1/css/bootstrap.min.css"/>
        <link href="css/OMneStyle.css" rel="stylesheet" type="text/css"/>
        <link href="css/BackgroundOMne.css" rel="stylesheet" type="text/css"/>

        <%@include file="common/Navbar.jspf" %>
        <%@include file="common/MetaZaklad.jspf"%>
        <title>O mně</title>
        <link rel="icon" href="images/logo.svg"/>
    </head>
    <body>
        <div class="row py-4" id="hlavniCast">
            <div class="container col-md-7 py-4 align-center" style="padding-left: 18%">
                <p style="font-size: 1.8rem">Kdo s Vámi bude pracovat?</p>
                <ul>
                    <li><p>absolventka systematického výcviku v gestalt psychoterapii</p></li>
                    <li><p>absolventka studijního programu Psychologie na fakultě sociálních studií Masarykovy univerzity v Brně</p></li>
                    <li>v psychologické praxi od r. 2011</li>
                </ul>
                <div class="container py-4">
                    <p>
                        Pracovala jsem v rodinné poradně, v krizovém centru a na základní škole.
                    </p>
                    <p>
                        Psychologii jsem několik let učila studenty na VOŠ v oboru sociální práce.
                    </p>
                    <p>
                        Spolupracuji s pojišťovnami v rámci projektu psychosociální podpory.
                    </p>
                    <p>
                        <small>
                            Průběžně si doplňuji kvalifikaci, účastním se psychoterapeutických konferencí a kurzů. 
                            Snažím se stále zlepšovat.
                            Vždy mě zajímá zpětná vazba k psychoterapeutickému procesu.
                        </small>
                    </p>
                </div>
                <button type="button" class="btn btn-outline-primary mx-4" id="zivotopisBtn" 
                        data-bs-toggle="modal" data-bs-target="#modalZivotopis">Životopis</button>
            </div>
            <div class="container col-md-5 py-4">
                <img src="/images/profiE.webp" class="img-fluid rounded-3 mx-auto d-block" width="350" alt="Eva Ulrychová"/>
            </div>
                    <%@include file="common/Footer.jspf" %>
        </div>

        <div class="modal modal-lg modal-centred modal-dialog-scrollablemy-modal" id="modalZivotopis" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="modalZivotopisLabel">Profesní životopis</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" style="max-height: 600px; overflow-y: auto;">
                        <div>
                            <p><strong>Soukromá praxe</strong></p>
                            <p>
                                od r. 2023 - Kancelář Nám. T. G. Masaryka Holice (Zamánkova vila)
                            </p>
                            <p>
                                od r. 2017 - Kancelář Holubova 713, Pardubice (budova Fyzioterapie Holubova)
                            </p>

                            <p><strong>Výuka psychologie</strong></p>
                            <p>
                                2019 – 2023 - (VOŠ při SPŠE Pardubice, externí vyučující)
                            </p>

                            <p><strong>Školní psycholog</strong></p>
                            <p>
                                2013 - 2020: ZŠ Pardubice npor. Eliáše 344  
                            </p>
                            <p>
                                2013 - 2015: ZŠ Pardubice Staňkova 128
                            </p>
                            <p><strong>Psycholog Krizového centra a sociální rehabilitace</strong></p>
                            <p>
                                2012 - 2013 Centrum J. J. Pestalozziho, Chrudim
                            </p>
                            <p><strong>Psycholog poradny pro rodinu</strong></p>
                            <p>
                                2011 – 2012: Poradna pro rodinu, manželství a mezilidské vztahy ve Vyškově
                            </p>
                            <hr>
                        </div>
                        <div>
                            <p style="font-size: 1.4rem" >Vzdělání</p>
                            <p style="font-size: 1.2rem" >Psychoterapeutický výcvik</p>
                            <p><strong>Český Institut pro výcvik v gestalt psychoterapii, Brno:</strong> skupina G7.</p>
                            <ul>
                                <li>2013 - 2017 prezenční skupinová setkání</li>
                                <li>2018 - 2020 individuální příprava ke zkoušce a supervize</li>
                                <li>2021 závěrečná zkouška a obhajoba kazuistické studie. 
                                    Vedení absolventské práce: PhDr. Anton Polák, MUDr. Helena Fišerová</li>
                            </ul>

                            <p style="font-size: 1.4rem" >Studium</p>
                            <p><strong>Fakulta sociálních studií Masarykovy univerzity v Brně</strong></p>
                            <ul>
                                <li>2008 - 2010 obor <strong>Psychologie</strong> (navazující magisterské studium) Závěrečná práce: 
                                    Profesní kariéra u osob s Aspergerovým syndromem. Vedení diplomové práce: 
                                    PhDr. Ivana Poledňová, CSc. </li>
                                <li>2005 – 2008 - oborová kombinace <strong>Psychologie – mediální studia a žurnalistika</strong> 
                                    (bakalářské studium¨)Závěrečná práce: Sociální reprezentace školního psychologa u 
                                    středoškolských studentů. Vedení diplomové práce:<br>Mgr. et Mgr. Jan Mareš, PhD.</li>
                            </ul>
                            <hr>
                        </div>
                        <div>
                            <p><strong>Členství v profesních organizacích a další zkušenosti</strong></p>  
                            <ul>
                                <li>Česká asociace pro psychoterapii (od r. 2021)</li>
                                <li>Asociace manželských a rodinných poradců (2011 - 2012). Členka skupiny pro 
                                    tvorbu metodiky manželského a rodinného poradenství.</li>
                                <li>Institut pro výzkum mládeže, dětí a rodiny na Fakultě sociálních studií MU - 
                                    mezinárodní longitudinální studie ELSPAC (2008 - 2010)</li>
                                <li>Neziskové organizace - dobrovolnictví při studiu VŠ: Apla Jižní Morava. 
                                    Sdružení pěstouských rodin Brno, PAS Ústí n. Orlcí</li>
                            </ul>
                        </div>
                        <div>
                            <p><strong>Další vzdělávání a supervize</strong></p>
                            <p>Pravidelná účast na supervizi, individuální i skupinovou formou.</p>
                            <ul>
                                <li>Zejména supervizorky MUDr. Elena Křivková - Hradec Králové, PhDr. Iva Košťálová (Choceň)</li>
                            </ul>
                            <p>
                                Průběžná účast na konferencích (Gestalt terapeutické konference, konference České asociace pro 
                                psychoterapii, dříve konference manželského a rodinného poradenství, pedagogicko-psychologického 
                                poradenství, asociace studentů psychologie).
                            </p>
                            <p><strong>Kurzy</strong></p>
                            <ul>
                                <li>Těla v poli (Julianne Appel-Opper)</li>
                                <li>Setkání s biosyntézou – Český institut biosyntézy, Praha</li>
                                <li>Poradenská propedeutika - AMRP</li>
                                <li>Efektivní rozhovor – G&I s.r.o</li>
                                <li>Jakobsonova progresivní relaxace</li>
                                <li>Seminář dětské kresby (PhDr. Zdeněk Altman)</li>
                                <li>Test ruky (PhDr. Zdeněk Altman)</li>
                                <li>Kurz pro začínající školní psychology aj.</li>
                            </ul>

                            <p><strong>Zájmy</strong></p>
                            <p>profesní: existenciální psychologie, psychoterapeutická změna, dialog, individuace, seberealizace</p>
                            <p>
                                další: světové duchovní tradice a náboženství, klasická literatura, hudba (60. léta, jazz, 
                                pomalu zkoumám vážnou), toulky přírodou, čchi–kung
                            </p>
                            <p>Oblíbený citát: "<b><i>Brány svého vězení si neseme každý v sobě.</i></b>" J. P. Sartre</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Scripty -->
        <script src="webjars/jquery/3.7.1/jquery.min.js"></script>
        <script src="webjars/bootstrap/5.3.1/js/bootstrap.min.js"></script>
    </body>
</html>