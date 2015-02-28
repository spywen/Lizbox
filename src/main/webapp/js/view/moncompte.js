/**
 * Created by laurent on 30/05/2014.
 */
var MonCompteView = Backbone.View.extend({

    el: '#stats',

    initialize: function(){
        this.listenTo(this.model, 'sync', this.render);
        this.model.fetch({
            wait : true
        });
    },

    render : function() {
        var statsDiv = this.$el;
        statsDiv.empty();
        var stats = this.model;
        var monCompteTemplate = new MonCompteTemplate({ model: stats});
        statsDiv.append(monCompteTemplate.render().el);
        new GravatarMonCompte();
        return this;
    }
});