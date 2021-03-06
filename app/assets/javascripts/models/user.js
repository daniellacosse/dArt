DArt.Models.User = Backbone.Model.extend({

  urlRoot: "/api/users",

  parse: function (jsonResp) {
    if (jsonResp.deviations){
      this._deviations = new DArt.Collections.Deviations(jsonResp.deviations,
        {parse: true}
      );

      delete jsonResp.deviations;
    }

    if (jsonResp.journals){
      this._journals = new DArt.Collections.Journals(jsonResp.journals,
         {parse: true}
       );

      delete jsonResp.journals;
    }

    if (jsonResp.galleries){
      this._galleries = new DArt.Collections.Galleries(jsonResp.galleries,
        {parse: true}
      );

      delete jsonResp.galleries;
    }

    if (jsonResp.notifications){
      this._notifications = new DArt.Collections.Notifications(jsonResp.notifications,
        {parse: true}
     )
    }

    return jsonResp
  }

});
