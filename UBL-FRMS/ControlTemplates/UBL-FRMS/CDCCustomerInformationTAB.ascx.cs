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
    public partial class CDCCustomerInformationTAB : UserControl
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
            DataTable dtCardType = null;
            DataTable dtRegion = null;
            DataTable dtCity = null;
            DataTable dtFraudTypeCode = null;
            DataTable dtFraudIncidence = null;
            try
            {
                using (SPSite oSite = new SPSite(sWebUrl))
                {
                    using (SPWeb oWeb = oSite.OpenWeb())
                    {
                        #region Card Type Binding Dll
                        try
                        {
                            SPList oList = oWeb.Lists[CardTypeList.ListName];

                            sQuery = new StringBuilder();

                            sQuery.Append("<Where><Eq><FieldRef Name='" + CardTypeList.Active + "' /><Value Type='Boolean'>1</Value></Eq></Where>");
                            sQuery.Append("<OrderBy><FieldRef Name='" + CardTypeList.ID + "' Ascending='TRUE'/></OrderBy>");

                            oQry = new SPQuery();
                            oQry.Query = sQuery.ToString();

                            dtCardType = oList.GetItems(oQry).GetDataTable();

                            if (dtCardType != null && dtCardType.Rows.Count > 0)
                            {
                                ddlCardType.DataValueField = CardTypeList.ID;
                                ddlCardType.DataTextField = CardTypeList.Title;
                                ddlCardType.DataSource = dtCardType;
                                ddlCardType.DataBind();
                                ddlCardType.Items.Insert(0, new ListItem("--- Select ---", "0"));
                                ddlCardType.SelectedIndex = 0;
                            }
                        }
                        catch (Exception ex)
                        {
                            //lblMsg.Text = ex.Message.ToString();
                            //CPC_UBL.Classes.Common.Utility.AddException(ex);
                        }
                        #endregion

                        #region Regions Binding Dll
                        try
                        {
                            SPList oList = oWeb.Lists[RegionList.ListName];

                            sQuery = new StringBuilder();

                            sQuery.Append("<Where><Eq><FieldRef Name='" + RegionList.Active + "' /><Value Type='Boolean'>1</Value></Eq></Where>");
                            sQuery.Append("<OrderBy><FieldRef Name='" + RegionList.ID + "' Ascending='TRUE'/></OrderBy>");

                            oQry = new SPQuery();
                            oQry.Query = sQuery.ToString();

                            dtRegion = oList.GetItems(oQry).GetDataTable();

                            if (dtRegion != null && dtRegion.Rows.Count > 0)
                            {
                                ddlRegion.DataValueField = RegionList.ID;
                                ddlRegion.DataTextField = RegionList.Title;
                                ddlRegion.DataSource = dtRegion;
                                ddlRegion.DataBind();
                                ddlRegion.Items.Insert(0, new ListItem("--- Select ---", "0"));
                                ddlRegion.SelectedIndex = 0;
                            }
                        }
                        catch (Exception ex)
                        {
                            //lblMsg.Text = ex.Message.ToString();
                            //CPC_UBL.Classes.Common.Utility.AddException(ex);
                        }
                        #endregion

                        #region City Binding Dll
                        try
                        {
                            SPList oList = oWeb.Lists[CityList.ListName];

                            sQuery = new StringBuilder();

                            sQuery.Append("<Where><Eq><FieldRef Name='" + CityList.Active + "' /><Value Type='Boolean'>1</Value></Eq></Where>");
                            sQuery.Append("<OrderBy><FieldRef Name='" + CityList.ID + "' Ascending='TRUE'/></OrderBy>");

                            oQry = new SPQuery();
                            oQry.Query = sQuery.ToString();

                            dtCity = oList.GetItems(oQry).GetDataTable();

                            if (dtCity != null && dtCity.Rows.Count > 0)
                            {
                                ddlCity.DataValueField = CityList.ID;
                                ddlCity.DataTextField = CityList.Title;
                                ddlCity.DataSource = dtCity;
                                ddlCity.DataBind();
                                ddlCity.Items.Insert(0, new ListItem("--- Select ---", "0"));
                                ddlCity.SelectedIndex = 0;
                            }
                        }
                        catch (Exception ex)
                        {
                            //lblMsg.Text = ex.Message.ToString();
                            //CPC_UBL.Classes.Common.Utility.AddException(ex);
                        }
                        #endregion

                        #region Fraud Type Code Binding Dll
                        try
                        {
                            SPList oList = oWeb.Lists[FraudTypeCodeList.ListName];

                            sQuery = new StringBuilder();

                            sQuery.Append("<Where><Eq><FieldRef Name='" + FraudTypeCodeList.Active + "' /><Value Type='Boolean'>1</Value></Eq></Where>");
                            sQuery.Append("<OrderBy><FieldRef Name='" + FraudTypeCodeList.ID + "' Ascending='TRUE'/></OrderBy>");

                            oQry = new SPQuery();
                            oQry.Query = sQuery.ToString();

                            dtFraudTypeCode = oList.GetItems(oQry).GetDataTable();

                            if (dtFraudTypeCode != null && dtFraudTypeCode.Rows.Count > 0)
                            {
                                ddlFraudTypeCode.DataValueField = FraudTypeCodeList.ID;
                                ddlFraudTypeCode.DataTextField = FraudTypeCodeList.Title;
                                ddlFraudTypeCode.DataSource = dtFraudTypeCode;
                                ddlFraudTypeCode.DataBind();
                                ddlFraudTypeCode.Items.Insert(0, new ListItem("--- Select ---", "0"));
                                ddlFraudTypeCode.SelectedIndex = 0;
                            }
                        }
                        catch (Exception ex)
                        {
                            //lblMsg.Text = ex.Message.ToString();
                            //CPC_UBL.Classes.Common.Utility.AddException(ex);
                        }
                        #endregion

                        #region Fraud Incidence Binding Dll
                        try
                        {
                            SPList oList = oWeb.Lists[FraudIncidenceList.ListName];

                            sQuery = new StringBuilder();

                            sQuery.Append("<Where><Eq><FieldRef Name='" + FraudIncidenceList.Active + "' /><Value Type='Boolean'>1</Value></Eq></Where>");
                            sQuery.Append("<OrderBy><FieldRef Name='" + FraudIncidenceList.ID + "' Ascending='TRUE'/></OrderBy>");

                            oQry = new SPQuery();
                            oQry.Query = sQuery.ToString();

                            dtFraudIncidence = oList.GetItems(oQry).GetDataTable();

                            if (dtFraudIncidence != null && dtFraudIncidence.Rows.Count > 0)
                            {
                                ddlFraudIncidence.DataValueField = FraudIncidenceList.ID;
                                ddlFraudIncidence.DataTextField = FraudIncidenceList.Title;
                                ddlFraudIncidence.DataSource = dtFraudIncidence;
                                ddlFraudIncidence.DataBind();
                                ddlFraudIncidence.Items.Insert(0, new ListItem("--- Select ---", "0"));
                                ddlFraudIncidence.SelectedIndex = 0;
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
