/**
 * Created by laurent on 10/05/2014.
 */
$.fn.shareDocumentModal= function() {

    $(this).click(function(){
        $( 	"<div class=\"modal fade\" id=\"shareModal\">" +
            "<div class=\"modal-dialog\">"+
            "<div class=\"modal-content\">"+
            "<div class=\"modal-header\">"+
            "<button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>"+
            "<h4 class=\"modal-title\" id=\"shareDocumentTitle\"></h4>"+
            "</div>"+
            "<div class=\"modal-body\">" +
            "<div class=\"form-horizontal text-center\">" +
            "<div id=\"shareContent\">" +

            "<div id=\"publicShareContent\" class='widget'>"+
            "</div>"+

            "<div id=\"privateShareContent\" class='widget'>"+
                "<div class=\"widget-head\">"+
                "<h4 class=\"heading\">Partage privée</h4>"+
                "</div>"+
                "<div class=\"widget-body innerAll inner-2x\">" +
                    "<table class=\"table table-bordered table-condensed\">" +
                        "<thead>" +
                            "<tr>"+
                                "<th>Partagé avec</th>"+
                                "<th>Droits d'écriture</th>"+
                                "<th>Supprimer</th>"+
                            "</tr>"+
                        "</thead>"+
                        "<tbody>"+
                        "</tbody>"+
                    "</table>" +
                    "<form class=\"form-inline\" role=\"form\">"+
                        "<div class=\"form-group\">"+
                            "<input type=\"text\" class=\"form-control\" id=\"userWhoShared\" placeholder=\"Email ou pseudo d\'un utilisateur\">"+
                        "</div>"+
                        "<button class=\"btn btn-default\" id=\"addPrivateShare\">Ajouter</button>"+
                    "</form>"+
                "</div>"+
            "</div>"+

            "</div>"+
            "</div>"+
            "</div>"+
            "<div class=\"modal-footer\">"+
            "<button type=\"button\" class=\"btn btn-default\" id=\"btnCloseShare\"><span class='fa fa-minus'></span> Fermer</button>"+
            "</div>"+
            "</div>"+
            "</div>"+
            "</div>"
        ).appendTo("body");
        new ShareView();
        return this;
    });
};