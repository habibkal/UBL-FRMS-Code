using Microsoft.SharePoint;
using Microsoft.SharePoint.Utilities;
using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using UBL_FRMS.Classes.Common;
using UBL_FRMS.Classes.Data;
using UBL_FRMS.Classes.Helper;

namespace UBL_FRMS.ControlTemplates.UBL_FRMS
{
    public partial class UCAnnouncement : UserControl
    {
        #region Properties

        string sWebUrl = SPContext.Current.Site.Url;
        Encrypter encrypter = new Encrypter();

        #endregion

        #region Events

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

        protected void rptAnnouncement_ItemDataBound(object sender, System.Web.UI.WebControls.RepeaterItemEventArgs e)
        {
            try
            {
                DataRowView drv;

                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    drv = (DataRowView)e.Item.DataItem;
                    Literal ltrShortDesc = (Literal)e.Item.Controls[0].FindControl("ltrShortDesc");

                    if (ltrShortDesc != null)
                    {
                        if (drv[AnnouncementList.ShortDescription] == null)
                            ltrShortDesc.Text = string.Empty;
                        else if (drv[AnnouncementList.ShortDescription].ToString().Length > 163)
                            ltrShortDesc.Text = drv[AnnouncementList.ShortDescription].ToString().Substring(0, 163) + "...";
                        else
                            ltrShortDesc.Text = drv[AnnouncementList.ShortDescription].ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                Utility.AddException(ex);
            }
        }

        #endregion

        #region Local methods
        private void BindData()
        {
            try
            {
                using (SPSite oSite = new SPSite(sWebUrl))
                {
                    using (SPWeb oWeb = oSite.OpenWeb())
                    {
                        SPList oList = oWeb.Lists[AnnouncementList.ListName];
                        CamlQueryItem CQI1 = new CamlQueryItem(Comparison.Equals.ToString(), AnnouncementList.Active.ToString(), FieldTypes.Text.ToString(), "1", false);
                        CamlQueryGroup CQG1 = new CamlQueryGroup();
                        CQG1.AddElement(CQI1);

                        DataTable dtb = ListDataHelper.GetListDataByFieldRowCount(oWeb, AnnouncementList.ListName.ToString(), CQG1, 1);

                        if (dtb != null)
                        {
                            if (dtb.Rows.Count > 0)
                            {
                                rptAnnouncement.DataSource = dtb;
                                rptAnnouncement.DataBind();
                            }
                            else
                            {
                                rptAnnouncement.DataSource = null;
                                rptAnnouncement.DataBind();
                            }
                        }
                        else
                        {
                            rptAnnouncement.DataSource = null;
                            rptAnnouncement.DataBind();
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

        protected void lnkViewAll_Click(object sender, EventArgs e)
        {
            SPUtility.Redirect(sWebUrl + AnnouncementList.ListingPageUrl, SPRedirectFlags.Default, HttpContext.Current);
        }
    }
}
