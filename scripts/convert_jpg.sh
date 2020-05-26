mkdir -p jpg
for f in *.tif
do
        echo "Converting $f"
            convert "$f"  "jpg/$(basename "$f" .tif).jpg"
        done
