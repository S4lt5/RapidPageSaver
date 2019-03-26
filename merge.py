from PyPDF2 import PdfFileMerger
from os import listdir
from os.path import isfile, join
import sys
import glob
import os
search_dir = sys.argv[1]
print("Combining all PDFs in %s" % search_dir)

os.chdir(search_dir)
files = filter(os.path.isfile, os.listdir(search_dir))
files = [os.path.join(search_dir, f) for f in files] # add path to each file
files.sort(key=lambda x: os.path.getmtime(x))

print(files);

merger = PdfFileMerger()

for pdf in files:
    merger.append(pdf)

merger.write("result.pdf")