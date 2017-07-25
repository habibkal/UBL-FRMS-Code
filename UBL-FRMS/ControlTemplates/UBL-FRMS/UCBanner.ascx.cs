using Microsoft.SharePoint;
using System;
using System.Data;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using UBL_FRMS.Classes.Common;
using UBL_FRMS.Classes.Data;

namespace UBL_FRMS.ControlTemplates.UBL_FRMS
{
    public partial class UCBanner : UserControl
    {
        #region Properties
        string sWebUrl = SPContext.Current.Site.Url;
        DataTable dt;
        #endregion
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

        protected void rptBanner_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
        {
            try
            {
                DataRowView drv;

                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    drv = (DataRowView)e.Item.DataItem;

                    Image imgBanner = (Image)e.Item.Controls[0].FindControl("imgBanner");
                    Label lblDescr = (Label)e.Item.Controls[0].FindControl("lblDescr");

                    if (imgBanner != null && drv[BannerList.FileLeafRef] != null)
                        imgBanner.ImageUrl = sWebUrl + "/" + BannerList.ListName + "/" + drv[BannerList.FileLeafRef].ToString();

                    if (lblDescr != null)
                        lblDescr.Text = drv[BannerList.Title] != null ? drv[BannerList.Title].ToString() : string.Empty;

                }
            }
            catch (Exception ex)
            {
                Utility.AddException(ex);
            }
        }

        # region Local Method
        protected void BindData()
        {
            dt = new DataTable();

            using (SPSite oSite = new SPSite(sWebUrl))
            {
                using (SPWeb oWeb = oSite.OpenWeb())
                {
                    try
                    {
                        SPList oList = oWeb.Lists[BannerList.ListName];

                        StringBuilder sQuery = new StringBuilder();

                        sQuery.Append("<Where><Eq><FieldRef Name='" + BannerList.Active + "' /><Value Type='Boolean'>1</Value></Eq></Where>");
                        sQuery.Append("<OrderBy><FieldRef Name='" + BannerList.Order + "' Ascending='TRUE'/></OrderBy>");

                        SPQuery oQry = new SPQuery();
                        oQry.Query = sQuery.ToString();

                        dt = oList.GetItems(oQry).GetDataTable();

                        if (dt == null)
                        {
                            rptBanner.DataSource = null;
                            rptBanner.DataBind();
                            return;
                        }

                        if (dt.Rows.Count > 0 && dt != null)
                        {
                            rptBanner.DataSource = dt.DefaultView;
                            rptBanner.DataBind();
                        }
                        else
                        {
                            rptBanner.DataSource = null;
                            rptBanner.DataBind();
                        }
                    }
                    catch (Exception ex)
                    {
                        Utility.AddException(ex);
                    }
                }
            }
        }
        #endregion
    }
}
