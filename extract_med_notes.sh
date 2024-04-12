alias python=python3

cd ClinicalNotesICU || exit
python ./scripts/extract_notes.py
python ./scripts/extract_T0.py 
