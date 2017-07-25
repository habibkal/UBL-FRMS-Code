using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.Net.Mail;
using System.Configuration;
using Microsoft.SharePoint;
using UBL_FRMS.Classes.Data;

namespace UBL_FRMS.Classes.Common
{
    public static class Utility
    {
        public static bool SendEmail(string toAddress, string subject, string bodyText)
        {
            bool isSend = false;
            MailMessage message = new MailMessage();
            // message.From = new MailAddress("hassanraza.zaidi@systemsltd.com");
            string[] toEmailAddresses = toAddress.Split(new char[] { ',', ';' });
            
            //message.To.Add(new MailAddress(toAddress));
            foreach (string email in toEmailAddresses)
            {
                if (email != string.Empty)
                    message.To.Add(email);
            }
            message.Subject = subject;
            message.Body = bodyText;
            message.IsBodyHtml = true;
            Encrypter enc = new Encrypter();
            string de_NetHost = enc.Decrypt(ConfigurationSettings.AppSettings["networkhost"].ToString());
            string de_UserName = enc.Decrypt(ConfigurationSettings.AppSettings["username"].ToString());
            string de_Password = enc.Decrypt(ConfigurationSettings.AppSettings["password"].ToString());
            SmtpClient client = new SmtpClient();
            client.Host = de_NetHost;
            client.Credentials = new NetworkCredential(de_UserName, de_Password);
            //string en_NetHost = enc.Encrypt(ConfigurationManager.AppSettings["networkhost"].ToString());
            //string en_UserName = enc.Encrypt(ConfigurationManager.AppSettings["username"].ToString());
            //string en_Password = enc.Encrypt(ConfigurationManager.AppSettings["password"].ToString());
            client.Port = 25;

            try
            {
                client.Send(message);
                isSend = true;
            }
            catch (Exception ex)
            {
                UBL_FRMS.Classes.Common.Utility.AddException(ex);
                isSend = false;
            }
            return isSend;
        }

        public static void AddException(Exception ex)
        {
            try
            {
                SPSecurity.RunWithElevatedPrivileges(delegate()
                {
                    SPWeb oWeb = SPContext.Current.Site.RootWeb;
                    oWeb.AllowUnsafeUpdates = true;
                    SPList oList = oWeb.Lists[ExceptionLogList.ListName];

                    SPListItem oItem = oList.AddItem();
                    oItem[ExceptionLogList.Title] = ex.Source;
                    oItem[ExceptionLogList.ExceptionMessage] = ex.Message;
                    oItem[ExceptionLogList.InnerException] = ex.InnerException;
                    oItem[ExceptionLogList.StackTrace] = ex.StackTrace;
                    oItem[ExceptionLogList.TargetSite] = ex.TargetSite;
                    oItem[ExceptionLogList.LoginName] = Common.GetCurrentUserLoginName();
                    oItem[ExceptionLogList.DisplayName] = Common.GetCurrentUserDisplayName();
                    oItem.Update();

                    oWeb.AllowUnsafeUpdates = false;
                });
            }
            catch (Exception exp)
            {
                UBL_FRMS.Classes.Common.Utility.AddException(exp);
                //Utility.AddException(exp);
            }
        }
    }
}
