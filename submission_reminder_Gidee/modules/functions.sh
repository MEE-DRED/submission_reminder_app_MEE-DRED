
cat > modules/functions.sh << 'EOF'
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
        echo "Checking submissions in $submissions_file"

	    # Simulating checking submissions
	        if [[ ! -f "$submissions_file" ]]; then
        echo "No submissions found."
    else
	            cat "$submissions_file"
		        fi
		}
