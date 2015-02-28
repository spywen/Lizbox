/**
 * Created by laurent on 15/02/2014.
 */
var Dossier = Backbone.Collection.extend({
    url : '/lizbox/api/documents',
    model: Document
});
