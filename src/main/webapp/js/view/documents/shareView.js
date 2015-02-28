/**
 * Created by laurent on 10/05/2014.
 */
var ShareView = Backbone.View.extend({
    el : '#shareModal',

    events: {
        "click #btnCloseShare" : "closeShare",
        "click #isPublicShared" : "publicShareCheck",
        "click #addPrivateShare" : "addPrivateShare",
        "click .removePrivateShare" : "removePrivateShare",
        "click .addWriteRight" : "addWriteRight"
    },
    initialize: function(){
        var currentView = this;
        var thi = $(this.$el);

        this.privateShareCollection = new PrivateShareCollection();
        this.listenTo(this.privateShareCollection, 'sync', this.renderPrivateShare);
        this.listenTo(this.privateShareCollection, 'change', this.renderPrivateShare);
        this.listenTo(this.privateShareCollection, 'destroy', this.renderPrivateShare);

        var document = currentView.getDocument();
        if(document){
            $('#shareDocumentTitle').text("Partage de " + document.getNom());
            if (document.get('estfichier')) {
                //PUBLIC SHARE
                currentView.renderPublicShare(document.get('id'));
                //PRIVATE SHARE
                this.privateShareCollection.fetch({
                    wait: true,
                    data: $.param({ idDocument: document.get('id')}),
                    success:function(){
                        thi.modal();
                    },
                    error: function(data,response){
                        if(response.responseJSON != null && response.responseJSON.message != null){
                            window.lizbox.notification('error',response.responseJSON.message+'</strong>');
                        }else{
                            window.lizbox.notification('error','<strong>Une erreur est survenue. Si le problème persiste veuillez contacter l\'administrateur.</strong>');
                        }
                    }
                });
            }
        }
        $(this.el).on('hidden.bs.modal',function(){   // Initialization: Ecouter sur l'évènement hidden.bs.modal pour détruire la modal entière.
            thi.remove();
            currentView.remove();
            window.lizbox.arborescence.refresh();
        });
    },

    getDocument: function(){
        var documentChecked = window.lizbox.arborescence.collection.where({'_checked':1});
        var doc = undefined;
        if(documentChecked.length==0){
            window.lizbox.notification('warning','Aucun fichier sélectionné. Veuillez sélectionner un fichier à partager.');
            this.remove();//Suppression de la vue pour éviter l'accumulation de l'objet vue et duplication des messages
            return false;
        }else if (documentChecked.length > 1) {
            window.lizbox.notification('error', 'Trop de fichiers à partager. Veuillez partager un fichier à la fois.');
            this.remove();//Suppression de la vue pour éviter l'accumulation de l'objet vue et duplication des messages
            return false;
        }else {
            _.each(documentChecked, function (document) {
                doc = document;
                if(document.get('estfichier')!=1){
                    window.lizbox.notification('warning', 'Les dossiers ne peuvent pas être partagés.');
                    this.remove();//Suppression de la vue pour éviter l'accumulation de l'objet vue et duplication des messages
                    return false;
                }
            },this);
            return doc;
        }
    },

    renderPublicShare: function(idDocument){
        var publicShare = new PublicShare({idDocument: idDocument});
        publicShare.fetch({
            wait: true,
            success: function () {
                var publicShareContent = $("#publicShareContent");
                publicShareContent.empty();
                var publicShareState = new PublicShareTemplateView({ model: publicShare});
                publicShareContent.append(publicShareState.render().el);
            }
        });
    },

    renderPrivateShare:function(idDocument){
        var privateShareContent = $("#privateShareContent table tbody");
        privateShareContent.empty();
        if (this.privateShareCollection.length >= 1) {
            this.privateShareCollection.each(function(partage){
                var privateShareState = new PrivateShareTemplateView({ model: partage});
                privateShareContent.append(privateShareState.render().el);
            }, this);
        }
    },

    publicShareCheck:function(){
        var document = this.getDocument();
        if($('#isPublicShared').is(':checked')){
            $('#publicShareLink').removeAttr('disabled');
        }else{
            $('#publicShareLink').attr('disabled','disabled');
        }
        $.ajax({
            url: "/lizbox/api/partage/public?idDocument="+document.get('id')+"&isActive="+($('#isPublicShared').is(':checked') ? 1 : 0),
            type:"put",
            async: true
        });
    },

    addPrivateShare:function(e){
        e.preventDefault();
        var userSearch = $('#userWhoShared').val();
        if(userSearch.length != 0) {
            var currentView = this;
            var document = this.getDocument();
            var privateShareModel = new PrivateShare();
            privateShareModel.fetch({
                wait: true,
                data: $.param({
                    idDocument: document.get('id'),
                    recepteurLabel: userSearch
                }),
                success: _.bind(function(model, data) {
                    $('#userWhoShared').val('');
                    currentView.privateShareCollection.fetch({
                        wait: true,
                        data: $.param({ idDocument: document.get('id')})
                    });
                    var shareSuccess = $("<div class='alert alert-success alert-dismissable' id=\"shareSuccess\">" +
                        "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
                        "<strong>Partage privé ajouté.</strong>" +
                        "</div>");
                    $('#shareContent').prepend(shareSuccess);
                }),
                error: _.bind(function(model, data) {
                    try {
                        var message = $.parseJSON(data.responseText).message;
                    } catch (err) {
                        var message = "Une erreur est survenue.";
                    }
                    var shareAlert = $("<div class='alert alert-danger alert-dismissable' id=\"shareAlert\">" +
                        "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
                        "<strong>Attention : </strong>" +
                        "<span>" +
                        message
                        + "</span>" +
                        "</div>");
                    $('#shareContent').prepend(shareAlert);
                })
            });
        }
    },

    removePrivateShare:function(e){
        var id = e.currentTarget.dataset.id;
        var partage = this.privateShareCollection.get(id);
        partage.destroy({success:function (){
            var removeShareSuccess = $("<div class='alert alert-success alert-dismissable' id=\"removeShareSuccess\">" +
                "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
                "<strong>Partage privé supprimé.</strong>" +
                "</div>");
            $('#shareContent').prepend(removeShareSuccess);
        }, error: function(){
            var removeShareError = $("<div class='alert alert-danger alert-dismissable' id=\"removeShareError\">" +
                "<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-hidden=\"true\">&times;</button>" +
                "<strong>Un problème est survenue pendant la suppression du partage.</strong>" +
                "</div>");
            $('#shareContent').prepend(removeShareError);
        }});
    },

    addWriteRight:function(e){
        if(!_.isUndefined(e.currentTarget.dataset.id)){
            var id = e.currentTarget.dataset.id;
            var partageCheck = this.privateShareCollection.find(function(model) {
                return model.get('id') == id;
            });
            if(partageCheck.get('ecriture')==0){
                partageCheck.set('ecriture', 1);
            }else{
                partageCheck.set('ecriture', 0);
            }
            $.ajax({
                url: "/lizbox/api/partage/private/"+partageCheck.get('id')+"?haveWriteRight="+partageCheck.get('ecriture'),
                type:"put",
                async: true
            });
        }
    },

    closeShare:function(){
        $(this.el).modal('hide');
    }
});