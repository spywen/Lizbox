/**
 * Created by youcef on 22/02/14.
 */
var Plan = Backbone.Model.extend({
    url: '/lizbox/api/plans',
    idAttribute: "nom",
    defaults: {
        espace: '',
        prix: '',
        duree: '',
        nom: '',
        label: '',
        android: '',
        desktop: '',
        bandepassante: ''
    }
});