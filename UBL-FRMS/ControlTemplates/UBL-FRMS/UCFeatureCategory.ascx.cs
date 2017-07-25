using Microsoft.SharePoint;
using System;
using System.Data;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using UBL_FRMS.Classes.Common;
using UBL_FRMS.Classes.Constant;
using UBL_FRMS.Classes.Data;

namespace UBL_FRMS.ControlTemplates.UBL_FRMS
{
    public partial class UCFeatureCategory : UserControl
    {
        string sWebUrl = SPContext.Current.Site.Url;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    BindData();
                }
            }
            catch (Exception ex)
            {
                Utility.AddException(ex);
            }
        }

        protected void rptFeature_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
        {
            try
            {
                DataRowView drv;

                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    drv = (DataRowView)e.Item.DataItem;
                    HyperLink hypAnchor = (HyperLink)e.Item.Controls[0].FindControl("hypAnchor");
                    Image imgFeature = (Image)e.Item.Controls[0].FindControl("imgFeature");
                    Label lblHeading = (Label)e.Item.Controls[0].FindControl("lblHeading");
                    Label lblDescr = (Label)e.Item.Controls[0].FindControl("lblDescr");

                    if (!Common.GetUserMembership(SPContext.Current.Web.CurrentUser, GeneralConstants.CPCAdminGroup))
                    {
                        if (drv[FeatureCategoryList.Options].ToString() == FeatureCategoryList.OptionsChoice.Admin)
                        {
                            e.Item.Visible = false;
                            return;
                        }
                    }



                    if (hypAnchor != null)
                    {
                        hypAnchor.NavigateUrl = drv[FeatureCategoryList.URL] != null ? drv[FeatureCategoryList.URL].ToString().Split(',')[0] : "#";
                        hypAnchor.Target = "_blank";
                    }

                    if (imgFeature != null)
                        imgFeature.ImageUrl = drv[FeatureCategoryList.ThumbnailImage] != null ? drv[FeatureCategoryList.ThumbnailImage].ToString().Split(',')[0] : string.Empty;

                    if (lblHeading != null)
                        lblHeading.Text = drv[FeatureCategoryList.Title] != null ? drv[FeatureCategoryList.Title].ToString() : string.Empty;

                    if (lblDescr != null)
                    {
                        if (drv[FeatureCategoryList.Description] == null)
                            lblDescr.Text = string.Empty;
                        else if (drv[FeatureCategoryList.Description].ToString().Length > 67)
                            lblDescr.Text = drv[FeatureCategoryList.Description].ToString().Substring(0, 67) + "...";
                        else
                            lblDescr.Text = drv[FeatureCategoryList.Description].ToString();
                    }
                    if (drv[FeatureCategoryList.Active].ToString() == "0")
                    {
                        if (hypAnchor != null)
                            hypAnchor.Enabled = false;

                        if (imgFeature != null)
                            imgFeature.Enabled = false;

                        if (lblHeading != null)
                            lblHeading.Enabled = false;

                        if (lblDescr != null)
                            lblDescr.Enabled = false;
                    }

                    //To disables administrative options
                    if (!Common.GetUserMembership(SPContext.Current.Web.CurrentUser, GeneralConstants.CPCAdminGroup))
                    {
                        if (drv[FeatureCategoryList.Options].ToString() == FeatureCategoryList.OptionsChoice.Admin)
                        {
                            if (imgFeature != null)
                                imgFeature.ImageUrl = drv[FeatureCategoryList.ThumbnailImage2] != null ? drv[FeatureCategoryList.ThumbnailImage2].ToString().Split(',')[0] : string.Empty;

                            if (hypAnchor != null)
                                hypAnchor.Enabled = false;

                            if (imgFeature != null)
                                imgFeature.Enabled = false;

                            if (lblHeading != null)
                                lblHeading.Enabled = false;

                            if (lblDescr != null)
                                lblDescr.Enabled = false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Utility.AddException(ex);
            }
        }

        #region Local methods
        private void BindData()
        {
            try
            {
                using (SPSite oSite = new SPSite(sWebUrl))
                {
                    using (SPWeb oWeb = oSite.OpenWeb())
                    {
                        SPList oList = oWeb.Lists[FeatureCategoryList.ListName];
                        StringBuilder sQuery = new StringBuilder();
                        //sQuery.Append("<Where><Eq><FieldRef Name='" + FeatureCategoryList.Active + "' /><Value Type='Boolean'>1</Value></Eq></Where>");
                        sQuery.Append("<OrderBy><FieldRef Name='" + FeatureCategoryList.SeqValue + "' Ascending='True' /></OrderBy>");

                        SPQuery oQry = new SPQuery();
                        oQry.RowLimit = 6;
                        oQry.Query = sQuery.ToString();

                        DataTable dtb = oList.GetItems(oQry).GetDataTable();

                        if (dtb != null)
                        {
                            if (dtb.Rows.Count > 0)
                            {
                                rptFeature.DataSource = dtb;
                                rptFeature.DataBind();
                            }
                            else
                            {
                                rptFeature.DataSource = null;
                                rptFeature.DataBind();
                            }
                        }
                        else
                        {
                            rptFeature.DataSource = null;
                            rptFeature.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Utility.AddException(ex);
            }
        }

        #endregion
    }
}
