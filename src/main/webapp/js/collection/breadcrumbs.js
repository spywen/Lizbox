/**
 * Created by laurent on 21/02/2014.
 */
var Breadcrumbs = Backbone.Collection.extend({
    /*urlRoot : '/api/documents/arbo/{id}',
    url : function() {
        return Backbone.Model.prototype.url.call(this).replace('{idPersonne}', this.get("idPersonne") );
    },A utiliser pourl es méthodes avec une urlRoot au dessus*/
    model: Document,
    query : function (idFolder) {
        this.url = '/lizbox/api/documents/arbo/'+idFolder;
        return this;
    }
});