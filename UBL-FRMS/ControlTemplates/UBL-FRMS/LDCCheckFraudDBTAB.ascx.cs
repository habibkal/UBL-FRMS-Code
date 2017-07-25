using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace UBL_FRMS.ControlTemplates.UBL_FRMS
{
    public partial class LDCCheckFraudDBTAB : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { 
                DataTable dt = new DataTable();
                grdCheckFraudDB.DataSource = dt;
                grdCheckFraudDB.DataBind();
            }
        }
    }
}
