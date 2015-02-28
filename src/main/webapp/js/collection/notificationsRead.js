/**
 * Created by laurent on 01/06/2014.
 */
var NotificationsRead = Backbone.Collection.extend({
    url : '/lizbox/api/notifications/read?count=0',
    model:Notification
});