/**
 * Created by laurent on 24/03/2014.
 */
var NotificationsNoRead = Backbone.Collection.extend({
    url : '/lizbox/api/notifications/unread?count=0',
    model:Notification
});