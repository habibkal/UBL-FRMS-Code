using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Data;
using System.ComponentModel;
using System.Diagnostics;
using Microsoft.SharePoint.Applications;
using Microsoft.SharePoint.Client;
using Microsoft.SharePoint.Utilities;
using Microsoft.SharePoint;

namespace UBL_FRMS.Classes.Common
{
    public static class ExceptionHandling
    {
        const string sSource = "HR Portal Admin";
        const string sLog = "Application";

        #region Enum
        public enum ErrorType
        {
            WebPart = 1,
            ListPage = 2,
            DetailPage = 3,
            Form = 4
        }
        #endregion

        #region Wrapper methods

        public static void WebPartError(Exception ex)
        {
            ExceptionHandler(ErrorType.WebPart, ex);
        }

        public static void ListPagesError(Exception ex)
        {
            ExceptionHandler(ErrorType.ListPage, ex);
        }

        public static void DetailPagesError(Exception ex)
        {
            ExceptionHandler(ErrorType.DetailPage, ex);
        }

        public static void FormError(Exception ex)
        {
            ExceptionHandler(ErrorType.Form, ex);
        }
       
        #endregion

        private static void ExceptionHandler(ErrorType errorType, Exception ex)
        {
            //string userName = HttpContext.Current.User.Identity.Name;
            //userName = userName.Remove(0, userName.IndexOf("\\") + 1);

            //StackTrace trace = new StackTrace();

            //Microsoft.SharePoint.SPSecurity.RunWithElevatedPrivileges(delegate()
            //{
            //    if (!EventLog.SourceExists(sSource))
            //        EventLog.CreateEventSource(sSource, sLog);

            //    EventLog.WriteEntry(sSource, string.Format("User: {0} \nFile: {1} \nMethod: {2}\nError: {3}\nErrorType: {4} ",
            //        userName,
            //        trace.GetFrame(2).GetMethod().DeclaringType.Name,
            //        trace.GetFrame(2).GetMethod().Name, 
            //        ex.Message + ex.StackTrace,
            //        errorType.ToString()), EventLogEntryType.Error);
            //});
        }

        public static bool IsEnrolled(object EnrollStartDate, object EnrollEndDate)
        {
            bool returnval = false;
            DateTime enrollStartDate;
            DateTime enrollEndDate;
            DateTime currentdatetime = DateTime.Parse(System.DateTime.Now.ToShortDateString());
            try
            {
                enrollStartDate = Convert.ToDateTime(EnrollStartDate);
                enrollEndDate = Convert.ToDateTime(EnrollEndDate);

                //currentdatetime = DateTime.Parse(currentdatetime.ToString(CommonConstants.Instance.CONST_GENERAL_DATETIME_FORMAT));
                enrollStartDate = DateTime.Parse(enrollStartDate.ToShortDateString());
                enrollEndDate = DateTime.Parse(enrollEndDate.ToShortDateString());

                if (enrollStartDate <= currentdatetime && enrollEndDate >= currentdatetime)
                    returnval = true;
            }
            catch (Exception ex)
            {
                UBL_FRMS.Classes.Common.Utility.AddException(ex);
                //CommonHelper.ExceptionHandler(ex);
            }
            return returnval;
        }
    }

}
