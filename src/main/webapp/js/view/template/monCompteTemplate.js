/**
 * Created by laurent on 30/05/2014.
 */
var MonCompteTemplate = Backbone.View.extend({

    initialize: function(){
        this.template = _.template($('#mon-compte-template').html());
    },

    render : function() {
        $(this.el).html(this.template(this.model.toViewObject()));
        return this;
    }

});