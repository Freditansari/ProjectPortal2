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
    public partial class WebForm5 : System.Web.UI.Page
    {
        Task selectedTasks = new Task();
        TasksEntities db = new TasksEntities();
        int selectedTaskID;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            userIDLabel.Text = User.Identity.Name;
            if (!Page.IsPostBack)
            {
                UserIDDDL.DataSource = Membership.GetAllUsers();
                UserIDDDL.DataBind();
            }
        }

        protected void TasksRadGrid_SelectedIndexChanged(object sender, EventArgs e)
        {
            var selectedValue = TasksRadGrid.SelectedValue;
            try
            {
                
             
                selectedTaskID = Convert.ToInt32(selectedValue);
                TaskIDLabel.Text = selectedTaskID.ToString();
                var query = from b in db.Tasks where b.TaskID == selectedTaskID select b;

                selectedTasks = query.Single();


                
               
                TaskTextBox.Text = selectedTasks.TaskName;
                TxtTaskDescription.Text = selectedTasks.TaskDescription;
                StartDateTimePicker.SelectedDate = selectedTasks.StartDate;
                EndDateTimePicker.SelectedDate = selectedTasks.EndDate;
                CbxIsCompleted.Checked = Convert.ToBoolean( selectedTasks.isCompleted);
                RemarksTextBox.Text = selectedTasks.Remarks;



                if (Page.IsPostBack)
                {
                    try
                    {
                       
                        UserIDDDL.ClearSelection();
                        UserIDDDL.Items.FindByValue(selectedTasks.assignedUser.ToString()).Selected = true;

                       
                    }
                    catch(Exception)
                    {
                    }
                }

                ProjectSelectionDDL.ClearSelection();
                ProjectSelectionDDL.Items.FindByValue(selectedTasks.ProjectID.ToString()).Selected = true;
              

                
            }
            catch (Exception)
            {
                
                
            }
            //load selected task

            
        }

        protected void TasksRadGrid_ItemUpdated(object sender, Telerik.Web.UI.GridUpdatedEventArgs e)
        {

        }

     

        protected void BtnAddRecord_Click(object sender, EventArgs e)
        {

        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (Page.IsValid)
                {
                    int selectedTask = Convert.ToInt32(TaskIDLabel.Text);
                    var query = from b in db.Tasks where b.TaskID == selectedTask select b;
                    //Task newTask = new Task();

                    selectedTasks = query.Single();
                    selectedTasks.ProjectID = Convert.ToInt32(ProjectSelectionDDL.SelectedValue);
                    selectedTasks.TaskName = TaskTextBox.Text;
                    selectedTasks.TaskDescription = TxtTaskDescription.Text;
                    selectedTasks.StartDate = StartDateTimePicker.SelectedDate;
                    selectedTasks.EndDate = EndDateTimePicker.SelectedDate;
                    selectedTasks.assignedUser = UserIDDDL.SelectedValue;
                    //selectedTasks.Creator = userIDLabel.Text;
                    selectedTasks.isCompleted = CbxIsCompleted.Checked;
                    selectedTasks.Remarks = RemarksTextBox.Text;
                    if (CbxIsCompleted.Checked)
                    {
                        selectedTasks.FinishedDate = DateTime.Now;
                    }

                    db.SaveChanges();

                    TasksRadGrid.DataBind();

                    if (!CbxIsCompleted.Checked)
                    {
                        MembershipUser selectedMember = Membership.GetUser(selectedTasks.assignedUser);
                        var message = new MailMessage("cendanaholding@gmail.com", selectedMember.Email);
                        //// here is an important part:
                        message.From = new MailAddress("cendanaholding@gmail.com", "Tasks Managers");
                        message.IsBodyHtml = true;
                        message.Subject = "New task assigned";

                        //message.Body = "You have a new task assigned to you. Please access: " + HttpContext.Current.Request.Url.AbsoluteUri +" for more details.<br>"+newTask.TaskID.ToString()+"  "+newTask.TaskName+" <br> " +newTask.TaskDescription;
                        //message.Body = "You have a new task assigned to you. Please access: " + HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + "/TasksDetails.aspx?TaskID=" +selectedTasks.TaskID.ToString() + " for more details.<br>Task Name:" + selectedTasks.TaskName+ " <br> Task Description: " + selectedTasks.TaskDescription;
                        //message.Body = "You have a new task assigned to you. Please access: " + HttpContext.Current.Request.Url.Host.ToLower()+ "/TasksDetails.aspx?TaskID=" + selectedTasks.TaskID.ToString() + " for more details.<br>Task Name:" + selectedTasks.TaskName + " <br> Task Description: " + selectedTasks.TaskDescription;
                        message.Body = "You have a new task assigned to you. Please access: " + global.DomainName + "/TasksDetails.aspx?TaskID=" + selectedTasks.TaskID.ToString() + " for more details.<br>Task Name:" + selectedTasks.TaskName + " <br> Task Description: " + selectedTasks.TaskDescription;

                        var client = new SmtpClient();
                        client.EnableSsl = true;
                        client.Send(message);
                    }

                    
                }
            }
            catch (Exception)
            {


            }
        }

   

     
    }
}