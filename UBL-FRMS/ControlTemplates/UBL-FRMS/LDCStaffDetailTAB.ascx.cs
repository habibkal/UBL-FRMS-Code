using System;
using System.Data;
using System.Web.UI;
using System.Text;
using Microsoft.SharePoint;
using UBL_FRMS.Classes.Data;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;


namespace UBL_FRMS.ControlTemplates.UBL_FRMS
{
    public partial class LDCStaffDetailTAB : UserControl
    {
        #region Declaration

        string sWebUrl = SPContext.Current.Site.Url;
        StringBuilder sQuery = null;
        SPQuery oQry = null;
        DataTable dt = new DataTable();

        public DataTable StaffRow
        {
            get { return (DataTable)ViewState["StaffRow"]; }
            set { ViewState["StaffRow"] = value; }
        }

        #endregion Declaration

        #region Event
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                grdStaffDetails.DataSource = dt;
                grdStaffDetails.DataBind();

                FillDropdowns();
            }
        }
        #endregion

        #region Method
        private void FillDropdowns()
        {
            DataTable dtStaffStatus = null;
            try
            {
                using (SPSite oSite = new SPSite(sWebUrl))
                {
                    using (SPWeb oWeb = oSite.OpenWeb())
                    {
                        #region Customer Liability Binding Dll
                        try
                        {
                            SPList oList = oWeb.Lists[StaffStatusList.ListName];

                            sQuery = new StringBuilder();

                            sQuery.Append("<Where><Eq><FieldRef Name='" + StaffStatusList.Active + "' /><Value Type='Boolean'>1</Value></Eq></Where>");
                            sQuery.Append("<OrderBy><FieldRef Name='" + StaffStatusList.ID + "' Ascending='TRUE'/></OrderBy>");

                            oQry = new SPQuery();
                            oQry.Query = sQuery.ToString();

                            dtStaffStatus = oList.GetItems(oQry).GetDataTable();

                            if (dtStaffStatus != null && dtStaffStatus.Rows.Count > 0)
                            {
                                ddlStaffStatus.DataValueField = StaffStatusList.ID;
                                ddlStaffStatus.DataTextField = StaffStatusList.Title;
                                ddlStaffStatus.DataSource = dtStaffStatus;
                                ddlStaffStatus.DataBind();
                                ddlStaffStatus.Items.Insert(0, new ListItem("--- Select ---", "0"));
                                ddlStaffStatus.SelectedIndex = 0;
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

        protected void btnAddStaff_Click(object sender, EventArgs e)
        {
            txtStaffName.Text = string.Empty;
            txtStaffName.Text = string.Empty;
            txtStaffNumber.Text = string.Empty;
            ddlStaffStatus.SelectedIndex = 0;
            txtFatherHusbandName.Text = string.Empty;
            txtCNIC.Text = string.Empty;
            txtPeriodOfServices.Text = string.Empty;
            txtDesignation.Text = string.Empty;
            txtGrade.Text = string.Empty;
            txtActionTaken.Text = string.Empty;
            ViewState["index"] = null;
            //System.Text.StringBuilder sb = new System.Text.StringBuilder();
            //sb.Append(@"<script type='text/javascript'>");
            //sb.Append("$('#StaffWindow').modal('show');");
            //sb.Append(@"</script>");
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "OpenModalDialog", "alert('This pops up');", false);
        }
        protected void btnStaffSave_Click(object sender, EventArgs e)
        {
            DataRow dr = null;
            DataTable dt = new DataTable();
            if (StaffRow != null)
            {
                dt = StaffRow;
                if (StaffRow.Columns.Count > 0)
                {
                    int StaffRowEditIndex = ViewState["index"] == null ? -1 : Convert.ToInt32(ViewState["index"]);
                    if (StaffRow.Rows.Count >= StaffRowEditIndex + 1 && StaffRowEditIndex != -1)
                    {
                        dt.Rows[StaffRowEditIndex]["StaffName"] = txtStaffName.Text;
                        dt.Rows[StaffRowEditIndex]["StaffNumber"] = txtStaffNumber.Text;
                        dt.Rows[StaffRowEditIndex]["StaffStatus"] = ddlStaffStatus.SelectedItem.Text;
                        dt.Rows[StaffRowEditIndex]["FatherHusbandName"] = txtFatherHusbandName.Text;
                        dt.Rows[StaffRowEditIndex]["CNIC"] = txtCNIC.Text;
                        dt.Rows[StaffRowEditIndex]["PeriodofServices"] = txtPeriodOfServices.Text;
                        dt.Rows[StaffRowEditIndex]["Designation"] = txtDesignation.Text;
                        dt.Rows[StaffRowEditIndex]["Grade"] = txtGrade.Text;
                        dt.Rows[StaffRowEditIndex]["ActionTaken"] = txtActionTaken.Text;
                        grdStaffDetails.DataSource = dt;
                        grdStaffDetails.DataBind();
                    }
                    else
                    {

                        dr = StaffRow.NewRow();
                        dr["StaffName"] = txtStaffName.Text;
                        dr["StaffNumber"] = txtStaffNumber.Text;
                        dr["StaffStatus"] = ddlStaffStatus.SelectedItem.Text;
                        dr["FatherHusbandName"] = txtFatherHusbandName.Text;
                        dr["CNIC"] = txtCNIC.Text;
                        dr["PeriodofServices"] = txtPeriodOfServices.Text;
                        dr["Designation"] = txtDesignation.Text;
                        dr["Grade"] = txtGrade.Text;
                        dr["ActionTaken"] = txtActionTaken.Text;
                        dt.Rows.Add(dr);
                        grdStaffDetails.DataSource = dt;
                        grdStaffDetails.DataBind();
                    }
                    ViewState["index"] = null;
                }
            }
            else
            {
                dt.Columns.Add(new DataColumn("StaffName", typeof(string)));
                dt.Columns.Add(new DataColumn("StaffNumber", typeof(string)));
                dt.Columns.Add(new DataColumn("StaffStatus", typeof(string)));
                dt.Columns.Add(new DataColumn("FatherHusbandName", typeof(string)));
                dt.Columns.Add(new DataColumn("CNIC", typeof(string)));
                dt.Columns.Add(new DataColumn("PeriodofServices", typeof(string)));
                dt.Columns.Add(new DataColumn("Designation", typeof(string)));
                dt.Columns.Add(new DataColumn("Grade", typeof(string)));
                dt.Columns.Add(new DataColumn("ActionTaken", typeof(string)));
                dr = dt.NewRow();
                dr["StaffName"] = txtStaffName.Text;
                dr["StaffNumber"] = txtStaffNumber.Text;
                dr["StaffStatus"] = ddlStaffStatus.SelectedItem.Text;
                dr["FatherHusbandName"] = txtFatherHusbandName.Text;
                dr["CNIC"] = txtCNIC.Text;
                dr["PeriodofServices"] = txtPeriodOfServices.Text;
                dr["Designation"] = txtDesignation.Text;
                dr["Grade"] = txtGrade.Text;
                dr["ActionTaken"] = txtActionTaken.Text;
                dt.Rows.Add(dr);
                grdStaffDetails.DataSource = dt;
                grdStaffDetails.DataBind();
            }
            StaffRow = dt;

        }

        protected void grdStaffDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int position = Convert.ToInt32(e.CommandArgument);
            if (StaffRow.Rows.Count > 0)
            {
                if (e.CommandName.Equals("editRecord"))
                {
                    ViewState["index"] = position;

                    //GridViewRow GridViewRow = grdStaffDetails.Rows[index];
                    txtStaffName.Text = StaffRow.Rows[position]["StaffName"].ToString();
                    txtStaffNumber.Text = StaffRow.Rows[position]["StaffNumber"].ToString();
                    ddlStaffStatus.SelectedItem.Text = StaffRow.Rows[position]["StaffStatus"].ToString();
                    txtFatherHusbandName.Text = StaffRow.Rows[position]["FatherHusbandName"].ToString();
                    txtCNIC.Text = StaffRow.Rows[position]["CNIC"].ToString();
                    txtPeriodOfServices.Text = StaffRow.Rows[position]["PeriodofServices"].ToString();
                    txtDesignation.Text = StaffRow.Rows[position]["Designation"].ToString();
                    txtGrade.Text = StaffRow.Rows[position]["Grade"].ToString();
                    txtActionTaken.Text = StaffRow.Rows[position]["ActionTaken"].ToString();

                    //System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    //sb.Append(@"<script type='text/javascript'>");
                    //sb.Append("$('#StaffWindow').modal('show');");
                    //sb.Append(@"</script>");
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "EditModalScript", sb.ToString(), false);


                    grdStaffDetails.DataSource = StaffRow;
                    grdStaffDetails.DataBind();


                }
                else if (e.CommandName.Equals("deleteRecord"))
                {
                    StaffRow.Rows.RemoveAt(position);
                    grdStaffDetails.DataSource = StaffRow;
                    grdStaffDetails.DataBind();
                }
            }
        }



        #endregion
    }
}
