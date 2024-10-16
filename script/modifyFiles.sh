#!/bin/bash  
  
# 源文件夹  
SOURCE_DIR=$1
# 目标文件夹  
TARGET_DIR=$2 

# 复制文件夹  
cp -r "$SOURCE_DIR" "$TARGET_DIR"  
  
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
          
        # 在临时文件开头添加 YAML 前缀  
        {  
            echo "---"  
            echo "title: $filename_without_extension"  
            echo "---"  
            # 追加原文件内容  
            cat "$file"  
        } > "$temp_file"  
          
        # 用临时文件替换原文件  
        mv "$temp_file" "$file"  
    fi  
done  
' bash {} +