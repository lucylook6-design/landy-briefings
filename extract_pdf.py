#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import sys
import PyPDF2

def extract_pdf_text(pdf_path):
    """提取PDF文件的文本内容"""
    try:
        with open(pdf_path, 'rb') as file:
            pdf_reader = PyPDF2.PdfReader(file)
            text = ""
            for page_num in range(len(pdf_reader.pages)):
                page = pdf_reader.pages[page_num]
                text += f"\n--- 第 {page_num + 1} 页 ---\n"
                text += page.extract_text()
            return text
    except Exception as e:
        return f"错误: {str(e)}"

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("用法: python3 extract_pdf.py <PDF文件路径>")
        sys.exit(1)
    
    pdf_path = sys.argv[1]
    text = extract_pdf_text(pdf_path)
    print(text)
