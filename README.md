# Authors
This watered down script is based on Raghavendra Reddy Pappagari's submission scripts

# Usage
`submit_grid.sh <YOUR_PYTHON_SCRIPT>`

For example, to submit a python script called `test_pytorch.py` to the grid, run
`submit_grid.sh test_pytorch.py`
This will activate the virtual environment as in `pytorch_run.sh` and run a script to check if gpu is being used with pytorch.

# Files and description 
```
.
├── `submit_grid.sh` : Script to submit a python script to the grid
├── `pytorch_run.sh` : Sample script that activates virtual environment with pytorch and gets CUDA stuff
└── `test_pytorch.py` : Sample script to check if pytorch is installed and uses GPU

```

Optional: You can have multiple scripts like
`tensorflow_run.sh` : Script that activates virtual environment with tensorflow and gets CUDA stuff
`keras_run.sh` : Script that activates virtual environment with keras and gets CUDA stuff

# Sanity check run
0) Make sure your python and conda path is set in `~/.bashrc`. Run 
    ```
    source ~/.bashrc
    which python
    which conda
    ```
    This should give the python and conda path you desire to use
1) Edit the name of your virtual environment which has pytorch in `pytorch_run.sh`. This can be done by replacing `<YOUR_ENV_NAME>` in line 2 of `pytorch_run.sh` by something like `my_env`. Now, the `pytorch_run.sh` file must read like
    ```
    # Activate your virtual environment
    conda activate my_env

    CUDA_VISIBLE_DEVICES=`/home/gkumar/scripts/free-gpu` python  "$@"
    ```

2) Edit `submit_grid.sh` to change the names of log and output files, else by default they will be named by using TIMESTAMP. You may also have to change memory requirements in line 26 (`mem_free`, `ram_free`)as per your script's requirement.
    ```
    # qsub command, you can edit the memory requirements
    export qsub_cmd="qsub -cwd -l mem_free=8G,ram_free=8G,gpu=1,hostname=b1[123456789]|c* -q g.q"
    ```
3) Run `submit_grid.sh test_pytorch.py`
4) You should get output like follows in `*.out` file.

    ```
    Pytorch available?
    True
    Cuda available?
    True
    Success!
    ```
