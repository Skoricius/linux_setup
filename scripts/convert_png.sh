mkdir -p png
for f in *.tif
do
        echo "Converting $f"
            convert "$f"  "png/$(basename "$f" .tif).png"
        done
