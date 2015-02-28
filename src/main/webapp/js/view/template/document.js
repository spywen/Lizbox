/**
 * Created by laurent on 15/02/2014.
 */
var DocumentTemplateView = Backbone.View.extend({

    tagName: 'tr',

    events: {
        'dragstart': 'dragStart',
        'drop .dragDropElement': 'dropIn',
        'dragenter .dragDropElement': 'dragEnter',
        'dragleave .dragDropElement': 'dragLeave',
        'dragover .dragDropElement': 'dragOver'
    },

    initialize: function(){
        this.template = _.template($('#document-template').html());
        this.model.on('change',this.render,this);
    },

    render : function() {
        this.$el
            .attr("draggable",'true')
            .attr("data-id",this.model.id)
            .html(this.template(this.model.toViewObject()));
        return this;
    },

    dragStart: function () {
        var idElementDrag = this.model.id;
        event.dataTransfer.setData("text/plain",idElementDrag);
        event.dataTransfer.setData("model",this.model);
        event.target.style.color = "#777";
        //event.dataTransfer.effectAllowed = "move";
    },

    dropIn: function () {
        var folderId = this.model.id;
        //event.target.style.color = "#CCC";
        $.ajax({
            url: "/lizbox/api/documents?idDossier="+folderId+"&idDocument="+event.dataTransfer.getData("text/plain"),
            type:"put"
        }).success(function() {
            window.lizbox.arborescence.refresh();
            window.lizbox.notification('success','Elément déplacé.');
        }).error(function(e){
            window.lizbox.notification('error',e.responseJSON.message);
        });
        this.resetColor();
    },

    dragEnter: function(){
        //event.target.style.color = "red";
        event.preventDefault();
    },

    dragLeave: function(){
        event.target.style.color = "rgb(230, 230, 230)";
    },

    dragOver : function(){
        event.target.style.color = "rgb(50, 152, 219)";
        event.dataTransfer.dropEffect = "move";
        event.preventDefault();
        return false;
    },

    resetColor : function(){
        $(".dragDropElement").css("color","rgb(230, 230, 230)");
    }

});