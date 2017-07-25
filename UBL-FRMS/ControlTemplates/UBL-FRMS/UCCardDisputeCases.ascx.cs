using Microsoft.SharePoint;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace UBL_FRMS.ControlTemplates.UBL_FRMS
{
    public partial class UCCardDisputeCases : UserControl
    {
        string sWebUrl = SPContext.Current.Site.Url;

        protected void Page_Load(object sender, EventArgs e)
        {
            lnkbtnCreateCPCRequest.NavigateUrl = sWebUrl + "/pages/CreateCardDisputeCases.aspx";
            if (!IsPostBack)
            {
                if (Page.Request.UrlReferrer != null)
                    ViewState["PreviousPage"] = Page.Request.UrlReferrer.OriginalString.ToString();

                DataTable dt = new DataTable();
                grdBucket.DataSource = dt;
                grdBucket.DataBind();
            }
        }
    }
}
