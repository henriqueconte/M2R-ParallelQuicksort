OUTPUT_DIRECTORY=data/my_laptop
mkdir -p $OUTPUT_DIRECTORY
OUTPUT_FILE=$OUTPUT_DIRECTORY/recent_measurements.txt
OUTPUT_CSV=$OUTPUT_DIRECTORY/recent_measurements.csv

touch $OUTPUT_FILE
for i in 100 1000 10000 100000 1000000; do
    for rep in `seq 1 5`; do
        echo "Size: $i" >> $OUTPUT_FILE;
        ./src/parallelQuicksort $i >> $OUTPUT_FILE;
    done ;
done

perl scripts/csv_quicksort_extractor.pl < $OUTPUT_FILE > $OUTPUT_CSV
