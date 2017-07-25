using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Configuration;
using System.Net;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Utilities;
using UBL_FRMS.Classes.Helper;
using UBL_FRMS.Classes.Data;

namespace UBL_FRMS.Classes.Common
{
    public static class Common
    {
        public static SPWeb GetSPWeb(string sWebUrl)
        {
            SPSite oSite = new SPSite(sWebUrl);
            SPWeb oWeb = oSite.OpenWeb();
            return oWeb;
        }

        public static SPFieldLookupValueCollection GetLookFieldIDS(string lookupValues, SPList lookupSourceList)
        {
            if (lookupValues == "---Select---")
                return null;

            SPFieldLookupValueCollection lookupIds = new SPFieldLookupValueCollection();
            string[] lookups = lookupValues.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);

            foreach (string lookupValue in lookups)
            {
                SPQuery query = new SPQuery();
                query.Query = String.Format("<Where><Eq><FieldRef Name='Title'/><Value Type='Text'>{0}</Value></Eq></Where>", lookupValue.Trim());
                SPListItemCollection listItems = lookupSourceList.GetItems(query);

                if (listItems != null && listItems.Count > 0)
                {
                    foreach (SPListItem item in listItems)
                    {
                        SPFieldLookupValue value = new SPFieldLookupValue(item.ID.ToString());
                        lookupIds.Add(value);
                        break;
                    }
                }
            }
            return lookupIds;
        }

        public static Boolean GetUserMembership(SPUser user, String groupName)
        {
            Boolean result = false;
            foreach (SPGroup grp in SPContext.Current.Web.CurrentUser.Groups)
            {
                if (grp.Name.Equals(groupName))
                    result = true;
            }
            return result;
        }

        public static string ConvertHTMLtoText(string text, int length)
        {
            return SPHttpUtility.ConvertSimpleHtmlToText(text, length);
        }

        public static string GetDateValue(string txt)
        {
            string result = string.Empty;
            result = txt == string.Empty ? null : txt;
            return result;
        }

        public static int GetCurrentUserID()
        {
            int userid = 0;
            SPUser oUser;

            try
            {
                oUser = SPContext.Current.Web.CurrentUser;
                userid = oUser.ID;
            }
            catch (Exception ex)
            {
                UBL_FRMS.Classes.Common.Utility.AddException(ex);
                //ExceptionHandling.WebPartError(ex);
            }
            return userid;
        }

        public static string GetCurrentUserLoginName()
        {
            string loginName = string.Empty;
            SPUser oUser;

            try
            {
                oUser = SPContext.Current.Web.CurrentUser;
                loginName = oUser.LoginName;
            }
            catch (Exception ex)
            {
                UBL_FRMS.Classes.Common.Utility.AddException(ex);
                //ExceptionHandling.WebPartError(ex);
            }
            return loginName;
        }

        public static string GetCurrentUserDisplayName()
        {
            string displayName = string.Empty;
            SPUser oUser;

            try
            {
                oUser = SPContext.Current.Web.CurrentUser;
                displayName = oUser.Name;
            }
            catch (Exception ex)
            {
                UBL_FRMS.Classes.Common.Utility.AddException(ex);
                //ExceptionHandling.WebPartError(ex);
            }
            return displayName;
        }

        public static string Base64Encode(string val)
        {
            val = val + "KALSOFT";
            var result = System.Text.Encoding.UTF8.GetBytes(val);
            return System.Convert.ToBase64String(result);
        }

        public static string Base64Decode(string val)
        {
            var decodedResult = System.Convert.FromBase64String(val);
            string result = System.Text.Encoding.UTF8.GetString(decodedResult); 
            string[] arr = result.Split('K');
            return arr[0].ToString();
        }

        public static string GetNextSequenceNumber(string sWebUrl, string formTitle)
        {
            string sequence = string.Empty;
            string format = string.Empty;
            string number = string.Empty;
            DataTable dt = new DataTable();

            using (SPSite oSite = new SPSite(sWebUrl))
            {
                using (SPWeb oWeb = oSite.OpenWeb())
                {
                    try
                    {
                        SPList oList = oWeb.Lists[ConfigurationList.ListName];
                        
                        SPQuery oQry = new SPQuery();
                        oQry.Query = String.Format("<Where><Eq><FieldRef Name='" + ConfigurationList.Title + "' /><Value Type='Text'>{0}</Value></Eq></Where>", formTitle);
                        
                        dt = oList.GetItems(oQry).GetDataTable();

                        if (dt != null)
                        {
                            sequence = dt.Rows[0][ConfigurationList.Sequence].ToString();

                            format = dt.Rows[0][ConfigurationList.Format].ToString();
                            format = format.Replace("yyyy", DateTime.Today.Year.ToString());
                            format = format.Replace("mm", DateTime.Today.Month.ToString());
                            format = format.Replace("dd", DateTime.Today.Day.ToString());
                            string[] arr = format.Split('-');

                            for (int k = 0; k < arr[5].Length; k++)
                            {
                                number = number + 0;
                            }

                            number = (Convert.ToInt32(number) + Convert.ToInt32(sequence) + 1).ToString();
                            sequence = number.ToString();
                        }
                    }
                    catch (Exception ex)
                    {
                        Utility.AddException(ex);
                    }
                }
            }
            return sequence;
        }
    }
}
