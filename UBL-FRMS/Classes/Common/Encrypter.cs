using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Xml;
using System.Security.Cryptography;

namespace UBL_FRMS.Classes.Common
{
    public class Encrypter
    {
        byte[] key = { };
        byte[] IV = { 0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF };
        private string defaultEncryptionKey = "dfqw345123;'flas;le5rt345df0";

        public Encrypter()
        {
        }

        public string Decrypt(string stringToDecrypt)
        {
            return this.Decrypt(stringToDecrypt, this.defaultEncryptionKey);
        }

        public string Decrypt(string stringToDecrypt, string encryptionKey)
        {
            byte[] inputByteArray = new byte[stringToDecrypt.Length];
            //encryptionKey, 8

            key = System.Text.Encoding.UTF8.GetBytes(encryptionKey.Substring(0, 8));
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            int mod4 = stringToDecrypt.Length % 4;
            if (mod4 > 0)
            {
                //encodedBytes += new string('=', 4 - mod4);
                for (int i = (4 - mod4); i < 0; i++)
                {
                    //int len = encodedBytes.Length;
                    //encodedBytes[len + 1] = Convert.ToByte("=");
                    stringToDecrypt += "=";
                }
            }
            //inputByteArray = Encoding.ASCII.GetBytes(stringToDecrypt);
            inputByteArray = Convert.FromBase64String(stringToDecrypt.Replace(' ', '+'));
            MemoryStream ms = null;
            byte[] decodedBytes = { };
            try
            {
                ms = new MemoryStream();
                CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(key, IV), CryptoStreamMode.Write);
                cs.Write(inputByteArray, 0, inputByteArray.Length);
                cs.FlushFinalBlock();
                decodedBytes = ms.ToArray();
            }
            finally
            {
                if (ms != null)
                    ms.Close();
            }

            System.Text.Encoding encoding = System.Text.Encoding.UTF8;
            return encoding.GetString(decodedBytes);

        }

        public string Encrypt(string stringToEncrypt)
        {
            return this.Encrypt(stringToEncrypt, this.defaultEncryptionKey);
        }

        public string Encrypt(string stringToEncrypt, string encryptionKey)
        {
            key = System.Text.Encoding.UTF8.GetBytes(encryptionKey.Substring(0, 8));
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            byte[] inputByteArray = Encoding.UTF8.GetBytes(stringToEncrypt.Replace(' ', '+'));
            MemoryStream ms = null;
            byte[] encodedBytes = { };
            try
            {
                ms = new MemoryStream();
                CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(key, IV), CryptoStreamMode.Write);
                cs.Write(inputByteArray, 0, inputByteArray.Length);
                cs.FlushFinalBlock();

                encodedBytes = ms.ToArray();
            }
            finally
            {
                if (ms != null)
                    ms.Close();
            }

            int mod4 = encodedBytes.Length % 4;
            if (mod4 > 0)
            {
                //encodedBytes += new string('=', 4 - mod4);
                for (int i = (4 - mod4); i < 0; i++)
                {
                    int len=encodedBytes.Length;
                    encodedBytes[len + 1] = Convert.ToByte("=");
                }
            }
            return Convert.ToBase64String(encodedBytes,0,encodedBytes.Length);
        }
    }
}
