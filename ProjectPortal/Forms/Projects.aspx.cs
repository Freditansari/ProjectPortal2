using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectPortal
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //todo load user id to user id label
            UserIDLabel.Text = User.Identity.Name;
        }

        protected void BtnAddRecord_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (Page.IsValid)
                {
                    Project newProject = new Project();
                    newProject.Department = departmentDDL.SelectedValue.ToString();
                    newProject.StartDate = StartDateDatePicker.SelectedDate;
                    newProject.EndDate = EndDateDatePicker.SelectedDate;
                    newProject.UserID = UserIDLabel.Text;
                    newProject.ProjectName = ProjectNameTextBox.Text;
                    newProject.isCompleted = false;

                    TasksEntities db = new TasksEntities();
                    db.Projects.Add(newProject);
                    db.SaveChanges();
                }
                
            }
            catch (Exception)
            {
                
                
            }
        }
    }
}