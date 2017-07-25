using Microsoft.SharePoint;
using System;
using System.Data;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using UBL_FRMS.Classes.Data;

namespace UBL_FRMS.ControlTemplates.UBL_FRMS
{
    public partial class CDCFactsAndFinding : UserControl
    {
        #region Declaration

        string sWebUrl = SPContext.Current.Site.Url;
        StringBuilder sQuery = null;
        SPQuery oQry = null;

        #endregion Declaration

        #region Event
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillDropdowns();
            }
        }
        #endregion

        #region Method
        private void FillDropdowns()
        {
            DataTable dtFactAndFindingStatus = null;
            try
            {
                using (SPSite oSite = new SPSite(sWebUrl))
                {
                    using (SPWeb oWeb = oSite.OpenWeb())
                    {
                        #region Fact and Finding Status Binding Dll
                        try
                        {
                            SPList oList = oWeb.Lists[FactAndFindingStatusList.ListName];

                            sQuery = new StringBuilder();

                            sQuery.Append("<Where><Eq><FieldRef Name='" + FactAndFindingStatusList.Active + "' /><Value Type='Boolean'>1</Value></Eq></Where>");
                            sQuery.Append("<OrderBy><FieldRef Name='" + FactAndFindingStatusList.ID + "' Ascending='TRUE'/></OrderBy>");

                            oQry = new SPQuery();
                            oQry.Query = sQuery.ToString();

                            dtFactAndFindingStatus = oList.GetItems(oQry).GetDataTable();

                            if (dtFactAndFindingStatus != null && dtFactAndFindingStatus.Rows.Count > 0)
                            {
                                ddlFStatus.DataValueField = FactAndFindingStatusList.ID;
                                ddlFStatus.DataTextField = FactAndFindingStatusList.Title;
                                ddlFStatus.DataSource = dtFactAndFindingStatus;
                                ddlFStatus.DataBind();
                                ddlFStatus.Items.Insert(0, new ListItem("--- Select ---", "0"));
                                ddlFStatus.SelectedIndex = 0;
                            }
                        }
                        catch (Exception ex)
                        {
                            //lblMsg.Text = ex.Message.ToString();
                            //CPC_UBL.Classes.Common.Utility.AddException(ex);
                        }
                        #endregion
                    }
                }
            }
            catch (Exception ex)
            {
                //lblMsg.Text = ex.Message.ToString();
                //CPC_UBL.Classes.Common.Utility.AddException(ex);
            }
        }
        #endregion
    }
}
