using System;
using System.Text;
using System.Data;
using System.Web.UI;
using Microsoft.SharePoint;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

namespace UBL_FRMS.ControlTemplates.UBL_FRMS
{
    public partial class LDCCaseInvestigationCommentsTAB : UserControl
    {
        #region Declaration

        public DataTable CaseCommentsRow
        {
            get { return (DataTable)ViewState["CaseCommentsRow"]; }
            set { ViewState["CaseCommentsRow"] = value; }
        }


        #endregion Declaration


        #region Event

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DataTable dt = new DataTable();
                grdCaseComments.DataSource = dt;
                grdCaseComments.DataBind();
            }

        }

        #endregion Event


        #region Method

        protected void btnAddCaseComments_Click(object sender, EventArgs e)
        {
            txtCaseComments.Text = string.Empty;
            ViewState["CaseCommentsRowEditIndex"] = null;
        }

        protected void btnSaveCaseComment_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            DataRow dr = null;
            if (CaseCommentsRow != null)
            {
                dt = CaseCommentsRow;

                int CaseCommentsRowEditIndex = ViewState["CaseCommentsRowEditIndex"] == null ? -1 : Convert.ToInt32(ViewState["CaseCommentsRowEditIndex"]);
                if (dt.Rows.Count >= CaseCommentsRowEditIndex + 1 && CaseCommentsRowEditIndex != -1)
                {

                    dt.Rows[CaseCommentsRowEditIndex]["Comments"] = txtCaseComments.Text;
                    grdCaseComments.DataSource = dt;
                    grdCaseComments.DataBind();

                }

                else
                {
                    dr = dt.NewRow();
                    dr["EnteredBy"] = "N/A";
                    dr["Date"] = System.DateTime.Now.ToLongDateString();
                    dr["Time"] = System.DateTime.Now.ToLongTimeString();
                    dr["Comments"] = txtCaseComments.Text;
                    dt.Rows.Add(dr);

                    grdCaseComments.DataSource = dt;
                    grdCaseComments.DataBind();
                }
                ViewState["CaseCommentsRowEditIndex"] = null;

            }
            else
            {
                dt.Columns.Add("EnteredBy", typeof(string));
                dt.Columns.Add("Date", typeof(string));
                dt.Columns.Add("Time", typeof(string));
                dt.Columns.Add("Comments", typeof(string));

                dr = dt.NewRow();
                dr["EnteredBy"] = "N/A";
                dr["Date"] = System.DateTime.Now.ToLongDateString();
                dr["Time"] = System.DateTime.Now.ToLongTimeString();
                dr["Comments"] = txtCaseComments.Text;
                dt.Rows.Add(dr);
                grdCaseComments.DataSource = dt;
                grdCaseComments.DataBind();
            }
            CaseCommentsRow = dt;
        }

        protected void grdCaseComments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int position = Convert.ToInt32(e.CommandArgument);
            if (CaseCommentsRow.Rows.Count > 0)
            {
                ViewState["CaseCommentsRowEditIndex"] = position.ToString();
                if (e.CommandName == "editRecord")
                {
                    txtCaseComments.Text = CaseCommentsRow.Rows[position]["Comments"].ToString();
                }
                else if (e.CommandName == "deleteRecord")
                {
                    CaseCommentsRow.Rows.RemoveAt(position);
                }
                grdCaseComments.DataSource = CaseCommentsRow;
                grdCaseComments.DataBind();
            }
        }

        #endregion Method
    }
}
