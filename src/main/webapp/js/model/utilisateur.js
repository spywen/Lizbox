/**
 * Created by lbabin on 01/02/14.
 */

var Utilisateur = Backbone.Model.extend({
    url: '/lizbox/api/utilisateurs',
    idAttribute: "id",
    defaults: {
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
    }
});