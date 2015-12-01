using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectPortal
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void addNewDepartmentsButton_Click(object sender, EventArgs e)
        {
            try
            {
                Department newDept = new Department();
                newDept.Department1 = DepartmentTextBox.Text;

                // db = new Project();
                TasksEntities db = new TasksEntities();
                db.Departments.Add(newDept);
                db.SaveChanges();

                DepartmentTextBox.Text = "";
                DeptDataGrid.DataBind();



                
            }
            catch (Exception)
            {
                
                
            }
        }
    }
}