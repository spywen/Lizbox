/**
 * Created by laurent on 03/06/2014.
 */
var GravatarMonCompte = Backbone.View.extend({

    el: '#gravatarMonCompte',

    initialize: function(){
        $.ajax({
            url: "/lizbox/api/miscellaneous",
            type: "GET"
        }).always(function(response){
            var avatar = $('.gravatarImg');
            avatar.attr('src',response.responseText);
        });
    }
});