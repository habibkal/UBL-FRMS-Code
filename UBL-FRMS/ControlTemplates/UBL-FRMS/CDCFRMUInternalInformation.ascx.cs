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
    public partial class CDCFRMUInternalInformation : UserControl
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
            DataTable dtDetectionMode = null;
            DataTable dtFRMUInternalInfoBlockCode = null;

            try
            {
                using (SPSite oSite = new SPSite(sWebUrl))
                {
                    using (SPWeb oWeb = oSite.OpenWeb())
                    {
                        #region Detection Mode Binding Dll
                        try
                        {
                            SPList oList = oWeb.Lists[DetectionModeList.ListName];

                            sQuery = new StringBuilder();

                            sQuery.Append("<Where><Eq><FieldRef Name='" + DetectionModeList.Active + "' /><Value Type='Boolean'>1</Value></Eq></Where>");
                            sQuery.Append("<OrderBy><FieldRef Name='" + DetectionModeList.ID + "' Ascending='TRUE'/></OrderBy>");

                            oQry = new SPQuery();
                            oQry.Query = sQuery.ToString();

                            dtDetectionMode = oList.GetItems(oQry).GetDataTable();

                            if (dtDetectionMode != null && dtDetectionMode.Rows.Count > 0)
                            {
                                ddlDetectionMode.DataValueField = DetectionModeList.ID;
                                ddlDetectionMode.DataTextField = DetectionModeList.Title;
                                ddlDetectionMode.DataSource = dtDetectionMode;
                                ddlDetectionMode.DataBind();
                                ddlDetectionMode.Items.Insert(0, new ListItem("--- Select ---", "0"));
                                ddlDetectionMode.SelectedIndex = 0;
                            }
                        }
                        catch (Exception ex)
                        {
                            //lblMsg.Text = ex.Message.ToString();
                            //CPC_UBL.Classes.Common.Utility.AddException(ex);
                        }
                        #endregion

                        #region FRMU Internal Info Block Code Binding Dll
                        try
                        {
                            SPList oList = oWeb.Lists[FRMUInternalInfoBlockCodeList.ListName];

                            sQuery = new StringBuilder();

                            sQuery.Append("<Where><Eq><FieldRef Name='" + FRMUInternalInfoBlockCodeList.Active + "' /><Value Type='Boolean'>1</Value></Eq></Where>");
                            sQuery.Append("<OrderBy><FieldRef Name='" + FRMUInternalInfoBlockCodeList.ID + "' Ascending='TRUE'/></OrderBy>");

                            oQry = new SPQuery();
                            oQry.Query = sQuery.ToString();

                            dtFRMUInternalInfoBlockCode = oList.GetItems(oQry).GetDataTable();

                            if (dtFRMUInternalInfoBlockCode != null && dtFRMUInternalInfoBlockCode.Rows.Count > 0)
                            {
                                ddlBlockCode.DataValueField = FRMUInternalInfoBlockCodeList.ID;
                                ddlBlockCode.DataTextField = FRMUInternalInfoBlockCodeList.Title;
                                ddlBlockCode.DataSource = dtFRMUInternalInfoBlockCode;
                                ddlBlockCode.DataBind();
                                ddlBlockCode.Items.Insert(0, new ListItem("--- Select ---", "0"));
                                ddlBlockCode.SelectedIndex = 0;
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
