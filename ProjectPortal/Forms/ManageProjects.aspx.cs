using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectPortal
{
    public partial class WebForm6 : System.Web.UI.Page
    {

        static int selectedProjectID;
        static TasksEntities db = new TasksEntities();
        static Project selectedProject = new Project();

        protected void Page_Load(object sender, EventArgs e)
        {
            UserIDLabel.Text = User.Identity.Name;
        }

        protected void BtnAddRecord_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (Page.IsValid)
                {
                    var query = from b in db.Projects where b.ProjectID == selectedProjectID select b;

                    selectedProject = query.Single();


                    selectedProject.Department = departmentDDL.SelectedValue.ToString();
                    selectedProject.StartDate = StartDateDatePicker.SelectedDate;
                    selectedProject.EndDate = EndDateDatePicker.SelectedDate;
                    selectedProject.UserID = UserIDLabel.Text;
                    selectedProject.ProjectName = ProjectNameTextBox.Text;
                    selectedProject.isCompleted = CbxIsCompleted.Checked;

                    db.SaveChanges();

                    RadGrid1.DataBind();

                
                }

            }
            catch (Exception)
            {


            }
        }

        protected void RadGrid1_SelectedIndexChanged(object sender, EventArgs e)
        {
            //try
            //{
                selectedProjectID = Convert.ToInt32(RadGrid1.SelectedValue);
                var query = from b in db.Projects where b.ProjectID == selectedProjectID select b;
                selectedProject = query.Single();

                
                

                ProjectNameTextBox.Text = selectedProject.ProjectName;
                StartDateDatePicker.SelectedDate = selectedProject.StartDate;
                EndDateDatePicker.SelectedDate = selectedProject.EndDate;
                CbxIsCompleted.Checked = Convert.ToBoolean( selectedProject.isCompleted);
                if (Page.IsPostBack)
                {
                    //string DeparmentName = selectedProject.Department;
                    //UserIDLabel.Text = DeparmentName;
                    departmentDDL.ClearSelection();
                    departmentDDL.Items.FindByValue(selectedProject.Department).Selected = true;
                }

            //}
            //catch (Exception)
            //{
                
                
            //}
            
            
        }
    }
}