#!/bin/bash

# against which db?
# shuffled?
#1 Ismail WM, Ye Y, Tang H. Gene finding in metatranscriptomic sequences. BMC bioinformatics 2014; 15:S8.
# TODO: install genomeUtils from GitHub repo


# w folderze z plikami .fastq

cd ~/Documents/2-06-2014/fastq
cwd=$pwd

# fasta

for file in $( ls | grep .fastq | grep -v .gz); do
	#echo plik: $file
	fasta_name="${file/.fastq/'.fasta'}"
	tgs_name="${file/.fastq/''}"
	#echo $tgs_name
	fastq_to_fasta -i $file -Q 33 -o $fasta_name
	/usr/local/src/TransGeneScan1.1/run_TransGeneScan.pl -in=$fasta_name -out=$tgs_name

done

echo 'trans_gene_scan is done!'
exit 0


