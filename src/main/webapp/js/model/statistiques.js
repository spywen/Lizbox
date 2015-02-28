/**
 * Created by laurent on 30/05/2014.
 */
var StatistiquesModel = Backbone.Model.extend({
    urlRoot: '/lizbox/api/statistiques',
    default: {
        "utilisateurEntity": {
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
        "souscription": null,
        "planEntity": {
            espace: '',
            prix: '',
            duree: '',
            nom: '',
            label: '',
            android: '',
            desktop: '',
            bandepassante: ''
    },
        "partageStatistiques": {
            "nbrPartageTotal": null,
            "nbrPartagePublic": null,
            "nbrPartagePrivee": null,
            "nbrPartageAMoi": null
    },
        "documentsStatistiques": {
            "pourcentageEspaceUtilise": null,
            "espaceUtilise": null,
            "espaceTotal": null,
            "nbrFichiers": null,
            "nbrDossiers": null
    }
},

    toViewObject: function () {
        var json = Backbone.Model.prototype.toJSON.call(this);
        json.unUsedStorage = formatSizeUnits(this.get('documentsStatistiques').espaceTotal-this.get('documentsStatistiques').espaceUtilise);
        json.totalStorage = formatSizeUnits(this.get('documentsStatistiques').espaceTotal);
        json.isMale = (this.get('utilisateurEntity').male == 1) ? "Mr." : "Mm."
        json.registerDate = (this.get('utilisateurEntity').inscription == null) ? "-" : moment(this.get('utilisateurEntity').inscription).format('DD-MM-YYYY');

        json.hasAndroid = (this.get('planEntity').android == 1) ? "block" : "none"
        json.hasDesktop = (this.get('planEntity').desktop == 1) ? "block" : "none"
        return json;
    }
});