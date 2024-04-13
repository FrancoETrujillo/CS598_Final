#!/bin/zsh

alias python=python3

cd mimic3-benchmarks || exit

DECOMPRESSED_DATA_PATH="../data/mimic3/"
MIMIC_BENCHMARKS_DATA_PATH="data/root/"
script_start=$SECONDS

start=$SECONDS
python -W ignore -m mimic3benchmark.scripts.extract_subjects $DECOMPRESSED_DATA_PATH $MIMIC_BENCHMARKS_DATA_PATH
end=$SECONDS
duration=$(( end - start ))
echo "extract_subjects took $((duration / 3600)) hours $(((duration / 60) % 60)) minutes $((duration % 60)) seconds."
start=$SECONDS

python -W ignore  -m mimic3benchmark.scripts.validate_events $MIMIC_BENCHMARKS_DATA_PATH
end=$SECONDS
duration=$(( end - start ))
echo "validate_events took $((duration / 3600)) hours $(((duration / 60) % 60)) minutes $((duration % 60)) seconds."

start=$SECONDS
python -W ignore  -m mimic3benchmark.scripts.extract_episodes_from_subjects $MIMIC_BENCHMARKS_DATA_PATH
end=$SECONDS
duration=$(( end - start ))
echo "extract_episodes_from_subjects took $((duration / 3600)) hours $(((duration / 60) % 60)) minutes $((duration % 60)) seconds."

start=$SECONDS
python -W ignore  -m mimic3benchmark.scripts.split_train_and_test $MIMIC_BENCHMARKS_DATA_PATH
end=$SECONDS
duration=$(( end - start ))
echo "split_train_and_test took $((duration / 3600)) hours $(((duration / 60) % 60)) minutes $((duration % 60)) seconds."

start=$SECONDS
python -W ignore  -m mimic3benchmark.scripts.create_in_hospital_mortality $MIMIC_BENCHMARKS_DATA_PATH data/in-hospital-mortality/
end=$SECONDS
duration=$(( end - start ))
echo "create_in_hospital_mortality took $((duration / 3600)) hours $(((duration / 60) % 60)) minutes $((duration % 60)) seconds."

# start=$SECONDS
# python -W ignore  -m mimic3benchmark.scripts.create_decompensation $MIMIC_BENCHMARKS_DATA_PATH data/decompensation/
# end=$SECONDS
# duration=$(( end - start ))
# echo "create_decompensation took $((duration / 3600)) hours $(((duration / 60) % 60)) minutes $((duration % 60)) seconds."

# start=$SECONDS
# python -W ignore  -m mimic3benchmark.scripts.create_length_of_stay $MIMIC_BENCHMARKS_DATA_PATH data/length-of-stay/
# end=$SECONDS
# duration=$(( end - start ))
# echo "create_length_of_stay took $((duration / 3600)) hours $(((duration / 60) % 60)) minutes $((duration % 60)) seconds."

start=$SECONDS
python -W ignore  -m mimic3benchmark.scripts.create_phenotyping $MIMIC_BENCHMARKS_DATA_PATH data/phenotyping/
end=$SECONDS
duration=$(( end - start ))
echo "create_phenotyping took $((duration / 3600)) hours $(((duration / 60) % 60)) minutes $((duration % 60)) seconds."

# start=$SECONDS
# python -W ignore  -m mimic3benchmark.scripts.create_multitask $MIMIC_BENCHMARKS_DATA_PATH data/multitask/
# end=$SECONDS
# duration=$(( end - start ))
# echo "create_multitask took $((duration / 3600)) hours $(((duration / 60) % 60)) minutes $((duration % 60)) seconds."

script_end=$SECONDS
total_duration=$(( script_end - script_start ))
echo "Total execution time: $((total_duration / 3600)) hours $(((total_duration / 60) % 60)) minutes $((total_duration % 60)) seconds."
