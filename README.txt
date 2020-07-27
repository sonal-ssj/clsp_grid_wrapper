Usage:
submit_grid.sh <YOUR_PYTHON_SCRIPT>

eg:
`submit_grid.sh test_pytorch.py`

├── submit_grid.sh : Script to submit a python script to the grid
├── pytorch_run.sh : Script that activates virtual environment and gets CUDA stuff
└── test_pytorch.py : Sample script to check if pytorch is installed and uses GPU

Sanity check:
1) Edit your virtualenv name which has pytorch in `pytorch_run.sh`
2) Edit `submit_grid.sh` to change the names of log and output files, else by default they will be named by using TIMESTAMP
3) Run `submit_grid.sh test_pytorch.py`
4) You should get output like follows in `*.out` file.

    Pytorch available?
    True
    Cuda available?
    True
    Success!
