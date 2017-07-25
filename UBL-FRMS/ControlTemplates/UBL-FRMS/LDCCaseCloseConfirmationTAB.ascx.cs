using System;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace UBL_FRMS.ControlTemplates.UBL_FRMS
{
    public partial class LDCCaseCloseConfirmationTAB : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DataTable dt = new DataTable();
                grdUploadDoc.DataSource = dt;
                grdUploadDoc.DataBind();
            }
        }

        protected void grdUploadDoc_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }
    }
}
