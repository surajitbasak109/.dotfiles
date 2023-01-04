# Pandoc

Markdown is a popular text formatting syntax that are currently used by programmers these days.
Popular sites like github and bitbucket uses markdown for project documentation and various other types of user generated content.
These sites interprets markdown into html, so it can be displayed in browser.
What if we want to convert our markdown into pdf to read it on our pdf viewer?
In that case we need a tool that can be used to convert our markdown into a pdf.
With pandoc you can convert markdown documents to pdf, html, words docx or many other formats.

After installing pandoc we can simply run it from the command line.

__NOTE__: by default, pandoc uses latex to generate pdf documents.
So, if we want to generate pdf documents, we need to install a latex processor first ([list of required latex packages](http://pandoc.org/readme.html#creating-a-pdf)).

To convert a doc.md markdown file into a pdf document, the following command can be used:

```bash
pandoc -s -o doc.pdf doc.md
```

Pandoc is able to merge multiple markdown files into a single pdf document.
To generate a single pdf document out of two markdown files you can use:

```bash
pandoc -s -o doc.pdf part01.md part02.md
```

By default, the page margins in the resulting pdf document are quite large. you can change this by passing a margin parameter:

```bash
pandoc -s -v geometry:margin=1in -o documentation.pdf part01.md part02.md
```

To create html or docx documents you simply have to change the file extension of the target file:

```bash
pandoc -s -o doc.html part01.md part02.md
pandoc -s -o doc.docx part01.md part02.md
```

Sometime the engine throws error that unicode is not supported. For that we can use `xelatex` engine. We also need to install this package using following command:
```bash
sudo apt install texlive-xetex
```
Then we can use that engine when formatting markdown to different format:
```
pandoc -s -o doc.pdf doc.md --pdf-engine=xelatex
```

Sometime the engine will output an error for unsupported unicode. So, for this we can define a font that supports unicode character.

```bash
pandoc -s -o doc.pdf doc.md --pdf-engine=xelatex -V "mainfont:DejaVu Sans" -V "monofont:DejaVu Sans Mono"
```
