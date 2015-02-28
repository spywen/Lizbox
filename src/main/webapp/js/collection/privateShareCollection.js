/**
 * Created by laurent on 14/05/2014.
 */
var PrivateShareCollection = Backbone.Collection.extend({
    url : '/lizbox/api/partage/private',
    model: PrivateShare
});