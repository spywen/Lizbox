/**
 * Created by laurent on 21/02/2014.
 */
var BreadcrumbTemplateView = Backbone.View.extend({


    tagName: 'li',

    events: {

    },

    initialize: function(){
        this.template = _.template($('#breadcrumb-template').html());
    },

    render : function() {
        this.$el.html(this.template(this.model.toJSON()));
        return this;
    }

});