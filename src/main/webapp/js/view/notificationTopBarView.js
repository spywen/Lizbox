/**
 * Created by laurent on 24/03/2014.
 */
var NotificationTopBarView = Backbone.View.extend({
    el: '#ContainerNotifications',

    events: {
        'click #readAll' : 'readAll'
    },

    initialize: function(){
        this.listenTo(this.collection, 'sync', this.render);
        this.refresh();
    },

    refresh: function(){
        this.collection.fetch({
            wait : true
        });
    },

    render : function() {
        var ul = $(this.el).find('ul');
        ul.empty();
        var countNotificationUread = this.countNotificationsUread(this.collection);
        this.$el.find('.countNotification').html(countNotificationUread);
        if (this.collection.length >= 1) {
            this.collection.each(function(notification){
                var notificationTemplate = new NotificationTopBarTemplate({ model: notification});
                ul.append(notificationTemplate.render().el);
            }, this);
        }
        var allNotificationsTemplate = new LinkAllNotificationsTemplate();
        ul.append(allNotificationsTemplate.render().el);
    },

    countNotificationsUread : function(collection){
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
    },

    readAll:function(){
        var currentView = this;
        $.ajax({
            url: "/lizbox/api/notifications/readAll",
            type:"GET"
        }).success(function() {
            currentView.refresh();
        }, this).error(function(e){
            console.log('Une erreur s\'est produite pendant la mise à jour des notifications.');
        });
    }

});
