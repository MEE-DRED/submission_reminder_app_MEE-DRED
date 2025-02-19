#!/bin/bash
read -p "Enter your Name:" username;
mkdir submission_reminder_$username
cd submission_reminder_$username

#make the directories
mkdir app
mkdir modules
mkdir assets
mkdir config 

#step 4 create the function on the sub directories

cat > app/reminder.sh << 'EOF'

#!/bin/bash

# Get the script's directory (absolute path)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source environment variables and helper functions
source "$SCRIPT_DIR/../config/config.env"
source "$SCRIPT_DIR/../modules/functions.sh"

# Path to the submissions file
submissions_file="$SCRIPT_DIR/../assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions "$submissions_file"

EOF

cat > modules/functions.sh << 'EOF'

#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
	    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

        # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
	            # Remove leading and trailing whitespace
		            student=$(echo "$student" | xargs)
			            assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOF


cat > assets/submissions.txt << 'EOF'

student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
EOF

cat > config/config.env << 'EOF'
# This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

cat > startup.sh << 'EOF'

#!/bin/bash 
cd app/
./reminder.sh
EOF

chmod +x app/reminder.sh
chmod +x modules/functions.sh
chmod +x assets/submissions.txt
chmod +x startup.sh

./startup.sh

echo "Environment created successfully in the directory : $(pwd)"

