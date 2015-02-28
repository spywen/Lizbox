/**
 * Created by laurent on 15/02/2014.
 */
var Document = Backbone.Model.extend({
    urlRoot: '/lizbox/api/documents',
    idAttribute: "id",
    defaults: {
        id: null,
        nom: '',
        extension: '',
        user: null,
        dossierparent: '',
        typefichier: '',
        estfichier: null,
        creation: 0,
        modification: 0,
        taille: 0,
        partagepublic: null,
        partageprivee: null,
        _checked : 0
    },
    toViewObject: function () {
        var json = Backbone.Model.prototype.toJSON.call(this);
        json.creation = (this.get('creation') == null) ? "-" : moment(this.get('creation')).format('DD-MM-YYYY');
        json.modification = (this.get('modification') == null) ? "-" :  moment(this.get('modification')).format('DD-MM-YYYY');
        json.nom = (this.get('estfichier')) ? this.get('nom') + '.' + this.get('extension') : this.get('nom');
        json.image = (this.get('estfichier')) ? '' : 'fa fa-folder-open';
        json.taille = formatSizeUnits(this.get('taille'));
        json.link = (this.get('estfichier')) ? '/lizbox/api/documents/download/'+this.get('id') : '#';
        json.linkCompl = (this.get('estfichier')) ? 'target="_blank"' : '';
        json.linkClass = (this.get('estfichier')) ? 'file' : 'folder';
        json.publicShare = (this.get('partagepublic')) ?
            (this.get('estfichier')) ?
                '<i class="fa fa-globe fa-lg col-md-6" data-toggle="tooltip" data-placement="top" title="Le partage public est activé."></i>'
                :
                '<i class="col-md-6"></i> '
        :
            (this.get('estfichier')) ?
                '<i class="fa fa-globe noactive fa-lg col-md-6" data-toggle="tooltip" data-placement="top" title="Le partage public est désactivé."></i>'
                :
                '<i class="col-md-6"></i> ';
        json.privateShare = (this.get('partageprivee')) ?
            (this.get('estfichier')) ?
                '<i class="fa fa-users fa-lg col-md-6" data-toggle="tooltip" data-placement="top" title="Le partage privé est activé."></i>'
                :
                '<i class="col-md-6"></i> '
            :
            (this.get('estfichier')) ?
                '<i class="fa fa-users noactive fa-lg col-md-6" data-toggle="tooltip" data-placement="top" title="Le partage privé est désactivé."></i>'
                :
                '<i class="col-md-6"></i> ';

        json.attrChecked = (this.get('_checked')==1) ? 'checked="checked"' : '';
        json.tooltipDownloadFile = (this.get('estfichier') == 1) ? "Cliquer pour télécharger ("+ this.get('typefichier') +")" : "";
        return json;
    },
    toJSON: function() {
        var attr = _.clone(this.attributes);
        delete attr._checked;
        return attr;
    },
    getNom: function(){
        return (this.get('estfichier')) ? this.get('nom') + '.' + this.get('extension') : this.get('nom');
    }
});