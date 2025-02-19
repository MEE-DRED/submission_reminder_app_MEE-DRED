This is a README.sh file for Submissions_reminder_app summative.
It is a script that reminds studets of pending submissions.

#Summary 
I created a command that prompts "Enter your Name" when the script is asked to run, using the  variable $username 
mkdir then creates the directories app modules assets config 
cat > the directory << 'EOF' writes all the source codes of the entire file inside the directory
EOF works as a parenthesis that displays the beginning to end of a particular file
chmod gives permission for execusion of the script.

#Setup instructions
I created a repository (submission_reminder_app_MEE-DRED) and cloned on my terminal using git clone (my token@http)

#Folder structure 
This follows the tree in which I created the directories

submission_reminder_<your_name>/ is a prompt to "Enter your Name". Which means your name was created as a variable using "$". This is to say that each time the script is run, it prompts for a username.
│── app/
│   └── reminder.sh      # This is the main script to check submissions. It contains the environment source and the path to submission
│── modules/
│   └── functions.sh     # This  Function is to read submissions file and output students who have not submitted
│── assets/
│   └── submissions.txt  # This displays the list of students, assignments  and their submissions status
│── config/
│   └── config.env       # Shows the assignment and the days remaining for submission.
│── startup.sh           # This is the main entry point to start the script

#How to run the script 

./create_environment.sh  runs the script
It prompts the user to Enter your Name. (This is possible because I created a promt and a $username variable)
When this is done, it displays your Name, Assignment (Shell Navigation) and Days remaining to submit in this format

#Expected output

Name:"Your Name" (Mercy)
Assignment: Shell Navigation
Days remaining to submit: 2 days
--------------------------------------------
Checking submissions in /assets/submissions.txt
Reminder: Chinemerem has not submitted the Shell Navigation assignment!
Reminder: Divine has not submitted the Shell Navigation assignment!

#Confirm
change directory with username
cd submission_reminder_Mercy
/submission_reminder_app_MEE-DRED/submission_reminder_Mercy#
run  ./startup.sh

#Output
Assignment: Shell Navigation
Days remaining to submit: 2 days
--------------------------------------------
Checking submissions in /submission_reminder_app_MEE-DRED/submission_reminder_Mercy/app/../assets/submissions.txt
Reminder: Chinemerem has not submitted the Shell Navigation assignment!
Reminder: Divine has not submitted the Shell Navigation assignment!
