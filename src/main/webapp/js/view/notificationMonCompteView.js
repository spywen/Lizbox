/**
 * Created by laurent on 01/06/2014.
 */
var NotificationMonCompteView = Backbone.View.extend({
    el: '#ContainerNotificationsMonCompte',

    initialize: function(){
        this.notificationsRead = new NotificationsRead();
        this.notificationsUnread = new NotificationsNoRead();

        this.listenTo(this.notificationsUnread, 'sync', this.renderNotificationsNoRead);
        this.listenTo(this.notificationsRead, 'sync', this.renderNotificationsRead);
        this.refresh();
    },

    refresh: function(){
        this.notificationsUnread.fetch({
            wait : true
        });
        this.notificationsRead.fetch({
            wait : true
        });
    },

    renderNotificationsNoRead : function() {
        var notificationsNoReadDiv = $("#notificationsNoRead");
        notificationsNoReadDiv.empty();
        //var countNotificationUread = this.countNotificationsUread(this.collection);
        //this.$el.find('.countNotification').html(countNotificationUread);
        if (this.notificationsUnread.length >= 1) {
            this.notificationsUnread.each(function(notification){
                var notificationTemplate = new NotificationMonCompteTemplate({ model: notification});
                notificationsNoReadDiv.append(notificationTemplate.render().el);
            }, this);
        }
        return this;
    },

    renderNotificationsRead : function() {
        var notificationsReadDiv = $("#notificationsRead");
        notificationsReadDiv.empty();
        //var countNotificationUread = this.countNotificationsUread(this.collection);
        //this.$el.find('.countNotification').html(countNotificationUread);
        if (this.notificationsRead.length >= 1) {
            this.notificationsRead.each(function(notification){
                var notificationTemplate = new NotificationMonCompteTemplate({ model: notification});
                notificationsReadDiv.append(notificationTemplate.render().el);
            }, this);
        }
        return this;
    }

    /*countNotificationsUread : function(collection){
        var count = 0;
        collection.each(function(notification){
            if(!notification.get('lu')){
                count++;
            }
        });
        if(count){
            return count;
        }else{
            return '';
        }
    }*/

});