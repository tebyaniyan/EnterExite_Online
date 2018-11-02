using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EnterExite_Online.Person
{
    public partial class Admin : System.Web.UI.Page
    {
        Models.EnterAndExiteOnlineEntities db = new Models.EnterAndExiteOnlineEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            int? personID = int.Parse(Request.QueryString["PersonID"].ToString());
            if (personID != null)
            {
                var admin = (from x in this.db.Persons where x.PersonID == personID.Value && x.IsAdmin select x).SingleOrDefault();
                if (admin == null)
                {
                    Response.Redirect("/");
                }
            }
            else {
                Response.Redirect("/");
            }
           

        }

        protected void dsListReportPerson_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = (from x in this.db.EnterExiteLogs
                        orderby x.Date descending
                        select new
                        {
                            x.EnterExite.PersonID,
                            FullName = x.EnterExite.Person.Name + " " + x.EnterExite.Person.Family,
                            EnterExiteType = x.EnterExiteType ? "وارد شده" : "خارج شده",
                            Date = x.Date,
                            Time = x.Date,
                            Present = x.EnterExite.Present ? "در شرکت حاضر است" : "در شرکت حضور ندارد",
                        }).ToList();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            db.Persons.Add(new Models.Person()
            {
                Name = this.txtName.Text,
                Family = this.txtFamily.Text,
                Phone = this.txtPhone.Text,
                Email = this.txtEmail.Text,
                Adress = this.txtAdress.Text,
                Job = this.txtJob.Text,
                Username = this.txtUsername.Text,
                Password = this.txtPassword.Text,
                IsAdmin = this.ckIsAdmins.Checked,

            });
            db.SaveChanges();
            Response.Redirect(Request.UrlReferrer.AbsolutePath);
        }

        protected void dsListPerson_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = (from x in this.db.Persons
                        orderby x.PersonID descending
                        select new
                        {
                            x.PersonID,
                            FullName = x.Name + " " + x.Family,
                            x.Job,
                            x.Email,
                            x.Username,
                            x.Password,
                            x.Phone,
                            x.Adress,
                            IsAdmin = x.IsAdmin ? "مدیر است" : "کارمند است",
                        }).ToList();
        }
    }
}