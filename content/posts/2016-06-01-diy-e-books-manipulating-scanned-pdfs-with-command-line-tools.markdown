---
title: 'DIY e-books: Manipulating scanned PDFs with command-line tools'
author: Nathaniel Raley Woodward
comments: true
date: 2016-06-01
link: https://nrwoodward.wordpress.com/2016/06/01/diy-e-books-manipulating-scanned-pdfs-with-command-line-tools/
slug: diy-e-books-manipulating-scanned-pdfs-with-command-line-tools
wordpress_id: 19
---

The [Memory Dynamics Laboratory](http://sites.utexas.edu/mdl/) is having something of a book club this summer, but the crucial volume was proving difficult to find; it had been out of print for many years and the UT library system only has a single copy! I proudly volunteered to do the hunting-up and ferreting-out because I have at my disposal a skill-set unique to the hyper-stingy tech-savvy long-term student, i.e., time-honored and hard-won methods for coaxing any book I please from the depths of the internet (way too many hyphens going on here). But in this instance, my tricks were _all of them unsuccessful!_  
  
Still, I had taken on the job and had to see it to completion. So I went this morning to the library to use one of [those walk-up overhead scanners I blogged about briefly some 2 years ago](http://blog.nathanielraley.com/2014/01/kic-scanners-and-one-of-lindsays.html). The book in question had 14 chapters, but my advisor already had PDF versions of chapters 7 and 9-14. This meant I ended up scanning about 160 pages: I set it to "black and white" and I angled the v-shaped bed up a bit to prevent cracking the spine. It took me around 25 minutes from the time I first walked up to scan everything (the B&W setting seemed slower than the color and grayscale) which was all then saved directly to a USB drive. I saved it three different ways: a "quick PDF", a "searchable PDF" and as a real-text file, which had sizes 14 MB, 9.7 MB, and 673 KB respectively. The OCR was OK but left out bits of words every few pages; you'd probably be better off with something aftermarket.  
  
OK so at this point I have 4 PDFs: chapters 1-6, chapter 7, chapter 8, and chapters 9-14. However, the preexisting documents where in color/greyscale while the ones I had just scanned were in monochrome. Also, they were both two book-pages to a single PDF page, which was bad. Additionally, there were some scanning artifacts present in all of them (blotches, shadowy places, etc.), though I didn't care too much about that as long as it didn't obscure the text.  
  
Let me now walk you through some free, mostly native command line tools for cleaning up images/pdfs after scanning and for stitching multiple documents of different sizes together into a coherent whole. I will discuss (1) cleaning up the color/white-balance through normalization, (2) splitting 2-page scans into two 1-page scans, (3) cropping/resizing a multi-page document, (4) splitting/concatenating multiple documents; deleting pages, and (5) compressing to reduce file-size. A suite of [ImageMagick scripts written by a guy named Fred](http://www.fmwconcepts.com/imagemagick/textcleaner/) have been developed for this purpose, but I had difficulty getting these to work properly. Understand that none of these tools or techniques are original to me; I simply did the legwork to bring them all into one place, which consisted mostly of sifting through old stackexchange/superuser/askubuntu posts and replies until I found something that worked. I tried MANY such tools and these were the quickest, easiest, lightest-weight, and best overall in terms of output. Note that what follows applies specifically to scanned texts (books, articles, newsprint, documents, receipts, etc.) that one wants preserved as a greyscale/monochrome PDF (black text on a white ground). These techniques are also helpful for prepping a scan for faxing or OCR. They are also pretty basic (you can get really technical with this stuff), but they got the job done for me!  
  


#### Code to Clean, Crop, Cut, Combine, & Compress scanned PDFs

<script src="https://gist.github.com/nathanielraley/29452787d5762670a1dac389479a72f8.js"></script>

We will go through the above code zusammen. At the risk of stating the obvious, I will use the convention "input_file.pdf" for the input file name  and "output_file.pdf" for the output file name; you would do well to change these accordingly.  
  


### Cleaning

`pdfinfo input_file.pdf`  
  
First, I would run pdfinfo on the input PDF file(s) to, well, get info about them (page dimensions, file size, etc). This "pdfinfo" will likely be useful to you later.  
  
`convert input_file.pdf -contrast-stretch 2%x20% output_file.pdf  `
  
Next I use ImageMagick's convert function with the [contrast-stretch operator](http://www.imagemagick.org/Usage/color_mods/#contrast-stretch) in order to set the top 2% darkest pixels to black and the top 20% lightest pixels to white, thus eliminating some of the unpleasant shadowy scan artifacts. Play with these values to achieve your desired look (it may take some tinkering). The more familiar convert operator -normalize is actually just a special case of -contrast-stretch (-normalize = -contrast-stretch 2%x1%). Try that one first; it may be all you need!  
  


### Cropping 
```
pdfcrop --margins "0 -20 0 -20" input_file.pdf  output_file.pdf  
pdfcrop --margins "5 5 5 5" input_file.pdf  output_file.pdf  
```
You can crop your file (both down and up) using running pdfcrop with the --margins operator. The arguments to margins (numbers in quotes) are the number of points you want to crop from the **left, top, right,** and** bottom** of the PDF respectively. Negative values the document down; positive values un-crop the document by the specified number of points, effectively adding a white margin. The first example above has the effect of shaving 20 points off of the left and right sides of your document; the second example adds 5 points of whitespace to all sides of your document. _Nota bene_: if your document contains pages of different sizes, each page will be individually cropped to the specified margins; thus, your pages will still be of different sizes after running this command. There is a way around this, however.  
```  
pdfcrop --bbox "0 0 595 842" input_file.pdf  output_file.pdf  
pdfcrop --bbox "-97.5 -121 497.5 721" input_file.pdf output_file.pdf  
```  
To avoid cropping each page separately, simply specify the size of the "bounding box" for your document using the operator -bbox. The quoted arguments to -bbox are coordinates (x1 y1 x2 y2) which specify the bottom-left (x1 y1) and top-right (x2 y2) corners of the box, thus specifying a global size for the document to which all pages will be cropped. You may have to do a bit of arithmetic to get this right. Your early call to pdfinfo should result in a report of each page's dimensions; if all pages are the same size, then you will only see one dimension given, something like "Page size:    400 x 600 pts". As it is, your document has its bottom-left corner at (0,0) and its top right corner at (400,600).  
Running the first example above on such an input_file.pdf would add a 195 points of whitespace to the top and 242 points of whitespace to the right of your output_file.pdf (595 x 842 is standard A4 paper size: for others [see here](https://www.gnu.org/software/gv/manual/html_node/Paper-Keywords-and-paper-size-in-points.html).) If you wanted to go to A4 with equal margins on all sides, you would do something like the second example above. Bounding boxes smaller than your file will crop down; boxes larger will add margins.  
  


### Cutting & Combining
```
pdftk first.pdf second.pdf third.pdf fourth.pdf cat output output_file.pdf  
```  
If you have a bunch of separate PDFs that you would like to stitch together into a single document, use pdftk. The example above concatenates `first.pdf, second.pdf, third.pdf,` and `fourth.pdf` into a single file (`output_file.pdf`) in that order. You can do this with pdfs of different sizes and qualities, but you may need to go back through some of the previously mentioned commands to get it looking uniform throughout and to crop all pages to the same size.   
 ``` 
pdftk input_file.pdf cat 1-99 101-end no_hundred.pdf  
 ``` 
If you want to get delete a certain page or pages from your PDF, pdftk can do that too! For example, the command above removes page 100 from input_file.pdf and writes it to `no_hundred.pdf` ("end" is understood by pdftk to mean the last page of the document, but of course you are free to specify this as well).  
  


### Compression
```
pdf2ps input_file.pdf output_file.ps  
ps2pdf output_file.ps compressed_file.pdf  
  
pdftops input_file.pdf output_file.ps  
ps2pdf output_file.ps compressed_file.pdf  
```  
There are lots of ways to compress PDF files but for me this was the most bang for the least buck. You simply convert the PDF to a temporary postscirpt file and then convert it back to a PDF. It has worked like a charm for me several times; note though that there are to options given above (using either pdf2ps or pdftops). Start with the top one, but if that doesn't do it then try the bottom. In the present case, it was able to compress my homemade 90 MB down to around 30 MB.   
  
Hope this is useful to someone like me-a-few-days-ago!  
  
  


### Update/Edit (7/11/2016)

  
Here's a quick edit about how to make a non-searchable PDF searchable with linux tools.  
  
First, make sure you have google's [tesseract OCR engine](https://en.wikipedia.org/wiki/Tesseract_(software)) installed  
```
sudo apt-get install tesseract-ocr  
```
Download [pdfsandwich](http://www.tobias-elze.de/pdfsandwich/), cd to the directory containing it, and run  
```
sudo dpkg -i pdfsandwich_0.1.4_amd64.deb  
#(replace _pdfsandwich__... with your file name)  
sudo apt-get -fy install  
```  
Running it is simple: if the `_example.pdf_` to make searchable is in your current directory, do  
pdfsandwich example.pdf  
You will get a file called `_example_ocr.pdf_` with a searchable text layer "sandwiched" on top.   
  
  

