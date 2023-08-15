#!/bin/bash

# 創建一個資料夾來存放結果
output_folder="extracted_files"
mkdir -p $output_folder

# 檢查Tesseract是否安裝
if command -v tesseract &> /dev/null; then
  echo "Tesseract is already installed."
else
  echo "Tesseract is not installed. Installing now..."
  brew install tesseract
fi

# 檢查Poppler是否安裝
if command -v pdftoppm &> /dev/null; then
  echo "Poppler is already installed."
else
  echo "Poppler is not installed. Installing now..."
  brew install poppler
fi

# 檢查正體中文語言包是否安裝
if tesseract --list-langs | grep -q "chi_tra"; then
  echo "Chinese Traditional language pack is already installed."
else
  echo "Chinese Traditional language pack is not installed. Installing now..."
  brew install tesseract-lang
fi

# 尋找當前資料夾中的PDF文件
pdf_files=( *.pdf )
pdf_count=${#pdf_files[@]}

# 選擇PDF文件的路徑
if [ $pdf_count -eq 0 ]; then
  # 如果沒有找到PDF文件，則提示用戶輸入路徑
  echo "No PDF files found in the current directory. Please enter the path to the PDF file:"
  read pdf_path
elif [ $pdf_count -eq 1 ]; then
  # 如果找到一個PDF文件，則自動選擇它
  pdf_path=${pdf_files[0]}
  echo "Using the PDF file found in the current directory: $pdf_path"
else
  # 如果找到多個PDF文件，則提示用戶選擇一個
  echo "Multiple PDF files found in the current directory. Please select one:"
  select pdf_path in "${pdf_files[@]}"; do
    break
  done
fi

# 獲取PDF的總頁數
total_pages=$(pdfinfo $pdf_path | grep Pages: | awk '{print $2}')

# 轉換PDF到PNG圖像（每頁一個）
echo "Converting PDF to images..."
pdftoppm -png $pdf_path $output_folder/output_name

# 使用Tesseract處理圖像並提取文字
echo "Extracting text from images..."
page_count=0
for i in $output_folder/output_name-*.png; do
  tesseract $i ${i%.png} -l chi_tra
  ((page_count++))
  progress=$(echo "scale=2; ($page_count / $total_pages) * 100" | bc)
  echo "Processed page $page_count of $total_pages ($progress% complete)"
done

# 將所有提取的文字合併到一個文件中
echo "Merging extracted text..."
cat $output_folder/output_name-*.txt > $output_folder/extracted_text.txt

# 提示完成
echo "Text extraction complete! See $output_folder/extracted_text.txt."

# 讀取OCR結果並調用Python腳本進行白話解釋
ocr_result=$(cat "$output_folder/extracted_text.txt")
translated_text=$(python "./translate_text.py" "$ocr_result")

# 打印或處理翻譯後的文本
echo "Translated text (white language explanation): $translated_text"
