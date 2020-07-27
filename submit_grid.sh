#######  This is an example command to submit to queue quickly (Source: Raghvendra Pappagari, Short example by Sonal)

# Usage: submit_grid.sh <PATH_TO_PYTHON_SCRIPT>

# Note: First edit the virtualenv activation in `pytorch_run.sh`

# The output and logs can  be stored with names as you set, or by default by timestamp


# Check if  virtual environment is edited in pytorch_run.sh, if not, exit
check_env_line=$(sed -n '2p' pytorch_run.sh)
ref_line="conda activate <YOUR_ENV_NAME>"
if [ "$check_env_line" = "$ref_line" ]; then
    echo "ERROR: You haven't activated your anaconda env"
    echo "       install miniconda, edit  <YOUR_ENV_NAME> in the script `pytorch_run.sh`  to your environment name"
    exit 1
fi


TIMESTAMP=`date +"%Y%m%d-%H%M%S"`
out_file="out_"$TIMESTAMP".out" #Change this to  <my_output>.out if you like
log_file="log_"$TIMESTAMP".log" #Change this to  <my_log>.log if you like


# qsub command, you can edit the memory requirements
export qsub_cmd="qsub -cwd -l mem_free=8G,ram_free=8G,gpu=1,hostname=b1[123456789]|c* -q g.q"

#CUDAROOT=/opt/NVIDIA/cuda-9.0
#export PATH=$PATH:$CUDAROOT/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CUDAROOT/lib64

task_file=$@

TIMESTAMP=`date +"%Y%m%d-%H%M%S"`

# Log files,  You can edit this to give a custom name to your logs
out_file="out_"$TIMESTAMP".out"
log_file="log_"$TIMESTAMP".log"


${qsub_cmd}  -e $log_file -o $out_file -l hostname='!b10*&b1*|c*' pytorch_run.sh $task_file
