<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="fr">
  <head>
    <title>Lizbox</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">

    <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
    <link rel="icon" type="image/png" href="<%=request.getContextPath()%>/images/lizbox_logo_64x64.png" />
    <style>
        .mb30{
            margin-bottom: 30px;
        }
    </style>
    <link href="<%=request.getContextPath()%>/assets_accueil/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets_accueil/css/main.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets_accueil/css/style.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/assets_accueil/css/owl.carousel.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <!--<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>-->
    <![endif]-->
  </head>
  <body onload="setTimeout(function() { window.scrollTo(0, 1) }, 100);">
    <div class="row row-offcanvas row-offcanvas-right">
        <!-- banner -->
        <section class="banner" id="topPage">
            <div id="bannerSlider" class="carousel carousel-fade slide" data-ride="carousel">
            	<div class="top">
                    <div class="logo"><img src="<%=request.getContextPath()%>/assets_accueil/images/lizbox.png"></div>
                    <h1></h1>
                </div>
                <!-- Indicators -->
                <div class="carousel-inner">
                    <div class="item active" style="background-image:url(images/bg_photo.jpg);">
                        <div class="carousel-caption">
                            <div class="container">
                                <div class="col-md-12 btns-accueil">
                                    <h2 class="mb30">Le plus puissant des services de clouding.</h2>
                                    <sec:authorize access="!hasAnyRole('ROLE_PREMIUM','ROLE_PRO','ROLE_FREE','ROLE_ADMIN')">
                                        <a href="<%=request.getContextPath()%>/login" class="btn btn-default">Connexion</a>
                                        <a href="<%=request.getContextPath()%>/inscription" class="btn btn-default">S'inscrire</a>
                                    </sec:authorize>
                                    <sec:authorize access="hasAnyRole('ROLE_PREMIUM','ROLE_PRO','ROLE_FREE','ROLE_ADMIN')">
                                        <a href="<%=request.getContextPath()%>/documents" class="btn btn-default">Accéder à mon interface</a>
                                    </sec:authorize>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="scroll_down"><a href="#welcome">Scroll down</a></div>
            </div>
        </section>
        <!-- welcome -->
        <section class="welcome">
            <div class="container">
                <div class="col-md-8 col-md-offset-2">
                    <h3 data-scrollreveal="enter from the top over 1s">Lizbox</h3>
                    <h4 data-scrollreveal="enter from the bottom over 1s">Vous propose un ensemble de services complets pour stocker, organiser et récupèrer vos fichiers depuis n'importe où dans le monde.</h4>
                </div>
            </div>
        </section>
        <!-- what we do -->
        <section class="whatwedo">
            <div class="container">
                <div class="col-md-8 col-md-offset-2">
                    <h3 data-scrollreveal="enter from the top over 1s">Chiffres Lizbox</h3>
                    <h4 data-scrollreveal="enter from the bottom over 1s">Aujourd'hui c'est plus 40 000 particuliers et entreprises qui nous font confiance.</h4>
                </div>
                <div class="clearfix"></div>
                <div class="col-md-4" data-scrollreveal="enter from the bottom over 1s">
                	<span class="chart" data-percent="98">
                        <span class="percent"></span>
                    </span>
                    <h5>Satisfaction</h5>
                    <p>98% de nos clients sont satisfaits du service que nous proposons.</p>
                    <p><a href="login" class="btn-more">Me connecter</a></p>
                </div>
                <div class="col-md-4" data-scrollreveal="enter from the bottom over 1s">
                	<span class="chart" data-percent="77">
                        <span class="percent"></span>
                    </span>
                    <h5>Recommandation</h5>
                    <p>77% d'entre eux sont près à recommander l'application Lizbox.</p>
                    <p><a href="inscription" class="btn-more">M'inscrire</a></p>
                </div>
                <div class="col-md-4" data-scrollreveal="enter from the bottom over 1s">
                	<span class="chart" data-percent="60">
                        <span class="percent"></span>
                    </span>
                    <h5>Utilisation</h5>
                    <p>et enfin, 60% utilisent notre service plus d'une fois par jour.</p>
                    <p><a href="offres" class="btn-more">Découvrir les offres</a></p>
                </div>
            </div>
        </section>
        <!-- work process -->
        <section class="workprocess">
            <div class="container">
                <div class="col-md-8 col-md-offset-2">
                    <h3 data-scrollreveal="enter from the top over 1s">Le service</h3>
                    <h4 data-scrollreveal="enter from the bottom over 1s">Lizbox un service tout-en-un pour mettre vos documents sur le cloud.</h4>
                </div>
                <div class="col-md-12">
                    <div id="rootwizard">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                          <li><a href="#wp_tab_1" data-toggle="tab"><i class="fa fa-cloud"></i></a></li>
                          <li><a href="#wp_tab_2" data-toggle="tab"><i class="fa fa-share"></i></a></li>
                          <li><a href="#wp_tab_3" data-toggle="tab"><i class="fa fa-money"></i></a></li>
                          <li><a href="#wp_tab_4" data-toggle="tab"><i class="fa fa-dashboard"></i></a></li>
                          <li><a href="#wp_tab_5" data-toggle="tab"><i class="fa fa-inbox"></i></a></li>
                          <li><a href="#wp_tab_6" data-toggle="tab"><i class="fa fa-copy"></i></a></li>
                        </ul>
                        
                        <!-- Tab panes -->
                        <div class="tab-content">
                          <a class='btn button-previous'></a>
                          <a class='btn button-next'></a>
                          <div class="tab-pane fade active" id="wp_tab_1">
                            <h5>Creative clouding</h5>
                            <p>
                                L'équipe Lizbox se plie en quatre pour vous offrir le service de clouding le plus innovant et sécurisé possible. Grâce à ses innovations spectaculaires en matière de contrôle des données, elle s'est placée comme une véritabe pionnière dans ce domaine.
                            </p>
                          </div>
                          <div class="tab-pane fade active" id="wp_tab_2">
                            <h5>Transférez vos données l'esprit tranquille</h5>
                            <p>
                                Avec son interface simple et intuitive, Lizbox vous permet de régler les droits de vos fichiers en matière de partage : Vos amis peuvent avoir accès ou non à vos fichiers en lecture/écriture. A noter que vos fichiers peuvent aussi être synchronisés en local sur votre ordinateur, pour un accès plus rapide.
                            </p>
                          </div>
                          <div class="tab-pane fade active" id="wp_tab_3">
                            <h5>Pas bête la bête !</h5>
                            <p>
                                Notre service est le plus performant de tous, pour un prix moindre. Si vous trouvez moins cher, nous vous remboursons 200 fois la différence !
                            </p>
                          </div>
                          <div class="tab-pane fade active" id="wp_tab_4">
                            <h5>Un service rapide</h5>
                            <p>Grâce à la puissance de nos serveurs, vos fichiers sont synchronisés instantanément. Si vous voulez profiter de manière optimale de ces performances, souscrivez à l'offre premium ;)</p>
                          </div>
                          <div class="tab-pane fade active" id="wp_tab_5">
                            <h5>Un espace de stockage impressionnant</h5>
                            <p>Vous disposez d'un espace de stockage vous permettant de partager toutes vos photos, vidéos, musiques et autres. Vous allez être impressionnés par les performances de Lizbox.</p>
                          </div>
                          <div class="tab-pane fade active" id="wp_tab_6">
                            <h5>Vos fichiers</h5>
                            <p>Consultez vos fichiers en ligne et organisez les selon une arborescence définie par vos soins, invitez vos amis à y accéder. Lizbox encourage le travail collaboratif !</p>
                          </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- features -->
        <section class="features">
            <div class="bg">
                <div class="container">
                    <div class="col-md-10 col-md-offset-1">
                        <h3 data-scrollreveal="enter from the top over 1s" id="nosOffres">Nos offres</h3>
                        <h4 data-scrollreveal="enter from the bottom over 1s">Lizbox vous propose trois offres pour correspondre au mieux à vos attentes.</h4>
                    </div>
                </div>
            </div>
            <div id="rootwizard1">
                <div class="container">
                    <div class="col-md-12">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                          <li><a href="#f_tab_1" data-toggle="tab">FREE</a></li>
                          <li><a href="#f_tab_2" data-toggle="tab">PREMIUM</a></li>
                          <li><a href="#f_tab_3" data-toggle="tab">PRO</a></li>
                        </ul>
                    </div>
                </div>
                <!-- Tab panes -->
                <div class="tab-content">
                  <a class='btn button-previous'></a>
                  <a class='btn button-next'></a>
                  <div class="tab-pane fade active" id="f_tab_1">
                    <div class="container">
                        <div class="col-md-7">
                            <h4>Offre GRATUITE</h4>
                            <div class="line"><span></span></div>
                            <p>Gratuit, simple, rapide, sécurisé.</p>
                            <p>Découvrez gratuitement le service Lizbox sans aucune obligations, limitations, ni publicités. Inscrivez-vous en quelques secondes et profitez des fonctionnalités que Lizbox vous propose. Vous disposerez de 2Gb d'espace de stockage accessible depuis votre interface personnalisé sur lizbox.com mais aussi l'application Lizbox mobile.</p>
                            <p>
                                <a href="inscription" class="btn btn-default border-braun">M'inscrire</a>
                                <a href="offres" class="btn btn-default border-braun">En savoir plus</a>
                            </p>
                        </div>
                    </div>
                  </div>
                  <div class="tab-pane fade active" id="f_tab_2">
                    <div class="container">
                        <div class="col-md-7">
                            <h4>Offre PREMIUM</h4>
                            <p class="line"><span></span></p>
                            <p>Pratique, simple, performant, sécurisé. Pour les personnes n'ayant pas besoin d'un espace très important mais souhaitant néanmoins un confort d'utilisation optimal, cette offre remplira toutes les fonctions désirées.</p>
                            <p></p>
                            <p>
                                <a href="inscription" class="btn btn-default border-braun">M'inscrire</a>
                                <a href="offres" class="btn btn-default border-braun">En savoir plus</a>
                            </p>
                        </div>
                    </div>
                  </div>
                  <div class="tab-pane fade active" id="f_tab_3">
                    <div class="container">
                        <div class="col-md-7">
                            <h4>Offre PRO</h4>
                            <p class="line"><span></span></p>
                            <p>Performances optimales, sécurisé, espace de stockage important, rapide.</p>
                            <p>Destiné aux professionnels qui souhaitent profiter de toute la puissance du service Lizbox. Avec 500Gb d'espace de stockage, un débit optimal et la possibilité d'utiliser l'application mobile mais aussi l'application bureau, cette offre sera ravir tous les pro qui souhaitent sauvegarder leurs données et y avoir accès rapidement depuis n'importe où à travers le monde. Sécurité, haute disponibilité.</p>
                            <p>
                                <a href="inscription" class="btn btn-default border-braun">M'inscrire</a>
                                <a href="offres" class="btn btn-default border-braun">En savoir plus</a>
                            </p>
                        </div>
                    </div>
                  </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </section>


        <div class="portfolio-data js-portfolio-data standard-version" style="display: none;"></div>


        <!-- call to action -->
        <section class="calltoaction">
            <div class="container">
                <div class="col-md-10 col-md-offset-1">
                    <h3 data-scrollreveal="enter from the top over 1s">Mobile & Bureau</h3>
                    <h4 data-scrollreveal="enter from the bottom over 1s">Deployez Lizbox sur votre mobile et votre bureau.</h4>
                    <p>
                        <a href="<%=request.getContextPath()%>/desktopApp/Lizbox_desktop.jar" class="btn btn-default" data-scrollreveal="enter from the right over 1s">Application bureau</a>
                        <a href="https://play.google.com/store/apps" target="blank" class="btn btn-default" data-scrollreveal="enter from the right over 1s">Application android</a>
                    </p>
                </div>
            </div>
        </section>
        <!-- happy customers -->
        <section class="happycustomers">
            <div class="container">
                <div class="col-md-8 col-md-offset-2 wp_01">
                    <h3 data-scrollreveal="enter from the top over 1s">Livre d'or</h3>
                    <h4 data-scrollreveal="enter from the bottom over 1s">Ce que vous pensez de Lizbox.</h4>
                	<p class="line"><span></span></p>
                </div>
                <div class="col-md-12 alpha omega">
                    <div id="rootwizard2">
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <a class='btn button-previous'></a>
                            <a class='btn button-next'></a>
                            <div class="tab-pane fade active" id="reviews_tab_1">
                                <div class="col-md-8 alpha omega col-md-offset-2">
                                    <p class="text-center"><i class="fa fa-quote-left"></i></p>
                                    <p class="description">J'aime Lizbox, tout simplement :)</p>
                                    <p class="client"><strong>Sara Young</strong></p>
                                    <p class="text-center"><i class="fa fa-quote-right"></i></p>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="reviews_tab_2">
                                <div class="col-md-8 alpha omega col-md-offset-2">
                                    <p class="text-center"><i class="fa fa-quote-left"></i></p>
                                    <p class="description">Ne réfléchissez pas, inscrivez vous, vous verrez.</p>
                                    <p class="client"><strong>Antonia Dukes</strong></p>
                                    <p class="text-center"><i class="fa fa-quote-right"></i></p>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="reviews_tab_3">
                                <div class="col-md-8 alpha omega col-md-offset-2">
                                    <p class="text-center"><i class="fa fa-quote-left"></i></p>
                                    <p class="description">Un ami m'a parlé de Lizbox, depuis, c'est mon meilleur ami.</p>
                                    <p class="client"><strong>Mark Stringer</strong></p>
                                    <p class="text-center"><i class="fa fa-quote-right"></i></p>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="reviews_tab_4">
                                <div class="col-md-8 alpha omega col-md-offset-2">
                                    <p class="text-center"><i class="fa fa-quote-left"></i></p>
                                    <p class="description">Je recommanderai Lizbox que ce soit pour un usage personnel ou bien professionnel.</p>
                                    <p class="client"><strong>Brad John</strong></p>
                                    <p class="text-center"><i class="fa fa-quote-right"></i></p>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="reviews_tab_5">
                                <div class="col-md-8 alpha omega col-md-offset-2">
                                    <p class="text-center"><i class="fa fa-quote-left"></i></p>
                                    <p class="description">Je n'écris jamais dans les livre d'or, celà veut tout dire !</p>
                                    <p class="client"><strong>Kevin</strong> </p>
                                    <p class="text-center"><i class="fa fa-quote-right"></i></p>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="reviews_tab_6">
                                <div class="col-md-8 alpha omega col-md-offset-2">
                                    <p class="text-center"><i class="fa fa-quote-left"></i></p>
                                    <p class="description">Très belle interface, très beaux développeurs. Merci pour tout <3</p>
                                    <p class="client"><strong>Mister Park</strong></p>
                                    <p class="text-center"><i class="fa fa-quote-right"></i></p>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="reviews_tab_7">
                                <div class="col-md-8 alpha omega col-md-offset-2">
                                    <p class="text-center"><i class="fa fa-quote-left"></i></p>
                                    <p class="description">Si j'ai une chose à revivre de ma vie, c'est ma découverte de Lizbox.</p>
                                    <p class="client"><strong>Jade</strong></p>
                                    <p class="text-center"><i class="fa fa-quote-right"></i></p>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="reviews_tab_8">
                                <div class="col-md-8 alpha omega col-md-offset-2">
                                    <p class="text-center"><i class="fa fa-quote-left"></i></p>
                                    <p class="description">Lizbox, c'est ma vie, c'est le sang qui coule dans mes veines.</p>
                                    <p class="client"><strong>Dracula</strong></p>
                                    <p class="text-center"><i class="fa fa-quote-right"></i></p>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <!-- Nav tabs -->
                        <div class="col-md-8 alpha omega col-md-offset-2">
                            <ul class="nav nav-tabs">
                              <li><a href="#reviews_tab_1" data-toggle="tab"><img src="<%=request.getContextPath()%>/assets_accueil/images/avatar1.png" alt="" title=""></a></li>
                              <li><a href="#reviews_tab_2" data-toggle="tab"><img src="<%=request.getContextPath()%>/assets_accueil/images/avatar3.png" alt="" title=""></a></li>
                              <li><a href="#reviews_tab_3" data-toggle="tab"><img src="<%=request.getContextPath()%>/assets_accueil/images/avatar.jpg" alt="" title=""></a></li>
                              <li><a href="#reviews_tab_4" data-toggle="tab"><img src="<%=request.getContextPath()%>/assets_accueil/images/avatar3.png" alt="" title=""></a></li>
                              <li><a href="#reviews_tab_5" data-toggle="tab"><img src="<%=request.getContextPath()%>/assets_accueil/images/avatar3.png" alt="" title=""></a></li>
                              <li><a href="#reviews_tab_6" data-toggle="tab"><img src="<%=request.getContextPath()%>/assets_accueil/images/author.png" alt="" title=""></a></li>
                              <li><a href="#reviews_tab_7" data-toggle="tab"><img src="<%=request.getContextPath()%>/assets_accueil/images/avatar3.png" alt="" title=""></a></li>
                              <li><a href="#reviews_tab_8" data-toggle="tab"><img src="<%=request.getContextPath()%>/assets_accueil/images/avatar3.png" alt="" title=""></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- contact -->
        <section class="contact js-backstrech" data-image="<%=request.getContextPath()%>/assets_accueil/images/bg_contact.jpg">
            <div class="container">
                <div class="col-md-8 col-md-offset-2">
                    <h3  data-scrollreveal="enter from the top over 1s">Nous contacter</h3>
                    <h4  data-scrollreveal="enter from the bottom over 1s">Nous aimerions être en contact avec vous.</h4>
                </div>
                <div class="col-sm-12"  data-scrollreveal="enter from the bottom over 1s">
                	<i class="contactico"><img src="<%=request.getContextPath()%>/assets_accueil/images/ico/contact_mail.png" alt="" title=""></i>
                    <p><a href="#" class="mail_link">info@lizbox.com</a></p>
                </div>
                <div class="clearfix"></div>
                <div class="cform">
                    <form action="inc/send-email.php" method="POST" class="contact-form">
                        <div class="col-md-3 col-md-offset-2">
                            <div class="form-group">
                                <input type="text" class="form-control" name="name" placeholder="Name:">
                            </div>
                            <div class="form-group">
                                <input type="email" class="form-control" name="email" placeholder="Email:">
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="phone" placeholder="Phone:">
                            </div>
                        </div>                
                        <div class="col-md-5">
                                <textarea class="form-control" name="message" placeholder="Message:" rows="6"></textarea>
                        </div>                
                        <div class="col-md-5 text-right">
                        <input type="hidden" value="1" name="submit" />
                        <button type="submit" class="btn btn-default">Submit</button>
                        </div>                
                        <div class="clearfix"></div>
                    </form>
                </div>
                <div class="col-md-12 text-center copyinfo"  data-scrollreveal="enter from the bottom over 1s">
                	<p><strong>Lizbox</strong> a Website and a concept made by Lizbox Team - 2014</p>
                </div>                
            </div>
        </section>
		<!--   main menu   -->
        <div class="sidebar-offcanvas" id="sidebar" role="navigation">
            <div class="list-group-holder">
            	<a href="#banner" class="menu-logo"><img src="<%=request.getContextPath()%>/assets_accueil/images/lizbox.png" alt="" title="" style="width: 50%;"></a>
                <a data-toggle="offcanvas" class="close_menu">X</a>
                <a class="btn-menu" data-toggle="offcanvas"><span></span></a>
                <div class="list-group">
                    <a href="#welcome"  class="list-group-item">A propos</a>
                    <a href="#whatwedo" class="list-group-item">Quelques chiffres</a>
                    <a href="#workprocess" class="list-group-item">Nos services</a>
                    <a href="#features"  class="list-group-item">Nos offres</a>
                    <a href="#happycustomers" class="list-group-item">Livre d'or</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets_accueil/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        if( !/Android|webOS|iPhone|iPod|iPad|BlackBerry/i.test(navigator.userAgent))
         document.write('<script type="text/javascript" src="<%=request.getContextPath()%>/assets_accueil/js/scrollReveal.js"><\/script>');
    </script>
    <script src="<%=request.getContextPath()%>/assets_accueil/js/jquery.parallax.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets_accueil/js/transition.js"></script>
    <script src="<%=request.getContextPath()%>/assets_accueil/js/waypoints.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets_accueil/js/jquery.easypiechart.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets_accueil/js/owl.carousel.js"></script>
	<script src="<%=request.getContextPath()%>/assets_accueil/js/jquery.bootstrap.wizard.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets_accueil/js/stellar.js"></script>
    <script src="<%=request.getContextPath()%>/assets_accueil/js/backstrech.js"></script>
    <script src="<%=request.getContextPath()%>/assets_accueil/js/jquery.mixitup.min.js"></script>
    <script src="<%=request.getContextPath()%>/assets_accueil/js/scripts.js"></script>
  </body>
</html>