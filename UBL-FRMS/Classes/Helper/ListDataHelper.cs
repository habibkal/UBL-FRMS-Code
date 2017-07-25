using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.SharePoint;
using System.Data;
using UBL_FRMS.Classes.Constant;
using UBL_FRMS.Classes.Data;
using Microsoft.SharePoint.Workflow;

namespace UBL_FRMS.Classes.Helper
{
    public static class ListDataHelper
    {
        public static DataTable GetListData(SPWeb oWeb, string oListName)
        {
            SPList oList = oWeb.Lists[oListName];
            SPListItemCollection oCol = oList.GetItems();
            DataTable dt = oCol.GetDataTable();
            return dt;
        }

        public static SPField GetField(SPFieldCollection oFields, string internalName)
        {
            foreach (SPField oField in oFields)
            {
                if (oField.InternalName.Equals(internalName))
                {
                    return oField;
                }
            }
            return null;
        }

        //public static bool IsValidChoice(SPWeb web, string listName, string columnName, string value)
        //{
        //    DataTable choices = GetColumnChoices(web, listName, columnName);
        //    for (int i = 0; i < choices.Rows.Count; i++ )
        //    {
        //        DataRow row = choices.Rows[i];
        //        if (row[GeneralConstants.ChoiceColumnValue].ToString().Equals(value))
        //        {
        //            return true;
        //        }
        //    }

        //    return false;
        //}

        public static bool IsValidChoice(SPWeb oWeb, string oListName, string oColumnName, string value)
        {
            if (String.IsNullOrEmpty(value))
            {
                return !IsRequired(oWeb, oListName, oColumnName);
            }

            return !String.IsNullOrEmpty(MakeValidChoice(oWeb, oListName, oColumnName, value));

            //DataTable choices = GetColumnChoices(web, listName, columnName);
            //value = value.Trim();
            //for (int i = 0; i < choices.Rows.Count; i++ )
            //{
            //    DataRow row = choices.Rows[i];
            //    if (row[GeneralConstants.ChoiceColumnValue].ToString().Equals(value, StringComparison.InvariantCultureIgnoreCase))
            //    {
            //        return true;
            //    }
            //}

            //return false;
        }

        public static bool IsRequired(SPWeb oWeb, string oListName, string oColumnName)
        {
            SPList oList = oWeb.Lists[oListName];
            SPField oField = GetField(oList.Fields, oColumnName);
            if (oField == null)
            {
                return false;
            }
            return oField.Required;
        }

        public static string MakeValidChoice(SPWeb oWeb, string oListName, string oColumnName, string value)
        {
            DataTable choices = GetColumnChoices(oWeb, oListName, oColumnName);
            value = value.Trim();

            for (int i = 0; i < choices.Rows.Count; i++)
            {
                DataRow row = choices.Rows[i];
                string choice = row[GeneralConstants.ChoiceColumnValue].ToString();

                if (choice.Equals(value, StringComparison.InvariantCultureIgnoreCase))
                {
                    return choice;
                }
            }

            return String.Empty;
        }

        public static DataTable GetColumnChoices(SPWeb oWeb, string oListName, string oColumnName)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add(GeneralConstants.ChoiceColumnDisplay, typeof(string));
            dt.Columns.Add(GeneralConstants.ChoiceColumnValue, typeof(string));

            SPList oList = oWeb.Lists[oListName];
            SPField oField = GetField(oList.Fields, oColumnName);

            if (oField == null)
            {
                return dt;
            }

            if (oField.TypeAsString.Equals("Choice"))
            {
                SPFieldChoice choiceField = (SPFieldChoice)oField;

                foreach (string choice in choiceField.Choices)
                {
                    dt.Rows.Add(new object[] { choice, choice });
                }
            }
            else if (oField.TypeAsString.Equals("MultiChoice"))
            {
                SPFieldMultiChoice multiChoiceField = (SPFieldMultiChoice)oField;

                foreach (string choice in multiChoiceField.Choices)
                {
                    dt.Rows.Add(new object[] { choice, choice });
                }
            }
            return dt;
        }

        public static SPListItem GetListItemById(SPWeb oWeb, string oListName, Int32 itemId)
        {
            try
            {
                SPList oList = oWeb.Lists[oListName];
                return oList.GetItemById(itemId);
            }
            catch
            {
            }
            return null;
        }

