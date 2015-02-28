/**
 * Created by lbabin on 01/02/14.
 */
var Utilisateurs = Backbone.Collection.extend({
    url : '/lizbox/api/utilisateurs',
    model: Utilisateur
});
