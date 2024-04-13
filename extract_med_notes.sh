alias python=python3

cd ClinicalNotesICU || exit
python -m nltk.downloader punkt
python -W ignore  ./scripts/extract_notes.py
python -W ignore ./scripts/extract_T0.py 
