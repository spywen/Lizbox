/**
 * Created by laurent on 01/04/2014.
 */
var NotificationTopBarTemplate = Backbone.View.extend({

    tagName: 'li',

    events: {
        'click .read':'read'
    },

    initialize: function(){
        this.template = _.template($('#notification-template').html());
    },

    render : function() {
        $(this.el).addClass('notification').html(this.template(this.model.toJSON()));
        return this;
    },

    read:function(){
        var notiId = this.model.id;
        $.ajax({
            url: "/lizbox/api/notifications/read/"+notiId,
            type:"GET"
        }).success(function() {
            window.utilisateurBar.notificationView.refresh();
            try{
                window.lizbox.notificationsView.refresh();
            }catch(e){ }
        }).error(function(e){
            console.log('Une erreur s\'est produite pendant la mise à jour de la notification.');
        });
    }

});