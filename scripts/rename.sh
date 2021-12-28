for file in $(find -L . -type f -name "*hwi*.csv")
do
parent=$(echo $file | sed "s=\(.*/\).*=\1=")
name=$(echo $file | sed "s=.*/\(.*\)=\1=")
renamed=${parent}test_base_reporter_${name}
echo $renamed
git mv "$file" "$renamed"
done