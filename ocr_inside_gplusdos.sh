#!/bin/sh

# OCR the article series "Inside G+DOS" (by Stephen Warr)
# from the Format magazine.

# By Marcos Cruz (programandala.net)

# 2016-04-01

time=$(date +%y%m%d%h%m)
output_file=inside_gplusdos_ocred_$time.txt

# XXX OLD -- columns extracted from the gray scale JPEGs -- bad
# results
#
#dir="original/from_jpeg.cropped"
#image_prefix=part
#image_format=png
#psm=6

# Black and white JPEG extracted from the PDFs -- much better result
dir="original/from_pdf"
image_prefix=format
image_format=jpg
psm=3

cd $dir

for part in $(ls -1 $image_prefix*.$image_format)
do
	tesseract $part $part -l eng -psm $psm
done

cat $image_prefix*.$image_format.txt > ../../$output_file
rm -f $image_prefix*.$image_format.txt

cd -

exit 0

