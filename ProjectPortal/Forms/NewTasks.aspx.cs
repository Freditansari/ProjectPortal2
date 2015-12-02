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
    //todo add email sending capability when new task has been assigned
    public partial class WebForm4 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                UserIDDDL.DataSource = Membership.GetAllUsers();
                UserIDDDL.DataBind();    
            }
            

            userIDLabel.Text = User.Identity.Name.ToString();

        }

        protected void BtnAddRecord_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (Page.IsValid)
                {
                    Task newTask = new Task();
                    newTask.ProjectID = Convert.ToInt32( DdlProjectID.SelectedValue);
                    newTask.TaskName = TaskTextBox.Text;
                    newTask.TaskDescription = TxtTaskDescription.Text;
                    newTask.StartDate = StartDateTimePicker.SelectedDate;
                    newTask.EndDate = EndDateTimePicker.SelectedDate;
                    newTask.assignedUser = UserIDDDL.SelectedValue;
                    newTask.Creator = userIDLabel.Text;
                    newTask.isCompleted = false;

                    TasksEntities db = new TasksEntities();
                    db.Tasks.Add(newTask);
                    db.SaveChanges();

                    MembershipUser selectedMember = Membership.GetUser(newTask.assignedUser);


                    var message = new MailMessage("cendanaholding@gmail.com", selectedMember.Email);
                    //// here is an important part:
                    message.From = new MailAddress("cendanaholding@gmail.com", "Tasks Managers");
                    message.IsBodyHtml = true;
                    message.Subject = "New task assigned";

                    
                    
                    //message.Body = "You have a new task assigned to you. Please access: " + HttpContext.Current.Request.Url.AbsoluteUri +" for more details.<br>"+newTask.TaskID.ToString()+"  "+newTask.TaskName+" <br> " +newTask.TaskDescription;
                    //message.Body = "You have a new task assigned to you. Please access: " + HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + "/TasksDetails.aspx?TaskID=" + newTask.TaskID.ToString() + " for more details.<br>Task Name:"+newTask.TaskName+" <br> Task Description: " +newTask.TaskDescription;
                    //message.Body = "You have a new task assigned to you. Please access: " + HttpContext.Current.Request.Url.Host.ToLower() + "/TasksDetails.aspx?TaskID=" + newTask.TaskID.ToString() + " for more details.<br>Task Name:" + newTask.TaskName + " <br> Task Description: " + newTask.TaskDescription; ==> this still spew ip address
                    message.Body = "You have a new task assigned to you. Please access: " + global.DomainName  + "/TasksDetails.aspx?TaskID=" + newTask.TaskID.ToString() + " for more details.<br>Task Name:" + newTask.TaskName + " <br> Task Description: " + newTask.TaskDescription; 

                    var client = new SmtpClient();
                    client.EnableSsl = true;
                    client.Send(message);

                    
                }
            }
            catch (Exception)
            {
                
                
            }
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{

        //    var message = new MailMessage("cendanaholding@gmail.com", "freditansari@gmail.com");
        //    //// here is an important part:
        //    message.From = new MailAddress("cendanaholding@gmail.com", "Tasks Managers");
        //    message.IsBodyHtml = true;
        //    message.Body = "You have a new task assigned to you. Please access: " + HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) +"/TasksDetails.aspx?TaskID=" + 1004 + " for more details.<br>";


        //    var client = new SmtpClient();
        //    client.EnableSsl = true;
        //    //client.Send(message);

        
        //}
    }
}