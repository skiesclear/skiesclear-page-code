#!/bin/bash    
  
# 源文件夹    
SOURCE_DIR=$1  
# 目标文件夹    
TARGET_DIR=$2   
  
# 复制文件夹    
cp -r "$SOURCE_DIR" "$TARGET_DIR"    
echo $TARGET_DIR
  
# 遍历目标文件夹下的所有文件并进行修改    
find "$TARGET_DIR" -type f -exec bash -c '    
for file; do    
    filename=$(basename -- "$file")    
    extension="${filename##*.}"    
    filename_without_extension="${filename%.*}"    
    
    # 如果文件不是目录且不是二进制文件（这里简单判断，可以根据需要调整）    
    if [[ ! -d "$file" && "$extension" != "exe" && "$extension" != "bin" && "$extension" != "o" && "$extension" != "a" && "$extension" != "out" ]]; then    
        # 创建一个临时文件来存储修改后的内容    
        temp_file=$(mktemp)    
          
        # 首先，在临时文件开头添加 YAML 前缀（如果需要）  
        {    
            echo "---"    
            echo "title: \"$filename_without_extension\""    
            echo "---"    
            # 读取原文件内容，并通过 sed 替换图像链接格式  
            # sed -E "s/!\\[.*\\]\\(assets\\/images\\/([^)]+)\\)/!\\[\\]\\(\\/assets\\/images\\/\\1\\)/g" "$file"  
        } > "$temp_file"   
          
        # 追加原文件中除图像链接修改外的其他内容（如果原脚本中有额外处理，可以在这里添加）  
        # 注意：由于我们已经用 sed 处理了图像链接，这一步通常是多余的，除非有额外内容需要添加  
        # 如果确实需要追加原文件内容（且不在 sed 处理范围内），可以取消以下行的注释  
        cat "$file" >> "$temp_file" # 但这样做会覆盖 sed 的修改，所以通常不需要  
  
        # 注意：上面的 sed 命令已经直接修改了内容并输出到了 temp_file，所以不需要再追加原文件内容  
  
        # 用临时文件替换原文件    
        mv "$temp_file" "$file"    
    fi    
done    
' bash {} +