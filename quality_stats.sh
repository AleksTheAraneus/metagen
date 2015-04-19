#!/bin/bash

## QUALITY ASSESSMENT AND TRIMMING

cd ~/Documents/2-06-2014/fastq # folder z sekwencjami w formacie fastq.gz

for file_gz in $( ls | grep .gz ); do
	#echo plik: $file_gz
	gzip -d $file_gz
done

for file in $( ls | grep -v .gz ); do
	#echo ungzipped file: $file
	out_file_name="${file/.fastq/'_stats.txt'}"
	plot_name="${file/.fastq/'_plot.png'}"
	#echo $out_file_name #(echo i/liczba wszystkich plików)
	fastx_quality_stats -i $file -Q 33 -o $out_file_name
	fastq_quality_boxplot_graph.sh -i $out_file_name -o $plot_name -t "$file" #?
	# fastq_quality_filter?
done


#delete unzipped?

exit 0
