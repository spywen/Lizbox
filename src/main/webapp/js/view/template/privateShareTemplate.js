/**
 * Created by laurent on 14/05/2014.
 */
var PrivateShareTemplateView = Backbone.View.extend({


    tagName: 'tr',

    events: {

    },

    initialize: function(){
        this.template = _.template($('#private-share-template').html());
    },

    render : function() {
        $(this.el).html(this.template(this.model.toJSON()));
        return this;
    }

});