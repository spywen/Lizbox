/**
 * Created by laurent on 24/03/2014.
 */
var Notification = Backbone.Model.extend({
    defaults: {
        id:0,
        titre: '',
        message: '',
        date: 0,
        type: '',
        lu: null
    },
    toJSON: function () {
        var json = Backbone.Model.prototype.toJSON.call(this);
        json.date = moment(this.get('date')).format('DD/MM/YYYY');
        json.lu = (this.get('lu')) ? 'fa-circle' : 'fa-circle-o';
        json.classLu = (this.get('lu')) ? 'read' : 'unread';
        json.smallDate = moment(this.get('date')).format('MM/YY');
        json.toread = (this.get('lu')) ? '' : 'read pointer';
        json.tooltipToread = (this.get('lu')) ? '' : 'Marquer comme lu';
        return json;
    }
});