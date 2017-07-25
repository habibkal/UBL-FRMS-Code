using Microsoft.SharePoint;
using System;
using System.Data;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using UBL_FRMS.Classes.Data;
using System.ComponentModel;
using System.Reflection;

namespace UBL_FRMS.ControlTemplates.UBL_FRMS
{
    public partial class CDCTransactionTAB : UserControl
    {
        #region Declaration

        string sWebUrl = SPContext.Current.Site.Url;
        StringBuilder sQuery = null;
        SPQuery oQry = null;
        DataTable dt = new DataTable();

  

        enum enumStatus
        {
            [Description("Under Authorization")]
            transUnderConsideration ,
            [Description("Declined")]
            transDeclined ,
            [Description("Approved")]
            transApproved ,
            [Description("Rejected")]
            transRejected         
        }


        #endregion Declaration

        #region Event
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                FillDropdowns();

                grdApproved.DataSource = dt;
                grdApproved.DataBind();

                grdDeclined.DataSource = dt;
                grdDeclined.DataBind();

                grdRejected.DataSource = dt;
                grdRejected.DataBind();

                grdUnderConsideration.DataSource = dt;
                grdUnderConsideration.DataBind();

            }
        }
        #endregion

        #region Method
        private void FillDropdowns()
        {
            DataTable dtTransactionStatus = null;
            DataTable dtCountry = null;
            DataTable dtMCC = null;
            DataTable dtUFL = null;
            DataTable dtTC40SAFE = null;
            DataTable dtTransactionBaseCurrency = null;
            DataTable dtTransactionApprovalMode = null;

            try
            {
                using (SPSite oSite = new SPSite(sWebUrl))
                {
                    using (SPWeb oWeb = oSite.OpenWeb())
                    {
                        #region Transaction Status Binding Dll
                        try
                        {
                            SPList oList = oWeb.Lists[TransactionStatusList.ListName];

                            sQuery = new StringBuilder();

                            sQuery.Append("<Where><Eq><FieldRef Name='" + TransactionStatusList.Active + "' /><Value Type='Boolean'>1</Value></Eq></Where>");
                            sQuery.Append("<OrderBy><FieldRef Name='" + TransactionStatusList.ID + "' Ascending='TRUE'/></OrderBy>");

                            oQry = new SPQuery();
                            oQry.Query = sQuery.ToString();

                            dtTransactionStatus = oList.GetItems(oQry).GetDataTable();

                            if (dtTransactionStatus != null && dtTransactionStatus.Rows.Count > 0)
                            {
                                ddlTransactionStatus.DataValueField = TransactionStatusList.ID;
                                ddlTransactionStatus.DataTextField = TransactionStatusList.Title;
                                ddlTransactionStatus.DataSource = dtTransactionStatus;
                                ddlTransactionStatus.DataBind();
                                ddlTransactionStatus.Items.Insert(0, new ListItem("--- Select ---", "0"));
                                ddlTransactionStatus.SelectedIndex = 0;
                            }
                        }
                        catch (Exception ex)
                        {
                            //lblMsg.Text = ex.Message.ToString();
                            //CPC_UBL.Classes.Common.Utility.AddException(ex);
                        }
                        #endregion

                        #region Transaction Base Currency Binding Dll
                        try
                        {
                            SPList oList = oWeb.Lists[TransactionBaseCurrencyList.ListName];

                            sQuery = new StringBuilder();

                            sQuery.Append("<Where><Eq><FieldRef Name='" + TransactionBaseCurrencyList.Active + "' /><Value Type='Boolean'>1</Value></Eq></Where>");
                            sQuery.Append("<OrderBy><FieldRef Name='" + TransactionBaseCurrencyList.ID + "' Ascending='TRUE'/></OrderBy>");

                            oQry = new SPQuery();
                            oQry.Query = sQuery.ToString();

                            dtTransactionBaseCurrency = oList.GetItems(oQry).GetDataTable();

                            if (dtTransactionBaseCurrency != null && dtTransactionBaseCurrency.Rows.Count > 0)
                            {
                                ddlTransactionBaseCurrency.DataValueField = TransactionBaseCurrencyList.ID;
                                ddlTransactionBaseCurrency.DataTextField = TransactionBaseCurrencyList.Title;
                                ddlTransactionBaseCurrency.DataSource = dtTransactionBaseCurrency;
                                ddlTransactionBaseCurrency.DataBind();
                                ddlTransactionBaseCurrency.Items.Insert(0, new ListItem("--- Select ---", "0"));
                                ddlTransactionBaseCurrency.SelectedIndex = 0;
                            }
                        }
                        catch (Exception ex)
                        {
                            //lblMsg.Text = ex.Message.ToString();
                            //CPC_UBL.Classes.Common.Utility.AddException(ex);
                        }
                        #endregion

                        #region Transaction Approval Mode Binding Dll
                        try
                        {
                            SPList oList = oWeb.Lists[TransactionApprovalModeList.ListName];

                            sQuery = new StringBuilder();

                            sQuery.Append("<Where><Eq><FieldRef Name='" + TransactionApprovalModeList.Active + "' /><Value Type='Boolean'>1</Value></Eq></Where>");
                            sQuery.Append("<OrderBy><FieldRef Name='" + TransactionApprovalModeList.ID + "' Ascending='TRUE'/></OrderBy>");

                            oQry = new SPQuery();
                            oQry.Query = sQuery.ToString();

                            dtTransactionApprovalMode = oList.GetItems(oQry).GetDataTable();

                            if (dtTransactionApprovalMode != null && dtTransactionApprovalMode.Rows.Count > 0)
                            {
                                ddlTransactionApprovalMode.DataValueField = TransactionApprovalModeList.ID;
                                ddlTransactionApprovalMode.DataTextField = TransactionApprovalModeList.Title;
                                ddlTransactionApprovalMode.DataSource = dtTransactionApprovalMode;
                                ddlTransactionApprovalMode.DataBind();
                                ddlTransactionApprovalMode.Items.Insert(0, new ListItem("--- Select ---", "0"));
                                ddlTransactionApprovalMode.SelectedIndex = 0;
                            }
                        }
                        catch (Exception ex)
                        {
                            //lblMsg.Text = ex.Message.ToString();
                            //CPC_UBL.Classes.Common.Utility.AddException(ex);
                        }
                        #endregion

                        #region MCC Binding Dll
                        try
                        {
                            SPList oList = oWeb.Lists[MerchantCategoryList.ListName];

                            sQuery = new StringBuilder();

                            sQuery.Append("<Where><Eq><FieldRef Name='" + MerchantCategoryList.Active + "' /><Value Type='Boolean'>1</Value></Eq></Where>");
                            sQuery.Append("<OrderBy><FieldRef Name='" + MerchantCategoryList.ID + "' Ascending='TRUE'/></OrderBy>");

                            oQry = new SPQuery();
                            oQry.Query = sQuery.ToString();

                            dtMCC = oList.GetItems(oQry).GetDataTable();

                            if (dtMCC != null && dtMCC.Rows.Count > 0)
                            {
                                ddlMCC.DataValueField = MerchantCategoryList.ID;
                                ddlMCC.DataTextField = MerchantCategoryList.Title;
                                ddlMCC.DataSource = dtMCC;
                                ddlMCC.DataBind();
                                ddlMCC.Items.Insert(0, new ListItem("--- Select ---", "0"));
                                ddlMCC.SelectedIndex = 0;
                            }
                        }
                        catch (Exception ex)
                        {
                            //lblMsg.Text = ex.Message.ToString();
                            //CPC_UBL.Classes.Common.Utility.AddException(ex);
                        }
                        #endregion

                        #region Country Binding Dll
                        try
                        {
                            SPList oList = oWeb.Lists[CountryList.ListName];

                            sQuery = new StringBuilder();

                            sQuery.Append("<Where><Eq><FieldRef Name='" + CountryList.Active + "' /><Value Type='Boolean'>1</Value></Eq></Where>");
                            sQuery.Append("<OrderBy><FieldRef Name='" + CountryList.ID + "' Ascending='TRUE'/></OrderBy>");

                            oQry = new SPQuery();
                            oQry.Query = sQuery.ToString();

                            dtCountry = oList.GetItems(oQry).GetDataTable();

                            if (dtCountry != null && dtCountry.Rows.Count > 0)
                            {
                                ddlTransactionCountry.DataValueField = CountryList.CountryNumCode;
                                ddlTransactionCountry.DataTextField = CountryList.Title;
                                ddlTransactionCountry.DataSource = dtCountry;
                                ddlTransactionCountry.DataBind();
                                ddlTransactionCountry.Items.Insert(0, new ListItem("--- Select ---", "0"));
                                ddlTransactionCountry.SelectedIndex = 0;
                            }
                        }
                        catch (Exception ex)
                        {
                            //lblMsg.Text = ex.Message.ToString();
                            //CPC_UBL.Classes.Common.Utility.AddException(ex);
                        }
                        #endregion

                        #region UFL Binding Dll
                        try
                        {
                            SPList oList = oWeb.Lists[UFLList.ListName];

                            sQuery = new StringBuilder();

                            sQuery.Append("<Where><Eq><FieldRef Name='" + UFLList.Active + "' /><Value Type='Boolean'>1</Value></Eq></Where>");
                            sQuery.Append("<OrderBy><FieldRef Name='" + UFLList.ID + "' Ascending='TRUE'/></OrderBy>");

                            oQry = new SPQuery();
                            oQry.Query = sQuery.ToString();

                            dtUFL = oList.GetItems(oQry).GetDataTable();

                            if (dtUFL != null && dtUFL.Rows.Count > 0)
                            {
                                ddlUFL.DataValueField = UFLList.ID;
                                ddlUFL.DataTextField = UFLList.Title;
                                ddlUFL.DataSource = dtUFL;
                                ddlUFL.DataBind();
                                ddlUFL.Items.Insert(0, new ListItem("--- Select ---", "0"));
                                ddlUFL.SelectedIndex = 0;
                            }
                        }
                        catch (Exception ex)
                        {
                            //lblMsg.Text = ex.Message.ToString();
                            //CPC_UBL.Classes.Common.Utility.AddException(ex);
                        }
                        #endregion

                        #region TC40SAFE Binding Dll
                        try
                        {
                            SPList oList = oWeb.Lists[TC40SAFEList.ListName];

                            sQuery = new StringBuilder();

                            sQuery.Append("<Where><Eq><FieldRef Name='" + TC40SAFEList.Active + "' /><Value Type='Boolean'>1</Value></Eq></Where>");
                            sQuery.Append("<OrderBy><FieldRef Name='" + TC40SAFEList.ID + "' Ascending='TRUE'/></OrderBy>");

                            oQry = new SPQuery();
                            oQry.Query = sQuery.ToString();

                            dtTC40SAFE = oList.GetItems(oQry).GetDataTable();

                            if (dtTC40SAFE != null && dtTC40SAFE.Rows.Count > 0)
                            {
                                ddlTransSAFE.DataValueField = TC40SAFEList.ID;
                                ddlTransSAFE.DataTextField = TC40SAFEList.Title;
                                ddlTransSAFE.DataSource = dtTC40SAFE;
                                ddlTransSAFE.DataBind();
                                ddlTransSAFE.Items.Insert(0, new ListItem("--- Select ---", "0"));
                                ddlTransSAFE.SelectedIndex = 0;
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

        public string GetEnumDescription(Enum value)
        {
            FieldInfo fi = value.GetType().GetField(value.ToString());

            DescriptionAttribute[] attributes =
                (DescriptionAttribute[])fi.GetCustomAttributes(typeof(DescriptionAttribute), false);

            if (attributes != null && attributes.Length > 0)
                return attributes[0].Description;
            else
                return value.ToString();
        }

        protected void btnAddTrans_Click(object sender, EventArgs e)
        {
            ViewState["TransRowIndex"] = null;
            ddlTransactionStatus.Enabled = true;
            ddlTransactionStatus.SelectedIndex = 0;
            txtTransactionDate.Text = string.Empty;
            txtTransactionTime.Text = string.Empty;
            txtTransactionAmount.Text = string.Empty;
            ddlTransactionBaseCurrency.SelectedIndex = 0;
            txtTransactionBaseAmount.Text = string.Empty;
            ddlTransactionCountry.SelectedIndex = 0;
            txtTransactionApprovalCode.Text = string.Empty;
            ddlTransactionApprovalMode.SelectedIndex = 0;
            txtMerchantNumber.Text = string.Empty;
            txtMerchantName.Text = string.Empty;
            txtMerchantCity.Text = string.Empty;
            ddlMCC.SelectedIndex = 0;
            txtAcquiringBIN.Text = string.Empty;
            ddlTransSAFE.SelectedIndex = 0;
            txtTransSAFEDate.Text = string.Empty;
            ddlUFL.SelectedIndex = 0;


            //System.Text.StringBuilder sb = new System.Text.StringBuilder();
            //sb.Append(@"<script type='text/javascript'>");
            //sb.Append("$('#AddTransaction').modal('show');");
            //sb.Append(@"</script>");
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);

            //Page.ClientScript.RegisterStartupScript(typeof(Page), "passwordError5Alert", "alert(1);" , false);
            //string Msg = "alert('aasd');";
            //ScriptManager.RegisterClientScriptBlock((sender as Control), this.GetType(), "alert", Msg, true);
            
        
        }

        protected void btnTranscSave_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            DataRow dr = null;
            string TransStatus = ddlTransactionStatus.SelectedItem.Text;
            if (ViewState[TransStatus] != null)
            {
                dt = (DataTable)ViewState[TransStatus];

                if (dt.Columns.Count > 0)
                {
                    int editPosition = ViewState["TransRowIndex"] == null ? -1 : Convert.ToInt32( ViewState["TransRowIndex"]);
                    if (dt.Rows.Count >= editPosition + 1 && editPosition != -1)
                    {
                        dt.Rows[editPosition]["TransDate"] = txtTransactionDate.Text;
                        dt.Rows[editPosition]["TransTime"] = txtTransactionTime.Text;
                        dt.Rows[editPosition]["TransAmount"] = txtTransactionAmount.Text;
                        dt.Rows[editPosition]["TransactionBaseAmount"] = txtTransactionBaseAmount.Text;
                        dt.Rows[editPosition]["TransactionBaseCurrency"] = ddlTransactionBaseCurrency.SelectedItem.Text;
                        dt.Rows[editPosition]["Country"] = ddlTransactionCountry.SelectedItem.Text;
                        dt.Rows[editPosition]["ApprovalCode"] = txtTransactionApprovalCode.Text;
                        dt.Rows[editPosition]["ApprovalMode"] = ddlTransactionApprovalMode.SelectedItem.Text;
                        dt.Rows[editPosition]["MerchantNumber"] = txtMerchantNumber.Text;
                        dt.Rows[editPosition]["MerchantName"] = txtMerchantName.Text;
                        dt.Rows[editPosition]["MerchantCity"] = txtMerchantCity.Text;
                        dt.Rows[editPosition]["MCC"] = ddlMCC.SelectedItem.Text;
                        dt.Rows[editPosition]["AcquiringBIN"] = txtAcquiringBIN.Text;
                        dt.Rows[editPosition]["TC40SAFE"] = ddlTransSAFE.SelectedItem.Text;
                        dt.Rows[editPosition]["TC40Date"] = txtTransSAFEDate.Text;
                        dt.Rows[editPosition]["UFL"] = ddlUFL.SelectedItem.Text;

                        if (ddlTransactionStatus.SelectedItem.Text == GetEnumDescription(enumStatus.transApproved))
                        {
                            grdApproved.DataSource = dt;
                            grdApproved.DataBind();

                        }
                        else if (ddlTransactionStatus.SelectedItem.Text == GetEnumDescription(enumStatus.transDeclined))
                        {
                            grdDeclined.DataSource = dt;
                            grdDeclined.DataBind();

                        }
                        else if (ddlTransactionStatus.SelectedItem.Text == GetEnumDescription(enumStatus.transRejected))
                        {
                            grdRejected.DataSource = dt;
                            grdRejected.DataBind();

                        }
                        else if (ddlTransactionStatus.SelectedItem.Text == GetEnumDescription(enumStatus.transUnderConsideration))
                        {
                            grdUnderConsideration.DataSource = dt;
                            grdUnderConsideration.DataBind();
                        }
                    }
                    else 
                    {

                        dr = dt.NewRow();

                        dr["TransDate"] = txtTransactionDate.Text;
                        dr["TransTime"] = txtTransactionTime.Text;
                        dr["TransAmount"] = txtTransactionAmount.Text;
                        dr["TransactionBaseAmount"] = txtTransactionBaseAmount.Text;
                        dr["TransactionBaseCurrency"] = ddlTransactionBaseCurrency.SelectedItem.Text;
                        dr["Country"] = ddlTransactionCountry.SelectedItem.Text;
                        dr["ApprovalCode"] = txtTransactionApprovalCode.Text;
                        dr["ApprovalMode"] = ddlTransactionApprovalMode.SelectedItem.Text;
                        dr["MerchantNumber"] = txtMerchantNumber.Text;
                        dr["MerchantName"] = txtMerchantName.Text;
                        dr["MerchantCity"] = txtMerchantCity.Text;
                        dr["MCC"] = ddlMCC.SelectedItem.Text;
                        dr["AcquiringBIN"] = txtAcquiringBIN.Text;
                        dr["TC40SAFE"] = ddlTransSAFE.SelectedItem.Text;
                        dr["TC40Date"] = txtTransSAFEDate.Text;
                        dr["UFL"] = ddlUFL.SelectedItem.Text;
                        dt.Rows.Add(dr);

                        if (ddlTransactionStatus.SelectedItem.Text == GetEnumDescription(enumStatus.transApproved))
                        {
                            grdApproved.DataSource = dt;
                            grdApproved.DataBind();

                        }
                        else if (ddlTransactionStatus.SelectedItem.Text == GetEnumDescription(enumStatus.transDeclined))
                        {
                            grdDeclined.DataSource = dt;
                            grdDeclined.DataBind();

                        }
                        else if (ddlTransactionStatus.SelectedItem.Text == GetEnumDescription(enumStatus.transRejected))
                        {
                            grdRejected.DataSource = dt;
                            grdRejected.DataBind();

                        }
                        else if (ddlTransactionStatus.SelectedItem.Text == GetEnumDescription(enumStatus.transUnderConsideration))
                        {
                            grdUnderConsideration.DataSource = dt;
                            grdUnderConsideration.DataBind();

                        }
                    }
                    ViewState["TransRowIndex"] = null;
                }
            }
            else
            {
                dt.Columns.Add(new DataColumn("TransDate", typeof(string)));
                dt.Columns.Add(new DataColumn("TransTime", typeof(string)));
                dt.Columns.Add(new DataColumn("TransAmount", typeof(string)));
                dt.Columns.Add(new DataColumn("TransactionBaseAmount", typeof(string)));
                dt.Columns.Add(new DataColumn("TransactionBaseCurrency", typeof(string)));
                dt.Columns.Add(new DataColumn("Country", typeof(string)));
                dt.Columns.Add(new DataColumn("ApprovalCode", typeof(string)));
                dt.Columns.Add(new DataColumn("ApprovalMode", typeof(string)));
                dt.Columns.Add(new DataColumn("MerchantNumber", typeof(string)));
                dt.Columns.Add(new DataColumn("MerchantName", typeof(string)));
                dt.Columns.Add(new DataColumn("MerchantCity", typeof(string)));
                dt.Columns.Add(new DataColumn("MCC", typeof(string)));
                dt.Columns.Add(new DataColumn("AcquiringBIN", typeof(string)));
                dt.Columns.Add(new DataColumn("TC40SAFE", typeof(string)));
                dt.Columns.Add(new DataColumn("TC40Date", typeof(string)));
                dt.Columns.Add(new DataColumn("UFL", typeof(string)));
                dr = dt.NewRow();
                dr["TransDate"] = txtTransactionDate.Text;
                dr["TransTime"] = txtTransactionTime.Text;
                dr["TransAmount"] = txtTransactionAmount.Text;
                dr["TransactionBaseAmount"] = txtTransactionBaseAmount.Text;
                dr["TransactionBaseCurrency"] = ddlTransactionBaseCurrency.SelectedItem.Text;
                dr["Country"] = ddlTransactionCountry.SelectedItem.Text;
                dr["ApprovalCode"] = txtTransactionApprovalCode.Text;
                dr["ApprovalMode"] = ddlTransactionApprovalMode.SelectedItem.Text;
                dr["MerchantNumber"] = txtMerchantNumber.Text;
                dr["MerchantName"] = txtMerchantName.Text;
                dr["MerchantCity"] = txtMerchantCity.Text;
                dr["MCC"] = ddlMCC.SelectedItem.Text;
                dr["AcquiringBIN"] = txtAcquiringBIN.Text;
                dr["TC40SAFE"] = ddlTransSAFE.SelectedItem.Text;
                dr["TC40Date"] = txtTransSAFEDate.Text;
                dr["UFL"] = ddlUFL.SelectedItem.Text;

                dt.Rows.Add(dr);

                if (ddlTransactionStatus.SelectedItem.Text == GetEnumDescription(enumStatus.transApproved))
                {
                    grdApproved.DataSource = dt;
                    grdApproved.DataBind();

                }
                else if (ddlTransactionStatus.SelectedItem.Text == GetEnumDescription(enumStatus.transDeclined))
                {
                    grdDeclined.DataSource = dt;
                    grdDeclined.DataBind();

                }
                else if (ddlTransactionStatus.SelectedItem.Text == GetEnumDescription(enumStatus.transRejected))
                {
                    grdRejected.DataSource = dt;
                    grdRejected.DataBind();

                }
                else if (ddlTransactionStatus.SelectedItem.Text == GetEnumDescription(enumStatus.transUnderConsideration))
                {
                    grdUnderConsideration.DataSource = dt;
                    grdUnderConsideration.DataBind();

                }

                ViewState[TransStatus] = dt;
            }

        }

        protected void grdDeclined_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int position = Convert.ToInt32(e.CommandArgument);

            string Declined = GetEnumDescription(enumStatus.transDeclined);

            DataTable dt = (DataTable)ViewState[Declined];
            if (dt.Rows.Count > 0)
            {
                if (e.CommandName.Equals("editRecord"))
                {
                    ViewState["TransRowIndex"] = position;

                    ddlTransactionStatus.Items.FindByText(Declined).Selected = true;
                    ddlTransactionStatus.Enabled = false;
                    txtTransactionDate.Text = dt.Rows[position]["TransDate"].ToString();
                    txtTransactionTime.Text = dt.Rows[position]["TransTime"].ToString();
                    txtTransactionAmount.Text = dt.Rows[position]["TransAmount"].ToString();
                    txtTransactionBaseAmount.Text = dt.Rows[position]["TransactionBaseAmount"].ToString();
                    ddlTransactionBaseCurrency.SelectedItem.Text = dt.Rows[position]["TransactionBaseCurrency"].ToString();
                    ddlTransactionCountry.SelectedItem.Text = dt.Rows[position]["Country"].ToString();
                    txtTransactionApprovalCode.Text = dt.Rows[position]["ApprovalCode"].ToString();
                    ddlTransactionApprovalMode.SelectedItem.Text = dt.Rows[position]["ApprovalMode"].ToString();
                    txtMerchantNumber.Text = dt.Rows[position]["MerchantNumber"].ToString();
                    txtMerchantName.Text = dt.Rows[position]["MerchantName"].ToString();
                    txtMerchantCity.Text = dt.Rows[position]["MerchantCity"].ToString();
                    ddlMCC.SelectedItem.Text = dt.Rows[position]["MCC"].ToString();
                    txtAcquiringBIN.Text = dt.Rows[position]["AcquiringBIN"].ToString();
                    ddlTransSAFE.SelectedItem.Text = dt.Rows[position]["TC40SAFE"].ToString();
                    txtTransSAFEDate.Text = dt.Rows[position]["TC40Date"].ToString();
                    ddlUFL.SelectedItem.Text = dt.Rows[position]["UFL"].ToString();


                    //System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    //sb.Append(@"<script type='text/javascript'>");
                    //sb.Append("$('#AddTransaction').modal('show');");
                    //sb.Append(@"</script>");
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);

                }
                else if (e.CommandName.Equals("deleteRecord"))
                {
                    dt.Rows.RemoveAt(position);
                    grdDeclined.DataSource = dt;
                    grdDeclined.DataBind();
                }
                ViewState[Declined] = dt;
            }
        }

        protected void grdApproved_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int position = Convert.ToInt32(e.CommandArgument);

            string Approved= GetEnumDescription(enumStatus.transApproved);

            DataTable dt = (DataTable)ViewState[Approved];
            if (dt.Rows.Count > 0)
            {
                if (e.CommandName.Equals("editRecord"))
                {
                    ViewState["TransRowIndex"] = position;


                    ddlTransactionStatus.Items.FindByText(Approved).Selected = true;
                    ddlTransactionStatus.Enabled = false;
                    txtTransactionDate.Text = dt.Rows[position]["TransDate"].ToString();
                    txtTransactionTime.Text = dt.Rows[position]["TransTime"].ToString();
                    txtTransactionAmount.Text = dt.Rows[position]["TransAmount"].ToString();
                    txtTransactionBaseAmount.Text = dt.Rows[position]["TransactionBaseAmount"].ToString();
                    ddlTransactionBaseCurrency.SelectedItem.Text = dt.Rows[position]["TransactionBaseCurrency"].ToString();
                    ddlTransactionCountry.SelectedItem.Text = dt.Rows[position]["Country"].ToString();
                    txtTransactionApprovalCode.Text = dt.Rows[position]["ApprovalCode"].ToString();
                    ddlTransactionApprovalMode.SelectedItem.Text = dt.Rows[position]["ApprovalMode"].ToString();
                    txtMerchantNumber.Text = dt.Rows[position]["MerchantNumber"].ToString();
                    txtMerchantName.Text = dt.Rows[position]["MerchantName"].ToString();
                    txtMerchantCity.Text = dt.Rows[position]["MerchantCity"].ToString();
                    ddlMCC.SelectedItem.Text = dt.Rows[position]["MCC"].ToString();
                    txtAcquiringBIN.Text = dt.Rows[position]["AcquiringBIN"].ToString();
                    ddlTransSAFE.SelectedItem.Text = dt.Rows[position]["TC40SAFE"].ToString();
                    txtTransSAFEDate.Text = dt.Rows[position]["TC40Date"].ToString();
                    ddlUFL.SelectedItem.Text = dt.Rows[position]["UFL"].ToString();

                    //System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    //sb.Append(@"<script type='text/javascript'>");
                    //sb.Append("$('#AddTransaction').modal('show');");
                    //sb.Append(@"</script>");
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);

                }
                else if (e.CommandName.Equals("deleteRecord"))
                {
                    dt.Rows.RemoveAt(position);
                    grdApproved.DataSource = dt;
                    grdApproved.DataBind();
                }
                ViewState[Approved] = dt;

            }
        }

        protected void grdRejected_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int position = Convert.ToInt32(e.CommandArgument);

            string Rejected = GetEnumDescription(enumStatus.transRejected);

            DataTable dt = (DataTable)ViewState[Rejected];
            if (dt.Rows.Count > 0)
            {
                if (e.CommandName.Equals("editRecord"))
                {
                    ViewState["TransRowIndex"] = position;

                    ddlTransactionStatus.Items.FindByText(Rejected).Selected = true;
                    ddlTransactionStatus.Enabled = false;
                    txtTransactionDate.Text = dt.Rows[position]["TransDate"].ToString();
                    txtTransactionTime.Text = dt.Rows[position]["TransTime"].ToString();
                    txtTransactionAmount.Text = dt.Rows[position]["TransAmount"].ToString();
                    txtTransactionBaseAmount.Text = dt.Rows[position]["TransactionBaseAmount"].ToString();
                    ddlTransactionBaseCurrency.SelectedItem.Text = dt.Rows[position]["TransactionBaseCurrency"].ToString();
                    ddlTransactionCountry.SelectedItem.Text = dt.Rows[position]["Country"].ToString();
                    txtTransactionApprovalCode.Text = dt.Rows[position]["ApprovalCode"].ToString();
                    ddlTransactionApprovalMode.SelectedItem.Text = dt.Rows[position]["ApprovalMode"].ToString();
                    txtMerchantNumber.Text = dt.Rows[position]["MerchantNumber"].ToString();
                    txtMerchantName.Text = dt.Rows[position]["MerchantName"].ToString();
                    txtMerchantCity.Text = dt.Rows[position]["MerchantCity"].ToString();
                    ddlMCC.SelectedItem.Text = dt.Rows[position]["MCC"].ToString();
                    txtAcquiringBIN.Text = dt.Rows[position]["AcquiringBIN"].ToString();
                    ddlTransSAFE.SelectedItem.Text = dt.Rows[position]["TC40SAFE"].ToString();
                    txtTransSAFEDate.Text = dt.Rows[position]["TC40Date"].ToString();
                    ddlUFL.SelectedItem.Text = dt.Rows[position]["UFL"].ToString();

                    //System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    //sb.Append(@"<script type='text/javascript'>");
                    //sb.Append("$('#AddTransaction').modal('show');");
                    //sb.Append(@"</script>");
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);

                }
                else if (e.CommandName.Equals("deleteRecord"))
                {
                    dt.Rows.RemoveAt(position);
                    grdRejected.DataSource = dt;
                    grdRejected.DataBind();
                }
                ViewState[Rejected] = dt;
            }
        }

        protected void grdUnderConsideration_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int position = Convert.ToInt32(e.CommandArgument);

            string underConsideration = GetEnumDescription(enumStatus.transUnderConsideration);

            DataTable dt = (DataTable)ViewState[underConsideration];

            if (dt.Rows.Count > 0)
            {
                if (e.CommandName.Equals("editRecord"))
                {
                    ViewState["TransRowIndex"] = position;
                    
                    ddlTransactionStatus.Items.FindByText(underConsideration).Selected=true;
                    ddlTransactionStatus.Enabled = false;
                    txtTransactionDate.Text = dt.Rows[position]["TransDate"].ToString();
                    txtTransactionTime.Text = dt.Rows[position]["TransTime"].ToString();
                    txtTransactionAmount.Text = dt.Rows[position]["TransAmount"].ToString();
                    txtTransactionBaseAmount.Text = dt.Rows[position]["TransactionBaseAmount"].ToString();
                    ddlTransactionBaseCurrency.SelectedItem.Text = dt.Rows[position]["TransactionBaseCurrency"].ToString();
                    ddlTransactionCountry.SelectedItem.Text = dt.Rows[position]["Country"].ToString();
                    txtTransactionApprovalCode.Text = dt.Rows[position]["ApprovalCode"].ToString();
                    ddlTransactionApprovalMode.SelectedItem.Text = dt.Rows[position]["ApprovalMode"].ToString();
                    txtMerchantNumber.Text = dt.Rows[position]["MerchantNumber"].ToString();
                    txtMerchantName.Text = dt.Rows[position]["MerchantName"].ToString();
                    txtMerchantCity.Text = dt.Rows[position]["MerchantCity"].ToString();
                    ddlMCC.SelectedItem.Text = dt.Rows[position]["MCC"].ToString();
                    txtAcquiringBIN.Text = dt.Rows[position]["AcquiringBIN"].ToString();
                    ddlTransSAFE.SelectedItem.Text = dt.Rows[position]["TC40SAFE"].ToString();
                    txtTransSAFEDate.Text = dt.Rows[position]["TC40Date"].ToString();
                    ddlUFL.SelectedItem.Text = dt.Rows[position]["UFL"].ToString();
                    //System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    //sb.Append(@"<script type='text/javascript'>");
                    //sb.Append("$('#AddTransaction').modal('show');");
                    //sb.Append(@"</script>");
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);
                    //ScriptManager.RegisterClientScriptBlock(upTransUnderAuth, this.GetType(), "passwordError5Alert", sb.ToString(), true);
                    //Page.ClientScript.RegisterStartupScript(typeof(Page), "passwordError5Alert", sb.ToString(), false);
                }
                else if (e.CommandName.Equals("deleteRecord"))
                {
                    dt.Rows.RemoveAt(position);
                    grdUnderConsideration.DataSource = dt;
                    grdUnderConsideration.DataBind();
                }
                ViewState[underConsideration] = dt;
            }
        }

        #endregion
    }
}