        public static SPListItem GetExistingAssociatedItem(SPWeb oWeb, string oListName, string oLookupColumn, string oLookupValue)
        {
            SPListItem result = null;
            CamlQueryGroup oQueryGroup = new CamlQueryGroup("And");
            oQueryGroup.AddElement(new CamlQueryItem(Comparison.Equals, oLookupColumn, FieldTypes.Lookup, oLookupValue, true));

            SPQuery oQry = new SPQuery();
            oQry.Query = CamlQueryHelper.BuildQuery(oQueryGroup);
            oQry.RowLimit = 1;

            try
            {
                SPList oList = oWeb.Lists[oListName];
                SPListItemCollection oCol = oList.GetItems(oQry);

                if (oCol.Count > 0)
                {
                    result = oCol[0];
                }
            }
            catch
            {
            }
            return result;
        }

        public static SPListItem LookupByField(SPWeb oWeb, string oListName, string oFieldName, string oFieldType, string oFieldValue)
        {
            SPListItem result = null;
            CamlQueryGroup oQueryGroup = new CamlQueryGroup("And");
            bool isLookup = (oFieldType == FieldTypes.Lookup);
            oQueryGroup.AddElement(new CamlQueryItem(Comparison.Equals, oFieldName, oFieldType, oFieldValue, isLookup));

            SPQuery spQuery = new SPQuery();
            spQuery.Query = CamlQueryHelper.BuildQuery(oQueryGroup);
            spQuery.RowLimit = 1;

            try
            {
                SPList oList = oWeb.Lists[oListName];
                SPListItemCollection oCol = oList.GetItems(spQuery);

                if (oCol.Count > 0)
                {
                    result = oCol[0];
                }
            }
            catch
            {
            }
            return result;
        }

        public static DataTable GetLists(SPWeb oWeb)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add(GeneralConstants.DataTableDisplayField, typeof(string));
            dt.Columns.Add(GeneralConstants.DataTableValueField, typeof(string));

            SPListCollection oListCol = oWeb.Lists;
            foreach (SPList oList in oListCol)
            {
                if (!oList.Hidden)
                {
                    dt.Rows.Add(new object[] { oList.Title, oList.ID.ToString() });
                }
            }

