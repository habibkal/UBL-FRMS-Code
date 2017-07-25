using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace UBL_FRMS.Classes.Helper
{
    public class FieldTypes
    {
        public const string Number = "Number";
        public const string User = "User";
        public const string Lookup = "Lookup";
        public const string Text = "Text";
        public const string Choice = "Choice";
    }

    public class Comparison
    {
        public const string Equals = "Eq";
        public const string Contains = "Contains";
    }

    public class LogicalJoin
    {
        public const string And = "And";
        public const string Or = "Or";
    }

    public abstract class CamlQueryElement
    {
        public abstract string GetString();
    }

    public class CamlQueryItem : CamlQueryElement
    {
        public string ComparisonOperator { get; set; } // like <Eq>, <Contains>
        public string FieldName { get; set; } // Like Title
        public string FieldType { get; set; } // Like Text
        public string FieldValue { get; set; } // some value
        public bool? IsLookupId { get; set; }  //Is LookupId?


        public CamlQueryItem()
        {
        }

        public CamlQueryItem(string comparisonOperator, string fieldName, string fieldType, string fieldValue, bool? isLookup)
        {
            ComparisonOperator = comparisonOperator;
            FieldName = fieldName;
            FieldType = fieldType;
            FieldValue = fieldValue;
            IsLookupId = isLookup;
        }

        public override string GetString()
        {
            string query = @"<{0}><FieldRef Name='{1}' {2} /><Value {3} Type='{4}'>{5}</Value></{0}>";

            string date = string.Empty;
            string isLookup = string.Empty;
            // Display only Date
            if (String.Compare(FieldType, "DateTime", true) == 0)
                date = "IncludeTimeValue='FALSE'";
            if (IsLookupId != null)
            {
                isLookup = "LookupId='" + IsLookupId.Value.ToString().ToUpper() + "'";
            }
            return string.Format(query, ComparisonOperator, FieldName, isLookup, date, FieldType, FieldValue);
        }
    }

    public class CamlQueryGroup : CamlQueryElement
    {
        public string LogicalJoin { get; set; }
        private List<CamlQueryElement> _elements;

        public CamlQueryGroup()
        {
        }

        public CamlQueryGroup(string logicalJoin)
        {
            LogicalJoin = logicalJoin;
        }

        public void AddElement(CamlQueryElement element)
        {
            if (_elements == null)
            {
                _elements = new List<CamlQueryElement>();
            }

            _elements.Add(element);
        }

        public override string GetString()
        {
            StringBuilder queryJoin = new StringBuilder();
            int itemCount = 0;
            foreach (CamlQueryElement element in _elements)
            {
                itemCount++;
                queryJoin.Append(element.GetString());
                if (itemCount >= 2)
                {
                    queryJoin.Insert(0, string.Format("<{0}>", LogicalJoin));
                    queryJoin.Append(string.Format("</{0}>", LogicalJoin));
                }
            }

            return queryJoin.ToString();
        }
    }

    public class CamlQueryHelper
    {
        public static string BuildQuery(CamlQueryGroup camlGroup)
        {
            return "<Where>" + camlGroup.GetString() + "</Where>";
        }
    }
}
