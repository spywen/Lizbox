/**
 * Created by laurent on 15/02/2014.
 */
var ArborescenceView = Backbone.View.extend({

    el: '#arborescence',

    events: {
        'click .folder' : 'enterFolder',
        'click .linkPrev' : 'closeFolder',
        'click #deleteDoc' : 'deleteDoc',
        'click .check' : 'checkFile',
        'click #refresh' : 'refresh',
        'click #selectAll' : 'checkAll',
        'click #upload' : 'goToUploadPage'
    },

    initialize: function(){
        //Boutons
        //$('.tooltipp').tooltip();

        //Init root collection of documents
        this.listenTo(this.collection, 'sync', this.render);
        this.currentFolder = "0";
        this.refresh();

        this.chckbxSelectAll = this.$el.find("input#selectAll");

        //Init breadcrumb ('arborescence') to the root
        this.breadcrumb_collection = new Breadcrumbs();
        this.listenTo(this.breadcrumb_collection, 'sync', this.render_breadcrumb);
        this.breadcrumb_collection.query("0").fetch({
            wait : true
        });

        //Modal to create folder
        this.$('#newFolder').newFolderModal();
        //Modal to share
        this.$('#share').shareDocumentModal();

        this.listenTo(this.collection, 'change', this.render);
        this.listenTo(this.collection, 'destroy', this.render);
    },

    refresh: function(){
        this.collection.fetch({
            wait : true,
            data: $.param({ idDossierparent: this.currentFolder})
        });
    },

    render : function() {
        console.log('REFRESH');
        var tbody = $(this.el).find('tbody');
        tbody.empty();
        if (this.collection.length >= 1) {
            this.collection.each(function(document){
                var documentTemplate = new DocumentTemplateView({ model: document});
                tbody.append(documentTemplate.render().el);
            }, this);
        }
        return this;
    },

    render_breadcrumb : function(){
        var bc = $('#breadcrumb');
        bc.empty();
        if (this.breadcrumb_collection.length >= 1) {
            this.breadcrumb_collection.each(function(dossier){
                var breadcrumbTemplate = new BreadcrumbTemplateView({ model: dossier});
                bc.append(breadcrumbTemplate.render().el);
            }, this);
        }
    },

    enterFolder: function(e){
        var idFolder = e.currentTarget.dataset.id;
        var documentClick = this.collection.get(idFolder);
        this.currentFolder = idFolder;
        var breadcrumbC = this.breadcrumb_collection;
        this.collection.fetch({
            wait : true,
            data: $.param({ idDossierparent: documentClick.get('id')}),
            error:function(){
                window.lizbox.notification('error','<strong>Une erreur est survenue pendant le chargement du dossier. Veuillez réessayez.</strong>');
            }
        });

        //MAJ breadcrumb
        this.breadcrumb_collection.query(documentClick.get('id')).fetch({
            wait : true
        });
        this.chckbxSelectAll[0].checked = false;
    },
    closeFolder : function(e){
        var id = (_.isUndefined(e.currentTarget.dataset.id)) ? "0" : e.currentTarget.dataset.id;
        this.currentFolder = id;
        this.collection.fetch({
            wait : true,
            data: $.param({ idDossierparent: id})
        });

        this.breadcrumb_collection.query(id).fetch({
            wait : true
        });
        this.chckbxSelectAll[0].checked = false;
    },

    deleteDoc:function(){
        var documentChecked = this.collection.where({'_checked':1});
        if(documentChecked.length==0){
            window.lizbox.notification('warning','<strong>Aucun fichier à supprimer.</strong>');
        }else{
            _.each(documentChecked, function(document){
                document.destroy({
                    wait:true,
                    success : _.bind(function(model, response) {
                        if(document.get('estfichier')){
                            window.lizbox.notification('success','<strong>Fichier supprimé :</strong> '+document.get('nom'));
                        }else{
                            window.lizbox.notification('success','<strong>Dossier supprimé :</strong> '+document.get('nom'));
                        }
                    }, this),
                    error : _.bind(function(model, response) {
                        if(response.responseJSON != null && response.responseJSON.message != null){
                            window.lizbox.notification('error',response.responseJSON.message+'</strong>');
                        }else{
                            if(document.get('estfichier')){
                                window.lizbox.notification('error','<strong>Une erreur est survenue pendant la suppression du fichier '+document.get('nom')+'.</strong>');
                            }else{
                                window.lizbox.notification('error','<strong>Une erreur est survenue pendant la suppression du dossier '+document.get('nom')+'.</strong> Veillez bien à vider son contenu avant de le supprimer.');
                            }
                        }
                    }, this)
                });
            });
        }
        this.chckbxSelectAll[0].checked = false;
    },

    checkFile : function(e){
        if(!_.isUndefined(e.currentTarget.dataset.id)){
            var id = e.currentTarget.dataset.id;
            var documentCheck = this.collection.find(function(model) {
                return model.get('id') == id;
            });
            if(documentCheck.get('_checked')==0){
                documentCheck.set('_checked', 1);
            }else{
                documentCheck.set('_checked', 0);
            }
        }
    },

    checkAll: function(e){
        var isChecked = e.currentTarget.checked;
        if (this.collection.length >= 1) {
            this.collection.each(function(document){
                if(isChecked){
                    document.set('_checked', 1);
                }else{
                    document.set('_checked', 0);
                }
            }, this);
        }
        this.refresh();
    },

    goToUploadPage: function(){
        document.location.href="/lizbox/documents/upload";
    }



});