            return dt;
        }

        static string[] ignoreAttributeNames = {"LinkTitle", "LinkTitleNoMenu", "LinkTitle2", "LinkFilename",
				"LinkFilename2", "LinkFilenameNoMenu","_HasCopyDestinations",
				"_CopySource","owshiddenversion","WorkflowVersion","_UIVersion","_UIVersionString","_ModerationStatus",
				"Edit","SelectTitle","InstanceID","Order","WorkflowInstanceID","Last_x0020_Modified","Created_x0020_Date",
				"FSObjType","SortBehavior","PermMask","UniqueId","SyncClientId","ProgId","ScopeId","HTML_x0020_File_x0020_Type",
				"_EditMenuTableStart","_EditMenuTableStart2","_EditMenuTableEnd","DocIcon","ServerUrl","EncodedAbsUrl","BaseName",
				"MetaInfo","_Level","_IsCurrentVersion","ItemChildCount","FolderChildCount","_ModerationComments"};

        public static bool IgnoreAttribute(string name)
        {
            foreach (string s in ignoreAttributeNames)
            {
                if (name.Equals(s, StringComparison.InvariantCultureIgnoreCase))
                    return true;
            }
            return false;
        }

        public static DataTable GetListColumns(SPWeb oWeb, string oListName)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add(GeneralConstants.DataTableDisplayField, typeof(string));
            dt.Columns.Add(GeneralConstants.DataTableValueField, typeof(string));
            dt.Columns.Add(GeneralConstants.ListFieldTypeField, typeof(string));

            SPList oList = oWeb.Lists[oListName];
            if (oList == null)
                return dt;

            foreach (SPField oField in oList.Fields)
            {
                if (!oField.Hidden && !IgnoreAttribute(oField.InternalName))
                {
                    dt.Rows.Add(new object[] { oField.Title, oField.InternalName, oField.TypeAsString });
                }
            }
            return dt;
        }

        public static SPWorkflowTaskCollection WorkflowTaskItemBasedOnListItem(SPWeb oWeb, string oListName, int oItemId)
        {
            // Related to Workflow Task List
            //SPListItem oWorkflowItem = null;
            //SPList oTaskList = oWeb.Lists[oWorkflowTaskListName];

            // Related to Actual List and Item
            SPList oList = oWeb.Lists[oListName];
            SPListItem oItem = oList.GetItemById(Convert.ToInt32(oItemId));

            SPWorkflowFilter oFilter = new SPWorkflowFilter();
            oFilter.InclusiveFilterStates = SPWorkflowState.Running;

            // Get a list of workflow tasks associated with current Item 
            SPWorkflowTaskCollection oWorkTaskCol = oWeb.Site.WorkflowManager.GetItemTasks(oItem, oFilter);

            //foreach (SPWorkflowTask oTask in oWorkTaskCol)
            //{
            //    if (oTask != null)
            //    {
            //        oWorkflowItem = oTaskList.GetItemById(oTask.ID);
            //        //SPFieldUserValue userValue = (SPFieldUserValue)oTask.Fields[SPBuiltInFieldId.AssignedTo].GetFieldValue(oTask[SPBuiltInFieldId.AssignedTo].ToString());
            //        break;
            //    }
            //}
            return oWorkTaskCol;
        }

        public static DataTable getPendingTaskofLoggedinUsers(SPWeb oWeb, string oTaskListName)
        {
            DataTable dt = new DataTable();

            SPList oList = oWeb.Lists[oTaskListName];

            StringBuilder sQuery = new StringBuilder();

            sQuery.Append("<Where><And><Eq><FieldRef Name='" + WorkflowTasksList.AssignedTo + "'/><Value Type='Integer'><UserID/></Value></Eq><Neq><FieldRef Name='" + WorkflowTasksList.Status + "'/><Value Type='Text'>Completed</Value></Neq></And></Where>");
            sQuery.Append("<OrderBy><FieldRef Name='" + WorkflowTasksList.ID + "' Ascending='FALSE'/></OrderBy>");

            SPQuery oQry = new SPQuery();
            oQry.Query = sQuery.ToString();

            dt = oList.GetItems(oQry).GetDataTable();

            return dt;
        }

        public static DataTable GetListDataByFieldRowCount(SPWeb web, string listName, CamlQueryGroup camlQueryGroup, uint rowCount)
        {
            DataTable dt = new DataTable();

            try
            {
                SPList oList = web.Lists[listName];

                SPQuery spQuery = new SPQuery();
                spQuery.RowLimit = rowCount;
                spQuery.Query = CamlQueryHelper.BuildQuery(camlQueryGroup);

                SPListItemCollection oCol = oList.GetItems(spQuery);
                dt = oCol.GetDataTable();
            }
            catch (Exception ex)
            {
                UBL_FRMS.Classes.Common.Utility.AddException(ex);
                return null;
            }
            return dt;
        }
        public static DataTable GetListDataByField(SPWeb web, string listName, CamlQueryGroup camlQueryGroup)
        {
            DataTable dt = new DataTable();
            //CamlQueryGroup queryGroup = new CamlQueryGroup("And");
            //bool isLookup = (fieldType == FieldTypes.Lookup);
            //queryGroup.AddElement(new CamlQueryItem(Comparison.Equals, fieldName, fieldType, fieldValue, isLookup));
            //SPQuery spQuery = new SPQuery();
            //spQuery.Query = CamlQueryHelper.BuildQuery(queryGroup);
            //spQuery.RowLimit = 1;
            try
            {
                SPList oList = web.Lists[listName];
                //SPView wpView = oList.Views["All Items"];
                //wpView.RowLimit = 2147483647;
                //SPQuery spQuery = new SPQuery(wpView);
                SPQuery spQuery = new SPQuery();
                spQuery.Query = CamlQueryHelper.BuildQuery(camlQueryGroup);

                SPListItemCollection oCol = oList.GetItems(spQuery);
                dt = oCol.GetDataTable();
            }
            catch (Exception ex)
            {
                UBL_FRMS.Classes.Common.Utility.AddException(ex);
                return null;
            }
            return dt;
        }


        public static SPFieldLookupValue GetLookupFieldFromValue(SPWeb web, string lookupValue, string lookupSourceColumn, string lookupSourceListName)
        {
            SPList lookupSourceList = web.Lists[lookupSourceListName];

            SPFieldLookupValue value = null;
            SPQuery query = new SPQuery();
            query.Query = "<Where><Eq><FieldRef Name='" + lookupSourceColumn + "'/><Value Type='Text'>" + lookupValue + "</Value></Eq></Where>";

            SPListItemCollection listItems = lookupSourceList.GetItems(query);
            if (listItems.Count > 0)
                value = new SPFieldLookupValue(listItems[0].ID, lookupValue);
            return value;
        }
    }
}
