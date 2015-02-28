/**
 * Created by youcef on 22/02/14.
 */
var Offres = Backbone.View.extend({

    el: '.containerOffres',

    initialize: function(){
        this.listenTo(this.collection, 'sync', this.render);
        this.collection.fetch({
            wait : true
        });
    },

    render : function() {
        console.log(this.collection);

        this.collection.each(function(plan){
            $('.'+plan.get('label').toLowerCase()+'-espace').html('<i class="fa fa-hdd-o"></i> '+formatSizeUnits(plan.get('espace')) + " d'espace de stockage");
            $('.'+plan.get('label').toLowerCase()+'-prix').html('<i class="fa fa-euro"></i>'+plan.get('prix'));
            $('.'+plan.get('label').toLowerCase()+'-bandepassante').html('<i class="fa fa-bar-chart-o"></i> Bande passante ' + plan.get('bandepassante'));
            $('.'+plan.get('label').toLowerCase()+'-android').html((plan.get('android')==1) ? '<i class="fa fa-check-square checked"></i> Application Android' : ' ');
            $('.'+plan.get('label').toLowerCase()+'-desktop').html((plan.get('desktop')==1) ? '<i class="fa fa-check-square checked"></i> Application Desktop' : ' ');
        });
    }
});
