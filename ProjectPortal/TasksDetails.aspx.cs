using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
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
            if (!System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                FinishButton.Enabled = false;
                SubmitRectificationButton.Enabled = false;
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

                //todo email the creator of the tasks

                MembershipUser assignedUser = Membership.GetUser(selectedTask.assignedUser);
                MembershipUser TaskCreator = Membership.GetUser(selectedTask.Creator);



                var message = new MailMessage("cendanaholding@gmail.com", TaskCreator.Email);
                //// here is an important part:
                message.From = new MailAddress("cendanaholding@gmail.com", "Tasks Managers");
                message.CC.Add(assignedUser.Email);
                message.IsBodyHtml = true;
                message.Subject = "Task has finished";



                //message.Body = "You have a new task assigned to you. Please access: " + HttpContext.Current.Request.Url.AbsoluteUri +" for more details.<br>"+newTask.TaskID.ToString()+"  "+newTask.TaskName+" <br> " +newTask.TaskDescription;
                //message.Body = "You have a new task assigned to you. Please access: " + HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + "/TasksDetails.aspx?TaskID=" + newTask.TaskID.ToString() + " for more details.<br>Task Name:"+newTask.TaskName+" <br> Task Description: " +newTask.TaskDescription;
                //message.Body = "You have a new task assigned to you. Please access: " + HttpContext.Current.Request.Url.Host.ToLower() + "/TasksDetails.aspx?TaskID=" + newTask.TaskID.ToString() + " for more details.<br>Task Name:" + newTask.TaskName + " <br> Task Description: " + newTask.TaskDescription; ==> this still spew ip address
                message.Body = "Your task created/assigned by/to you has finished. Please access: " + global.DomainName + "/TasksDetails.aspx?TaskID=" + queryString + " for more details.<br>Task Name:" + selectedTask.TaskName + " <br> Task Description: " + selectedTask.TaskDescription;

                var client = new SmtpClient();
                client.EnableSsl = true;
                client.Send(message);



            }
            catch (Exception)
            {
                
            }
        }

        protected void SubmitRectificationButton_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (Page.IsValid)
            {
                try
                {
                    Rectification newRect = new Rectification();
                    newRect.RectificationDate = DateTime.Now;
                    newRect.TaskID = Convert.ToInt32(queryString);
                    newRect.RectificationNotes = RectificationTextBox.Text;
                    newRect.userID = User.Identity.Name.ToString();

                    TasksEntities db = new TasksEntities();
                    db.Rectifications.Add(newRect);
                    db.SaveChanges();
                    RectificationsDataGrid.DataBind();
                }
                catch (Exception)
                {
                    
                    
                }
            }
        }
    }
}