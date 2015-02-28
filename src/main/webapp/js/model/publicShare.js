/**
 * Created by laurent on 11/05/2014.
 */
var PublicShare = Backbone.Model.extend({
    urlRoot: '/lizbox/api/partage/public',
    idAttribute: "idDocument",
    defaults: {
        idDocument: null,
        isPublicShare:false,
        publicShareLink:""
    },

    toJSON: function () {
        var json = Backbone.Model.prototype.toJSON.call(this);
        json.attrChecked = (this.get('isPublicShare')) ? 'checked="checked"' : '';
        json.attrEnabled = (!this.get('isPublicShare')) ? 'disabled="disabled"' : '';
        return json;
    }
});