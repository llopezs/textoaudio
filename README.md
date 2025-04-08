# Text to Audio Converter

A Python utility that converts text from various document formats (DOCX, PDF, PPTX) into MP3 audio files.

## Features

- Extracts text from multiple document formats:
  - Microsoft Word (.docx)
  - PDF documents (.pdf)
  - PowerPoint presentations (.pptx)
- Converts extracted text to speech using pyttsx3
- Automatically detects and uses Spanish voice if available
- Processes all supported documents in a directory

## Requirements

- Python 3.6+
- Required packages:
  - pyttsx3
  - python-docx
  - PyPDF2
  - python-pptx

## Installation

```bash
pip install pyttsx3 python-docx PyPDF2 python-pptx
```

## Usage

1. Place your documents in the `in` directory
2. Run the script: `python main.py`
3. Find the generated MP3 files in the `out` directory

## Project Structure

```
textotoaudio/
├── in/                # Input directory for documents
├── out/               # Output directory for MP3 files
├── main.py            # Main script
└── README.md          # This file
```

## GitHub Authentication

To push this project to GitHub, you'll need to set up a Personal Access Token (PAT). Please refer to the detailed guide in [github_pat_guide.md](github_pat_guide.md) for instructions on:

- Creating a GitHub Personal Access Token
- Configuring Git to use your token
- Setting up your repository
- Security best practices

## License

MIT