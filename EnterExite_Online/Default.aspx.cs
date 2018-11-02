using EnterExite_Online.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EnterExite_Online
{
    public partial class Default : System.Web.UI.Page
    {
        Models.EnterAndExiteOnlineEntities db = new Models.EnterAndExiteOnlineEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

            this.lblDateNow.Text = DateTime.Now.ToString("yyyy/MM/dd");
        }

        protected void btnEnter_Click(object sender, EventArgs e)
        {
            if (!this.Page.IsValid)


                System.Threading.Thread.Sleep(1000);

            var StartDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 00, 00, 00, 000);
            var EndDate = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 23, 59, 59, 999);






            var result = (from x in this.db.Persons where x.Username == this.txtUsername.Text && x.Password == this.txtPassword.Text select x).SingleOrDefault();
            if (result != null)
            {
                var exit = (from x in this.db.EnterExites
                            where x.PersonID == result.PersonID
                            && x.Date >= StartDate
                            && x.Date <= EndDate
                            && x.EnterExiteType
                            select x).SingleOrDefault();
                if (exit != null)
                {
                    if (exit.EnterExiteType)
                    {
                        this.ExitePerson(exit.PersonID);
                        var FullName = result.Name + " " + result.Family;
                        var date = DateTime.Now.ToString("yyyy/MM/dd");
                        var time = DateTime.Now.ToString("HH:mm");
                        var message = string.Format("{0} اطلاعات خروج شما در تاریخ {1} و ساعت {2} در سامانه ثبت شد.خسته نباشید  ", FullName, date, time);
                        this.lblSucsses.Text = message;
                        this.lblSucsses.CssClass = "alert alert-success btn-block";


                    }


                }
                else
                {
                    var FullName = result.Name + " " + result.Family;
                    var date = DateTime.Now.ToString("yyyy/MM/dd");
                    var time = DateTime.Now.ToString("HH:mm");
                    this.txtUsername.Text = "";
                    this.btnEnter.Visible = false;
                    var message = string.Format("{0} اطلاعات ورود شما در تاریخ {1} و ساعت {2} در سامانه ثبت شد.روز خوبی داشته باشید  ", FullName, date, time);
                    this.lblSucsses.Text = message;
                    this.lblSucsses.CssClass = "alert alert-success btn-block";
                    this.EnterPerson(result.PersonID);
                    System.Threading.Thread.Sleep(4000);
                    Response.Redirect("ShowPerson.aspx?PersonID=" + result.PersonID);
                }
            }
            else
            {
                this.lblSucsses.Text = "اطلاعاتی در سیستم یافت نشد";
                this.lblSucsses.CssClass = "alert alert-danger btn-block";
                this.txtUsername.Text = "";
            }
        }

        public void EnterPerson(int personID)
        {

            EnterExite enterexite = new EnterExite()
            {
                PersonID = personID,
                EnterExiteType = true,
                Present = true,
                Date = DateTime.Now,
            };
            db.EnterExites.Add(enterexite);
            db.SaveChanges();

            db.EnterExiteLogs.Add(new EnterExiteLog()
            {
                EnterExiteID = enterexite.EnterExiteID,
                Date = DateTime.Now,
                EnterExiteType = true,
            });
            db.SaveChanges();



        }

        public void ExitePerson(int personID)
        {
            var exite = (from x in this.db.EnterExites where x.PersonID == personID && x.EnterExiteType select x).SingleOrDefault();
            if (exite != null)
            {
                exite.EnterExiteType = false;
                exite.Present = false;
                db.SaveChanges();
            }

            db.EnterExiteLogs.Add(new EnterExiteLog()
            {
                EnterExiteID = exite.EnterExiteID,
                Date = DateTime.Now,
                EnterExiteType = false,
            });
            db.SaveChanges();

        }

        protected void btnLoginAdmin_Click(object sender, EventArgs e)
        {
            var admin = (from x in this.db.Persons
                         where
                        x.Username == this.txtUsernameAdmin.Text
                        && x.Password == this.txtPasswordAdmin.Text
                        && x.IsAdmin
                         select x).SingleOrDefault();
            if (admin != null)
            {
                Response.Redirect("/Person/Admin.aspx?PersonID=" + admin.PersonID);
            }
        }
    }


}
