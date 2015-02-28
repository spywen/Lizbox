/**
 * Created by laurent on 23/03/2014.
 */
var GravatarTopBar = Backbone.View.extend({

    el: '.gravatarTopBar',

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