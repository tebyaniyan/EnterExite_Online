using EnterExite_Online.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EnterExite_Online
{
    public partial class ShowPerson : System.Web.UI.Page
    {
        Models.EnterAndExiteOnlineEntities db = new Models.EnterAndExiteOnlineEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack)
            {
                int? personID = int.Parse(Request.QueryString["PersonID"].ToString());
                if (personID != null)
                {
                    var person = (from x in this.db.Persons where x.PersonID == personID.Value select x).SingleOrDefault();
                    this.lblPersonName.Text = person.Name + " " + person.Family;
                    this.lblEmail.Text = person.Email;
                    this.lblJob.Text = person.Job;
                    this.lblPhone.Text = person.Phone;
                 this.lblWelcom.Text= "خوش آمدید" + " " + person.Name + " " + person.Family;
                }


            }
        }

        protected void dsListReportPerson_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            int personID = int.Parse(Request.QueryString["PersonID"].ToString());
            e.Result = (from x in this.db.EnterExiteLogs
                        where x.EnterExite.PersonID == personID
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

        








    }
}
