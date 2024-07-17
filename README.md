System Resource Monitoring Script
# **Overview**
This shell script monitors the status of your system's RAM and disk usage. It checks if the available RAM is below a specified threshold (200 MB) and if the disk usage exceeds a specified threshold (70%). If either condition is met, it outputs a warning message.
# **Requirements**
\- Bash shell
\- `free` command for checking memory usage
\- `df` command for checking disk usage
\- `awk`, `grep`, `tr`, and `sort` utilities for processing command outputs
# **Usage**
1\. Save the script to a file, for example, `check\_status.sh`.

2\. Make the script executable by running:
> *`chmod +x check\_status.sh`*

3\. Run the script:
> *`./check\_status.sh`*
# **Script Details**
1. **FREE\_RAM**: Retrieves the amount of free RAM in MB using `free -mt`, filtering the "Total" line, and extracting the fourth column.
1. **FREE\_DISK**: Retrieves the highest disk usage percentage from the `df` command output, excluding the "Filesystem|tmpfs" header and the `/boot` filesystem, then selects the highest value.
1. **Conditional Checks**: 
   1. If free RAM is less than or equal to 200 MB, a warning is displayed.
   1. ` `If the highest disk usage percentage is greater than or equal to 70%, a warning is displayed.
   1. ` `Otherwise, it prints that everything is okay, along with the current free RAM and disk usage.
# **Example Output**
``` Warning !!! RAM running low :- 150 M ```
or
``` Warning !!! DISK running low :- 75 % ```
or
\``` All good :)
RAM -> 500 M
DISK -> 45 % ```
# **Adding to Crontab**
To automate the script to run at regular intervals, add it to your crontab:

1\. Open crontab:
> *``` crontab -e ```*

2\. Add the following line to run the script every hour:
> *```0 \* \* \* \* /path/to/check\_status.sh ```*

3\. Save and exit the editor.
