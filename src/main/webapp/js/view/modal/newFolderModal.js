/**
 * Created by laurent on 08/05/2014.
 */
$.fn.newFolderModal= function() {

    $(this).click(function(){
        $( 	"<div class=\"modal fade\" id=\"newFolderModal\">" +
            "<div class=\"modal-dialog\">"+
            "<div class=\"modal-content\">"+
            "<div class=\"modal-header\">"+
            "<button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>"+
            "<h4 class=\"modal-title\">Nouveau dossier</h4>"+
            "</div>"+
            "<div class=\"modal-body\">" +
            "<div class=\"form-horizontal text-center\">" +
            "<div>" +
            "<input type=\"text\" class=\"form-control\" id=\"newFolderName\" placeholder=\"Nom du nouveau dossier\">" +
            "</div>"+
            "</div>"+
            "</div>"+
            "<div class=\"modal-footer\">"+
            "<button type=\"button\" class=\"btn btn-primary\" id=\"btnCreateNewFolder\"><span class='fa fa-folder-o'></span> Créer le dossier</button>"+
            "<button type=\"button\" class=\"btn btn-default\" id=\"btnCancelNewFolder\"><span class='fa fa-minus'></span> Annuler</button>"+
            "</div>"+
            "</div>"+
            "</div>"+
            "</div>"
        ).appendTo("body");
        var newFolder = new NewFolderView();
        return this;
    });
};