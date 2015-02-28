/**
 * Created by laurent on 08/05/2014.
 */
var NewFolderView = Backbone.View.extend({
    el : '#newFolderModal',

    events: {
        "click #btnCreateNewFolder" : "createNewFolder",
        "click #btnCancelNewFolder" : "cancelNewFolder"
    },
    initialize: function(){
        var currentView = this;
        $(this.el).modal();
        $(this.el).on('hidden.bs.modal',function(){   // Initialization: Ecouter sur l'evenement hidden.bs.modal pour détruire la modal entière.
            currentView.$el.remove();
            $(document).unbind('keypress');
        });
        $(document).keypress(function(e) {
            if(e.which == 13) {
                currentView.createNewFolder();
            }
        });
    },

    createNewFolder:function(){
        var folder = new Document();
        var arbo = window.lizbox.arborescence;
        var idCurrentFolder = arbo.currentFolder;
        var collectionDocuments = arbo.collection;
        var folderName = $('#newFolderName').val();
        folder.set('nom',folderName);
        folder.set('dossierparent',idCurrentFolder);
        folder.save(null, {
            error: function(model, response) {
                if(response.responseJSON != null && response.responseJSON.message != null){
                    window.lizbox.notification('error',response.responseJSON.message+'</strong>');
                }else{
                    window.lizbox.notification('error','<strong>Une erreur est survenue pendant la création du dossier.');
                }
            },
            wait: true
        });
        collectionDocuments.add(folder);
        this.cancelNewFolder();
    },
    cancelNewFolder:function(){
        $(this.el).modal('hide');
    }
});