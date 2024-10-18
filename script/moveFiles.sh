fileDirectories=(
    "D:/app/obsidian/repository/clearsky/研究生入门/DL"
    "D:/app/obsidian/repository/clearsky/研究生入门/RL"
    "D:/app/obsidian/repository/clearsky/JAVA"
    "D:/app/obsidian/repository/clearsky/python"
)
destinationDirectory="D:/Vue/blog/src/posts"
for fileDirectory in "${fileDirectories[@]}"
do
    cp -r $fileDirectory $destinationDirectory
    echo $fileDirectory
    bash script/modifyFiles.sh $fileDirectory $destinationDirectory
done
echo "over"
# cd $destinationDirectory
# find . -type d -name 'assets' -exec rm -r {} \;
# cd -