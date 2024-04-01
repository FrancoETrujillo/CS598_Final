## Original repos

### MIMIC benchmarks

`
git clone https://github.com/YerevaNN/mimic3-benchmarks.git
`

### ClinicalNotesICU

`
git clone https://github.com/kaggarwal/ClinicalNotesICU.git
`

### MultimodalMIMIC

`
git clone https://github.com/XZhang97666/MultimodalMIMIC.git
`

### Env setup

follow https://github.com/YerevaNN/mimic3-benchmarks (use the same env for all following steps)

## Preparing data

### Download Full data

``` shell
# change physionet_username to your username
wget -r -N -c -np --user physionet_username --ask-password https://physionet.org/files/mimiciii/1.4/

# move compressed files to data/MIMICIII_Original
```

### Demo Dataset (Not compressed)

``` shell
wget -r -N -c -np https://physionet.org/files/mimiciii-demo/1.4/
```

### Uncompress Full dataset

``` shell
./decompress_mimic.sh -d data/MIMICIII_Original -o data/mimic3
```

### Build benchmark data

``` shell
./build_benchmark_data.sh
```

### Extract medical notes

#### Install nltk

`
pip install nltk
`

In [ClinicalNotesICU/scripts](ClinicalNotesICU/scripts)
modify [extract_notes.py](ClinicalNotesICU/scripts/extract_notes.py)
and [extract_T0.py](ClinicalNotesICU/scripts/extract_T0.py) to use the correct path for your mimic-benchmarks and
mimic_original_csvs folders

```shell
./extract_med_notes.sh
```


