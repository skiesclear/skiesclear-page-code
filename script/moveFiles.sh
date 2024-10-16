fileDirectories=(
    "D:\\app\\obsidian\\repository\\clearsky\\研究生入门\\DL"
    "D:\\app\\obsidian\\repository\\clearsky\\研究生入门\\RL"
    "D:\\app\\obsidian\\repository\\clearsky\\JAVA"
)
destinationDirectory="D:\\Vue\\blog\\src\\posts"
for fileDirectory in $fileDirectories
do
    cp -r $fileDirectory $destinationDirectory
    bash script/modifyFiles.sh $fileDirectory $destinationDirectory
done