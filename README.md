# PDF Text Extractor

## English

### Description

This script automates the process of extracting text from a PDF file. It converts the PDF to images, uses Tesseract OCR to extract the text, and translates Traditional Chinese text into plain language using OpenAI's GPT-4. The Chinese Traditional language pack is supported.

### Usage

1. Place the script in the same directory as the PDF file you want to process, or be ready to enter the path to the PDF file.
2. Make the script executable: `chmod +x extract_text.sh`.
3. Run the script: `./extract_text.sh`.
4. Follow the prompts, if any.
5. Extracted and translated text will be saved in a folder named `extracted_files`.

## 日本語

### 説明

このスクリプトは、PDF ファイルからテキストを抽出するプロセスを自動化します。PDF を画像に変換し、Tesseract OCR を使用してテキストを抽出し、OpenAI の GPT-4 を使用して繁体字中国語のテキストを平易な言葉に翻訳します。繁体字中国語の言語パックがサポートされています。

### 使用方法

1. 処理する PDF ファイルと同じディレクトリにスクリプトを配置するか、PDF ファイルへのパスを入力する準備をします。
2. スクリプトを実行可能にします: `chmod +x extract_text.sh`.
3. スクリプトを実行します: `./extract_text.sh`.
4. 必要に応じてプロンプトに従います。
5. 抽出されたテキストと翻訳されたテキストは、`extracted_files`という名前のフォルダに保存されます。

## 中文

### 描述

此腳本自動化從 PDF 文件中提取文本的過程。它將 PDF 轉換為圖像，然後使用 Tesseract OCR 提取文本，並使用 OpenAI 的 GPT-4 將繁體中文文本翻譯成白話。支持繁體中文語言包。

### 使用方法

1. 將腳本放置在要處理的 PDF 文件的同一目錄中，或準備輸入 PDF 文件的路徑。
2. 使腳本可執行：`chmod +x extract_text.sh`.
3. 運行腳本：`./extract_text.sh`.
4. 如有任何提示，請按照提示操作。
5. 提取的文本和翻譯的文本將保存在名為`extracted_files`的文件夾中。
