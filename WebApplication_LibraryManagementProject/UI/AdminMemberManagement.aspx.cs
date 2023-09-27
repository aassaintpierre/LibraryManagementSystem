﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication_LibraryManagementProject.Models;

namespace WebApplication_LibraryManagementProject.UI
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        private UNILibraryDbContext db = new UNILibraryDbContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            /*MemberGridView.DataBind();*/
        }

        protected void GoButton_Click(object sender, EventArgs e)
        {
            Clear();
            string userid = UsernameTextBox.Text.Trim();
            if (!userid.Equals(""))
            {
                var v = db.Members.Where(m => m.Username == userid).FirstOrDefault();
                if(v != null)
                {
                    FullNameTextBox.Text = v.FullName;
                    AccountStatusTextBox.Text = v.AccountStatus;
                    AccessTextBox.Text = v.Access;
                    EmailIDTextBox.Text = v.Email;
                }
                else
                {
                    Response.Write("<script>alert('Account Not Found')</script>");
                }
            }
        }

        protected void ActiveButton_Click(object sender, EventArgs e)
        {
            UpdateMemberStatusById("active");
            GoButton_Click(sender, e);
        }

        protected void PendingButton_Click(object sender, EventArgs e)
        {
            UpdateMemberStatusById("pending");
            GoButton_Click(sender, e);
        }
        protected void DeactiveButton_Click(object sender, EventArgs e)
        {
            UpdateMemberStatusById("deactive");
            GoButton_Click(sender, e);
        }
        private void UpdateMemberStatusById(string status)
        {
            string userid = UsernameTextBox.Text.Trim();
            if (!userid.Equals(""))
            {
                var v = db.Members.Where(m => m.Username == userid).FirstOrDefault();
                if (v != null)
                {
                    v.AccountStatus = status;
                    db.SaveChanges();
                    MemberGridView.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Account Not Found')</script>");
                }
            }
        }
        private void Clear()
        {
            FullNameTextBox.Text = "";
            AccountStatusTextBox.Text = "";
            EmailIDTextBox.Text = "";
            AccessTextBox.Text = "";
        }

        protected void MemberGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    if (e.Row.Cells[2].Text.Equals("active"))
                    {
                        e.Row.BackColor = System.Drawing.Color.LightGreen;
                    }
                    else if (e.Row.Cells[2].Text.Equals("pending"))
                    {
                        e.Row.BackColor = System.Drawing.Color.LightGoldenrodYellow;
                    }
                    else
                    {
                        e.Row.BackColor = System.Drawing.Color.PaleVioletRed;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}