/**
 * Created by laurent on 14/05/2014.
 */
var PrivateShare = Backbone.Model.extend({
    urlRoot: '/lizbox/api/partage/private',
    idAttribute: "id",
    defaults: {
        "id": null,
        "document": '',
        "emeteur": {
            id: null,
            nom: '',
            prenom: '',
            male: null,
            pseudo: '',
            email: '',
            password: '',
            role: '',
            inscription: 0,
            actif:null
        },
        "recepteur": {
            id: null,
            nom: '',
            prenom: '',
            male: null,
            pseudo: '',
            email: '',
            password: '',
            role: '',
            inscription: 0,
            actif:null
        },
        "debut": null,
        "ecriture": null,
        "accepte": null
    },

    toJSON: function () {
        var json = Backbone.Model.prototype.toJSON.call(this);
        json.attrChecked = (this.get('ecriture')) ? 'checked="checked"' : '';
        json.userLabel = this.get('recepteur').pseudo + " (" + this.get('recepteur').email + ")";
        return json;
    }
});