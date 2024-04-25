# CS598 Final Project

In this project, we aim to reproduce the results of the paper "Improving Medical Predictions by Irregular Multimodal
Electronic Health Records Modeling" by Xinlu Zhang, Shiyang Li, Zhiyu Chen, Xifeng Yan, and Linda Petzold.

## Original paper and Repo

Paper: https://arxiv.org/abs/2210.12156

Repo: https://github.com/XZhang97666/MultimodalMIMIC

## About this repo

For this project we have cloned the original repo, [MultimodalMIMIC](https://github.com/XZhang97666/MultimodalMIMIC),
as well as [ClinicalNotesICU](https://github.com/kaggarwal/ClinicalNotesICU)
and [mimic3-benchmarks](https://github.com/YerevaNN/mimic3-benchmarks)
into this repo as modules to use on out Notebook [ProjectNotebook.ipynb](ProjectNotebook.ipynb).

## Project Setup

- Clone this repo
- Install Python 3 if not already installed
- Install Jupyter if not already installed
- Create a virtual environment, we recommend using conda
- Install the required packages using the Requirements.txt file using the following command:

``` shell
pip install -r Requirements.txt
```

- Open [GlobalConfig.py](GlobalConfigs.py) and set the PROJECT_BASE_PATH to point to the root of this project
- Open [ProjectNotebook.ipynb](ProjectNotebook.ipynb), read and edit the variables for paths and credentials as needed.
  These are some of the main configs to set:
  - Set the flags on the **Config tasks to execute** section to enable the downloading, decompressing, and processing
    tasks.
  - Set credentials to physionet on the **Download dataset** section. if intend to download the dataset from the
    notebook.
  - Set the paths to the dataset folders on the **Configuring imports and directories** section (only needed if the
    dataset is not in the default paths from the notebook).

### Reference Folder Structure

```
.
├── ClinicalNotesICU
│   ├── models
│   └── scripts
├── mimic3-benchmarks
│   ├── data
│   │   ├── decompensation
│   │   ├── in-hospital-mortality
│   │   ├── length-of-stay
│   │   ├── multitask
│   │   ├── phenotyping
│   │   └── root
│   │       ├── test_text_fixed
│   │       └── text_fixed
│   ├── mimic3benchmark
│   │   ├── evaluation
│   │   ├── resources
│   │   ├── scripts
│   │   └── tests
│   │       └── resources
│   └── mimic3models
│       ├── decompensation
│       │   └── logistic
│       ├── in_hospital_mortality
│       │   └── logistic
│       ├── keras_models
│       ├── length_of_stay
│       │   └── logistic
│       ├── multitask
│       ├── phenotyping
│       │   └── logistic
│       └── resources
└── MultimodalMIMIC
    ├── Data
    │   ├── ihm
    │   └── irregular
    └── run
        └── TS_Text
```


