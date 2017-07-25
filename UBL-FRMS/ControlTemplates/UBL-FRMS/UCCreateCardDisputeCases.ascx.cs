using Microsoft.SharePoint.Utilities;
using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace UBL_FRMS.ControlTemplates.UBL_FRMS
{
    public partial class UCCreateCardDisputeCases : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void lnkBtnCancel_Click(object sender, EventArgs e)
        {

        }

        private void RedirectRelevantPage()
        {
            //try
            //{
            //    if (ViewState["PreviousPage"] != null)
            //        SPUtility.Redirect(ViewState["PreviousPage"].ToString(), SPRedirectFlags.DoNotEndResponse, HttpContext.Current);
            //    else
            //        SPUtility.Redirect(sWebUrl, SPRedirectFlags.DoNotEndResponse, HttpContext.Current);
            //}
            //catch (Exception ex)
            //{
            //    lblMsg.Text = ex.Message.ToString();
            //    //UBL_FRMS.Classes.Common.Utility.AddException(ex);
            //}
            //finally { }
        }
    }
}
