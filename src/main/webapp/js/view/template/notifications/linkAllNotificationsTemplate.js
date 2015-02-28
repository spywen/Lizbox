/**
 * Created by laurent on 01/06/2014.
 */
var LinkAllNotificationsTemplate = Backbone.View.extend({
    tagName: 'li',

    initialize: function(){
        this.templateAllNotification = _.template($('#all-notification-link-template').html());
    },

    render : function() {
        $(this.el).append(this.templateAllNotification());
        return this;
    }

});