
  

---

  

title: "README"

  

author: "Ronald Oellers"

  

date: "21/12/2021"

  

---

  

  

# Gaffa-tape

  

  

Tools for everyday use (suited as aliases) that make at-least my life easier.

  

---

# Overview

  

-  # [How to make these scripts an alias](#how-to-make-these-scripts-an-alias)

-  # Bash

-  ## Slurmautosubmit

-  [make_slurm_submit_template.sh](#making-the-slurm-submit-template-files)

-  [slurmsubmit_template.sh](#slurmsubmit-template-file)

-  [Submit Folder without user input](#submit-folder-without-user-input)

-  [Submit Folder](#submit-folder)

-  [GetSeqData](#get-sequencing-data)

-  ## Misc

-  [discinfo](#discinfo)

-  [Frequent Zoom Calls](#frequent-zoom-calls)

-  [Refresh the Slurm Que](#refresh-the-slurm-que)

-  [Refresh the personal Slurm Que](#refresh-the-personal-slurm-que)

-  [Slurm info formatted](#slurm-info-nicely-formatted)

-  [Self refreshing Slurm Cluster Info Screen](#refresh-sinfo)

-  [Test Checksums](#test-checksum)

-  [Count Reads in fastqfile](#Get-Count-Reads-in-fastqfile)

-  [Get Sequencing Data](#Get-Sequencing-Data)

-  [Get all filenames](#get-all-filenames)

-  # Python

-  [Rename SRR files to experiment names](#rename-srr-files)

  

# How to make these scripts an alias

This description works on Linux systems (Ubuntu) however if you find out whether it is the same on MacOS or how to do it there, please let me know so I can add that here.

Go to you home directory and open the file: .bash_aliases

Here you can add the aliases that you want to have and define their names. eg:

```

alias que='bash WHEREEVER_YOU_PUT_THIS_GIT/GAFFA-TAPE/code/bash/refresh_slurm_queue.sh'

alias quep='bash WHEREEVER_YOU_PUT_THIS_GIT/GAFFA-TAPE/code/bash/refresh_slurm_queue_personal.sh'

```

Save the changes to this file and afterwards, while still in your home directory execute the following command on the terminal:

```bash

source .bashrc

```

You should now be setup to use any of these scripts as aliases on your terminal by typing the name you assigned to it in your bash_aliases file. From the example above you should be able to type ```que``` and should now see the self-updating Slurm Que.

# Making the Slurm Submit template files

Script that will ask you how many Slurm submit template files you want to create in the current directory.\

**NOTE:** You will have to change the USER in line 8 of the script to your user or to change the path to where you put the slurmsubmit_template.sh also found in this git.

```bash

8. cp /home/USER/Gaffa-tape/code/bash/slurmautosubmit/slurmsubmit_template.sh slurmsubmit_template-$i.sh

```

# Slurmsubmit Template File

This file only serves as a template file to create the Slurm submit template scripts used by the Submit Folder scripts.

  

**NOTE:** Provide the full path to this file on your system in the make_slurm_submit_template.sh script found in this git.

# Submit Folder without user input

This starts the submission of all .sh files in the current directory to the Slurm Cluster.

**NOTE:** This will submit as many jobs as there are script files with 20 Cores and 10 gb per core per job. So only use this if you are sure that your workload is not too much to submit in one go.

# Submit Folder

This starts the submission of all .sh files in the current directory to the Slurm Cluster, promting the User with the following input possibilities:

```

Cores per job:

  

RAM per core (write 6G for 6 gigabytes per core):

  

How many jobs in parallel:

  

which user to monitor (necessary if restricting jobs):

  

do you want to exclude certain nodes? (Y/N):

```

After confirmation of the configuration settings you will be prompted to confirm the submission before all jobs are submitted to the Slurm Que.

**NOTE:** If you input a 0 for the number of jobs in parallel all .sh files in the current directory will be submitted at the same time. Make sure that if you do this you only submit a reasonable amount of jobs as to not take up too much capacity.

# discinfo

Shows you the disc usage and available space on all processing drives

# Frequent Zoom Calls

If you have reoccurring meetings with the same person(s) aka a meeting which uses the same zoom link/id every time, you can make this a short alias to open that zoom meeting from your terminal instead of looking for the invite email.

**NOTE:** You will have to place the zoomlink into the frequent_zoom.sh file as instructed in the file comments.

# Refresh the Slurm Que

A script that will refresh the general Slurm Que every 30 seconds so you can keep an eye on all jobs that are currently running. Press Enter to refresh manually.

# Refresh the personal Slurm Que

This does the same as [Refresh the Slurm Que](#refresh-the-slurm-que) however it only shows you the jobs of the user you specified in the refresh_slurm_queue_personal.sh file. I use this to keep track of my jobs. Press Enter to refresh manually.

# Slurm info nicely formatted

Nicely formatted output from the ```sinfo``` command

# Refresh sinfo

This will show you the nicely formated ```sinfo``` output and refresh it every 30 seconds. Press Enter to refresh manually.

# Test Checksum

You have two files that you would like to check, if they are identical? Or you want get the md5 checksum of the files (yes I forgot to make it also only accept one single file as input). If you want the md5 sum of just a single file just type the filename in the prompt for file 1 and file 2.

# Get all filenames
If you need to get all filenames in a directory eg. as input or for your samplesheet.

# Get Count Reads in fastqfile
This script can give you the number of reads in your .fastq.gz files either for all of them in a folder or for a single one that you specify

# Get Sequencing Data
If you need to make a soft link to your sequencing data directory to run pipelines or analysis

# Rename SRR Files

Script for renameming SRR files downloaded from the GEO database (search at: [https://www.ncbi.nlm.nih.gov/sra/](https://www.ncbi.nlm.nih.gov/sra/)) into a format workable by downstream applications.

  

This makes use of a (,) comma seperated .csv file as a dictionary (format: Experiment Title,SRR accession Number\n xxxxxx,SRRxxxxxx)

  

**The csv file in Excel would look like this:**

| Title | SSR accession Number |

|----------------|--------------|

| Name that you want the file to have afterwards |SRR11403809|
