/**
 * Created by laurent on 11/05/2014.
 */
var PublicShareTemplateView = Backbone.View.extend({


    tagName: 'div',

    events: {

    },

    initialize: function(){
        this.template = _.template($('#public-share-template').html());
    },

    render : function() {
        $(this.el).html(this.template(this.model.toJSON()));
        return this;
    }

});