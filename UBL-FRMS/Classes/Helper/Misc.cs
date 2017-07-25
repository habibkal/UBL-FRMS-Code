using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;
using Microsoft.SharePoint;
using Microsoft.SharePoint.Utilities;

namespace UBL_FRMS.Classes.Helper
{
    public static class Misc
    {
        public static void SelectDropdownValue(DropDownList ddl, string value)
        {
            for (int i = 0; i < ddl.Items.Count; i++)
            {
                if (ddl.Items[i].Value == value)
                {
                    ddl.SelectedIndex = i;
                    return;
                }
            }

            ddl.SelectedIndex = 0;
        }

        public static void SelectDropdownText(DropDownList ddl, string text)
        {
            for (int i = 0; i < ddl.Items.Count; i++)
            {
                if (ddl.Items[i].Text == text)
                {
                    ddl.SelectedIndex = i;
                    return;
                }
            }

            ddl.SelectedIndex = 0;
        }

        public static void LoadLookupValue(SPItem oItem, string fieldName, DropDownList ddl)
        {
            object o = oItem[fieldName];
            if (o != null)
            {
                SPFieldLookupValue luVal = new SPFieldLookupValue(Convert.ToString(o));
                SelectDropdownValue(ddl, luVal.LookupId.ToString());
            }
        }

        public static void SelectChoices(CheckBoxList cbl, SPFieldMultiChoiceValue choices)
        {
            for (int i = 0; i < cbl.Items.Count; i++)
            {
                for (int j = 0; j < choices.Count; j++)
                {
                    if (cbl.Items[i].Value.Equals(choices[j]))
                    {
                        cbl.Items[i].Selected = true;
                    }
                }
            }
        }

        public static void DeleteAttachmentCollection(SPListItem oItem)
        {
            if (oItem.Attachments.Count > 0)
            {
                for (int i = 0; i < oItem.Attachments.Count; i++)
                {
                    SPFile file = oItem.ParentList.ParentWeb.GetFile(oItem.Attachments.UrlPrefix + oItem.Attachments[i].ToString());
                    oItem.Attachments.Delete(file.Name);
                }
            }
        }

        public static void DeleteAttachment(SPListItem oItem, string attachmentName)
        {
            if (oItem.Attachments.Count > 0)
            {
                for (int i = 0; i < oItem.Attachments.Count; i++)
                {
                    SPFile file = oItem.ParentList.ParentWeb.GetFile(oItem.Attachments.UrlPrefix + oItem.Attachments[i].ToString());
                    if (attachmentName.Equals(file.Name))
                    {
                        oItem.Attachments.Delete(file.Name);
                        break;
                    }
                }
            }
        }

        public static string CleanFileName(string filename)
        {
            string file = filename;
            file = string.Concat(file.Split(System.IO.Path.GetInvalidFileNameChars(), StringSplitOptions.RemoveEmptyEntries));

            if (file.Length > 250)
            {
                file = file.Substring(0, 250);
            }
            return file;
        }

        public static string AddOrReplaceQueryParameter(string queryString, string paramName, string newParamValue)
        {
            var qs = HttpUtility.ParseQueryString(queryString);
            if (!String.IsNullOrEmpty(newParamValue))
            {
                qs.Set(paramName, newParamValue);
            }
            else
            {
                qs.Remove(paramName);
            }
            return SPHttpUtility.UrlPathDecode(qs.ToString(), true);
        }

        public static void FocusControlOnPageLoad(string ClientID, System.Web.UI.Page page)
        {

            page.ClientScript.RegisterStartupScript(page.GetType(), "CtrlFocus", "var focusElement = '" + ClientID + "';_spBodyOnLoadFunctionNames.push('AddScrollView');", true);

            //page.ClientScript.RegisterStartupScript(page.GetType(), "CtrlFocus", "var focusElement = '" + ClientID + "';$(ScrollView());", true);

            //            @"<script> 
            //
            //      function ScrollView()
            //
            //      {
            //         var el = document.getElementById('" + ClientID + @"')
            //         if (el != null)
            //         {        
            //            el.scrollIntoView();
            //            el.focus();
            //         }
            //      }
            //
            //      window.onload = ScrollView;
            //
            //      </script>");

        }
    }
}
