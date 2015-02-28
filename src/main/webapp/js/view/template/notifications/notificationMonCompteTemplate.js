/**
 * Created by laurent on 01/04/2014.
 */
var NotificationMonCompteTemplate = Backbone.View.extend({

    tagName: 'div',

    events: {
        'click .read':'read'
    },

    initialize: function(){
        this.template = _.template($('#notifications-noread-template').html());
    },

    render : function() {
        $(this.el)
            .addClass("panel panel-default")
            .html(this.template(this.model.toJSON()));
        return this;
    },

    read:function(){
        var notiId = this.model.id;
        $.ajax({
            url: "/lizbox/api/notifications/read/"+notiId,
            type:"GET"
        }).success(function() {
            window.lizbox.notificationsView.refresh();
            try{
                window.utilisateurBar.notificationView.refresh();
            }catch(e){}
        }).error(function(e){
            console.log('Une erreur s\'est produite pendant la mise à jour de la notification.');
        });
    }

});