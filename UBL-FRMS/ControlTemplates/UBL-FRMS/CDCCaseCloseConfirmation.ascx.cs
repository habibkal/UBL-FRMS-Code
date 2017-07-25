using Microsoft.SharePoint;
using System;
using System.Data;
using System.IO;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using UBL_FRMS.Classes.Data;


namespace UBL_FRMS.ControlTemplates.UBL_FRMS
{
    public partial class CDCCaseCloseConfirmation : UserControl
    {
        #region Declaration

        string sWebUrl = SPContext.Current.Site.Url;
        StringBuilder sQuery = null;
        SPQuery oQry = null;

        public DataTable DTAttachment
        {
            get { return (DataTable)Session["uploadDoc"]; }
            set { Session["uploadDoc"] = value; }
        }

        #endregion Declaration

        #region Event
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["sdd"] = "asjda";
                FillDropdowns();
                DataTable dt = new DataTable();
                grdUploadDoc.DataSource = dt;
                grdUploadDoc.DataBind();
            }
        }
        #endregion

        #region Method
        private void FillDropdowns()
        {
            DataTable dtCustomerLiability = null;
            DataTable dtChargeBackRaised = null;
            DataTable dtCaseClosedStatus = null;
            try
            {
                using (SPSite oSite = new SPSite(sWebUrl))
                {
                    using (SPWeb oWeb = oSite.OpenWeb())
                    {
                        #region Customer Liability Binding Dll
                        try
                        {
                            SPList oList = oWeb.Lists[CustomerLiabilityList.ListName];

                            sQuery = new StringBuilder();

                            sQuery.Append("<Where><Eq><FieldRef Name='" + CustomerLiabilityList.Active + "' /><Value Type='Boolean'>1</Value></Eq></Where>");
                            sQuery.Append("<OrderBy><FieldRef Name='" + CustomerLiabilityList.ID + "' Ascending='TRUE'/></OrderBy>");

                            oQry = new SPQuery();
                            oQry.Query = sQuery.ToString();

                            dtCustomerLiability = oList.GetItems(oQry).GetDataTable();

                            if (dtCustomerLiability != null && dtCustomerLiability.Rows.Count > 0)
                            {
                                ddlCustomerLiability.DataValueField = CustomerLiabilityList.ID;
                                ddlCustomerLiability.DataTextField = CustomerLiabilityList.Title;
                                ddlCustomerLiability.DataSource = dtCustomerLiability;
                                ddlCustomerLiability.DataBind();
                                ddlCustomerLiability.Items.Insert(0, new ListItem("--- Select ---", "0"));
                                ddlCustomerLiability.SelectedIndex = 0;
                            }
                        }
                        catch (Exception ex)
                        {
                            //lblMsg.Text = ex.Message.ToString();
                            //CPC_UBL.Classes.Common.Utility.AddException(ex);
                        }
                        #endregion

                        #region Charge Back Raised Binding Dll
                        try
                        {
                            SPList oList = oWeb.Lists[ChargeBackRaisedList.ListName];

                            sQuery = new StringBuilder();

                            sQuery.Append("<Where><Eq><FieldRef Name='" + ChargeBackRaisedList.Active + "' /><Value Type='Boolean'>1</Value></Eq></Where>");
                            sQuery.Append("<OrderBy><FieldRef Name='" + ChargeBackRaisedList.ID + "' Ascending='TRUE'/></OrderBy>");

                            oQry = new SPQuery();
                            oQry.Query = sQuery.ToString();

                            dtChargeBackRaised = oList.GetItems(oQry).GetDataTable();

                            if (dtChargeBackRaised != null && dtChargeBackRaised.Rows.Count > 0)
                            {
                                ddlChargeBackRaised.DataValueField = ChargeBackRaisedList.ID;
                                ddlChargeBackRaised.DataTextField = ChargeBackRaisedList.Title;
                                ddlChargeBackRaised.DataSource = dtChargeBackRaised;
                                ddlChargeBackRaised.DataBind();
                                ddlChargeBackRaised.Items.Insert(0, new ListItem("--- Select ---", "0"));
                                ddlChargeBackRaised.SelectedIndex = 0;
                            }
                        }
                        catch (Exception ex)
                        {
                            //lblMsg.Text = ex.Message.ToString();
                            //CPC_UBL.Classes.Common.Utility.AddException(ex);
                        }
                        #endregion

                        #region Case Closed Status Binding Dll
                        try
                        {
                            SPList oList = oWeb.Lists[CaseClosedStatusList.ListName];

                            sQuery = new StringBuilder();

                            sQuery.Append("<Where><Eq><FieldRef Name='" + CaseClosedStatusList.Active + "' /><Value Type='Boolean'>1</Value></Eq></Where>");
                            sQuery.Append("<OrderBy><FieldRef Name='" + CaseClosedStatusList.ID + "' Ascending='TRUE'/></OrderBy>");

                            oQry = new SPQuery();
                            oQry.Query = sQuery.ToString();

                            dtCaseClosedStatus = oList.GetItems(oQry).GetDataTable();

                            if (dtCaseClosedStatus != null && dtCaseClosedStatus.Rows.Count > 0)
                            {
                                ddlCaseClosedStatus.DataValueField = CaseClosedStatusList.ID;
                                ddlCaseClosedStatus.DataTextField = CaseClosedStatusList.Title;
                                ddlCaseClosedStatus.DataSource = dtCaseClosedStatus;
                                ddlCaseClosedStatus.DataBind();
                                ddlCaseClosedStatus.Items.Insert(0, new ListItem("--- Select ---", "0"));
                                ddlCaseClosedStatus.SelectedIndex = 0;
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

        protected void grdUploadDoc_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int position;

            position = Convert.ToInt32(e.CommandArgument);
            //string File = DTAttachment.Rows[position]["hdFullPath"].ToString();
            //string FileName = DTAttachment.Rows[position]["DocumentTitle"].ToString();
            if (e.CommandName == "download")
            {
                //Response.Clear();
                //Response.ContentType = "application/octet-stream";
                //Response.AppendHeader("Content-Disposition", "filename=" + FileName);
                //Response.TransmitFile(File);
                //Response.Flush();
                //Response.End();
            }
            else if (e.CommandName.Equals("deleteRecord"))
            {
                DataTable dt = DTAttachment;
                if (dt.Rows.Count > 0)
                {
                    string DeletePath = dt.Rows[position]["hdfullpath"].ToString();
                    dt.Rows.RemoveAt(position);
                    System.IO.File.Delete(DeletePath);
                    grdUploadDoc.DataSource = dt;
                    grdUploadDoc.DataBind();
                }
            }
        }


        //public string TempFilePath = "C:\\TempData";

        protected void btnbrowse_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
        {
        //    DataTable dt = new DataTable();
        //    DataRow dr = null;

        //    if (DTAttachment == null)
        //    {
        //        dt.Columns.Add("hdFullPath", typeof(string));
        //        dt.Columns.Add("DocumentTitle", typeof(string));
        //        dt.Columns.Add("UploadedTime", typeof(string));
        //        dt.Columns.Add("UploadedBy", typeof(string));
        //        dt.Columns.Add("hdCheckFile", typeof(string));
        //    }
        //    else
        //    {
        //        dt = (DataTable)DTAttachment;
        //    }
        //    if (!Directory.Exists(TempFilePath))
        //    {
        //        Directory.CreateDirectory(TempFilePath);
        //    }
        //    if (btnbrowse.HasFile)
        //    {
        //        string MaxContentLength = "10000000"; //Size = 10 MB
        //        if (btnbrowse.PostedFile.ContentLength < Convert.ToInt32(MaxContentLength))
        //        {
        //            string FileName = System.IO.Path.GetFileName(btnbrowse.PostedFile.FileName); // file Name
        //            string RandFilePath = Guid.NewGuid() + System.IO.Path.GetExtension(btnbrowse.PostedFile.FileName); //Guid Will Generate Random Values + file's extention
        //            string fullpath = TempFilePath + "\\" + RandFilePath; // your path + random File name + extention

        //            if (DTAttachment == null)
        //            {
        //                btnbrowse.PostedFile.SaveAs(fullpath);
        //                dr = dt.NewRow();
        //                dr["hdFullPath"] = fullpath;
        //                dr["DocumentTitle"] = FileName;
        //                dr["UploadedTime"] = System.DateTime.Now.ToLongTimeString();
        //                dr["hdCheckFile"] = "InProcess";
        //                dt.Rows.Add(dr);
        //                DTAttachment = dt;
        //            }

        //            else if (DTAttachment.Rows[DTAttachment.Rows.Count - 1]["hdCheckFile"].ToString() == "Upload")
        //            {

        //                btnbrowse.PostedFile.SaveAs(fullpath);
        //                dr = dt.NewRow();
        //                dr["hdFullPath"] = fullpath;
        //                dr["DocumentTitle"] = FileName;
        //                dr["UploadedTime"] = System.DateTime.Now.ToLongTimeString();
        //                dr["hdCheckFile"] = "InProcess";
        //                dt.Rows.Add(dr);
        //                DTAttachment = dt;
        //            }
        //            else if (DTAttachment.Rows[DTAttachment.Rows.Count - 1]["hdCheckFile"].ToString() == "InProcess")
        //            {
        //                string DeletePath = DTAttachment.Rows[DTAttachment.Rows.Count - 1]["hdFullPath"].ToString();
        //                if ((System.IO.File.Exists(DeletePath)))
        //                {
        //                    System.IO.File.Delete(DeletePath);
        //                }
        //                DTAttachment.Rows[DTAttachment.Rows.Count - 1].Delete();

        //                btnbrowse.PostedFile.SaveAs(fullpath);
        //                dr = dt.NewRow();
        //                dr["hdFullPath"] = fullpath;
        //                dr["DocumentTitle"] = FileName;
        //                dr["UploadedTime"] = System.DateTime.Now.ToLongTimeString();
        //                dr["hdCheckFile"] = "InProcess";
        //                dt.Rows.Add(dr);
        //                DTAttachment = dt;
        //            }
        //        }

        //    }

        }

        protected void btnAddUploadedFile_Click(object sender, EventArgs e)
        {

            //int lastRow = DTAttachment.Rows.Count - 1;
            //if (DTAttachment.Rows[lastRow]["hdCheckFile"].ToString() == "InProcess")
            //{
            //    grdUploadDoc.DataSource = DTAttachment;
            //    grdUploadDoc.DataBind();
            //    DTAttachment.Rows[lastRow]["hdCheckFile"] = "Upload";
            //}
        }

      

        #endregion
    }
}
