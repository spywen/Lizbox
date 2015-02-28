/**
 * Created by youcef on 22/02/14.
 */
var Plans = Backbone.Collection.extend({
    url : '/lizbox/api/plans',
    model: Plan
});