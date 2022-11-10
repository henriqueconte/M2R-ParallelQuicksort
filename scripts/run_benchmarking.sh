OUTPUT_DIRECTORY=data/my_laptop
mkdir -p $OUTPUT_DIRECTORY

OUTPUT_SUFFIX=measurements_`date +%R`
OUTPUT_SUFFIX="$( echo "$OUTPUT_SUFFIX" | tr ':' '_' )"

OUTPUT_TXT=$OUTPUT_DIRECTORY/$OUTPUT_SUFFIX.txt
OUTPUT_CSV=$OUTPUT_DIRECTORY/$OUTPUT_SUFFIX.csv

touch $OUTPUT_TXT
for i in 100 1000 10000 100000 500000 1000000 2000000; do
    for rep in `seq 1 10`; do
        echo "Size: $i" >> $OUTPUT_TXT;
        ./src/parallelQuicksort $i >> $OUTPUT_TXT;
    done ;
done

perl scripts/csv_quicksort_extractor.pl < $OUTPUT_TXT > $OUTPUT_CSV
