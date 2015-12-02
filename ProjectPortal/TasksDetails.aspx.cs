using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectPortal
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        string queryString;
        protected void Page_Load(object sender, EventArgs e)
        {
            queryString = Request.QueryString["TaskID"];
            if (queryString == null)
            {
                FinishButton.Enabled = false;
            }
        }

        protected void FinishButton_Click(object sender, EventArgs e)
        {
            try
            {
                int taskID = Convert.ToInt32(queryString);
                TasksEntities db = new TasksEntities();


                var taskQuery = from b in db.Tasks where b.TaskID == taskID select b;

                Task selectedTask = taskQuery.Single();

                selectedTask.isCompleted = true;
                selectedTask.FinishedDate = DateTime.Now;
                selectedTask.Remarks = NoteTextBox.Text;

                db.SaveChanges();
                DetailsView1.DataBind();



            }
            catch (Exception)
            {
                
            }
        }
    }
}