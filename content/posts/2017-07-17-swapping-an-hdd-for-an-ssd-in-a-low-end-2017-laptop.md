---
title: Swapping an HDD for an SSD in a Low-End 2017 Laptop
author: Nathaniel Raley Woodward
date: '2017-07-17'
slug: swapping-an-hdd-for-an-ssd-in-a-low-end-2017-laptop
categories: []
tags: []
output:
  blogdown:html
---
In less than two day's time, I was able to purchase my third computer from a perfect-craigslist-stranger (without issue!) and replace the hard disk with a solid state drive, and I wanted to take a minute to document the experience here; if you are interested only in a rough guide for SSD installation for a 2017 HP laptop, you are heartily encouraged to skip down several paragraphs.  
  
The computer in question is an [HP 15-ba113cl ](https://support.hp.com/si-en/document/c05300932)that the original owner bought in February 2017 from our local Costco for around $400. It has an AMD (a first, for me) A10-9600P processor, 12GB DDR4 RAM, a 1TB HDD, and a touchscreen (another first). It came with Windows 10 Home and, horror of horrors, a heaping pile of HP bloatware. My wife's undergrad laptop was an HP and it was riddled with problems from the outset (including a failed sound card) and, three years or so in--once it realized it was safely outside the warranty window--it proceeded forthwith to give up the ghost. Ever since this harrowing  experience I have been extremely leery of the brand, and my wife still refuses to have anything to do with it (we have wisely turned away several free heirloom printers).  


  


Thus, I wouldn't have considered purchasing such a product unless the thing came at quite a deal, and this it did: I ended up getting a months-old computer (albeit very low-end) for $150. Now, our desktop computer used to get quite a bit of use, but it began its slow slide into senescence a couple years ago and now it operates at such an unbearable crawl that it's main purpose has become that of an external storage tower for our laptops. Its components date back to 2005 or so: I acquired it in 2007 from a guy in Portland who had built it, but the sole hard disk is well over 10 years old and has thus been liable to give out any minute for the past seven years or so (don't worry, we are not complete idiots and thus use other more modern forms of backup).

  


My own personal laptop has been, and continues to be, a champion in spite of its age. It is a Lenovo ThinkPad T430s (2012) with a 3rd generation Intel i7 chip, 16GB DDR3 RAM, a 128GB SSD, and a 500GB HDD that I can swap out with an optical drive, an extra battery, etc. using a caddy (see end of post). I got it in October, 2013 from a local Austinite businessman and I have used it virtually every day since. It came with Windows 7 on the SSD; I kept it, but shrunk the partition and added a bigger one for Ubuntu LTS, which I use almost exclusively, only booting Windows to use very specific MS-only software. 

  


Initially I was going to replace the old desktop with a brand new low-end desktop [like so](https://www.amazon.com/dp/B071DM6TWM/), but, given that my laptop is now five years old and has a few portability issues as it is (bad battery, no camera, dim screen) while still remaining super powerful withal, it occurred to me that a more sensible way forward perhaps lies in making the ThinkPad the new "home computer" and desk-top successor: I could just hook it up to the big monitor and all would be well. Several considerations recommended this route: the ThinkPad has more than enough power to run the Adobe software that my wife uses (Lightroom, Illustrator), plus some of the 3D graphics stuff I've been tinkering with of late. Furthermore, it has that [expansion bay](https://en.wikipedia.org/wiki/Thinkpad_UltraBay) I mentioned, which makes swapping HDDs easy. Thus, I could use them for extra back-up storage, etc. This idea solidified when I found the cheap HP-15 with the 1TB HDD; I could take that sucker out, swap it for a SSD, and use it as needed for relatively long-term storage. 

  


So, back to the new HP. When I got the thing home and turned it on, it took over 60 seconds to fully boot up; then, all of the HP crapware and Windows 10 utilities proceeded to kick on, forcing me to wait still longer. Have you, dear reader, experienced the pain of booting an OS on an HDD after becoming well used to a snappy SDD? If you haven't, just know that it is unbearable. I imagine it's something akin to what business executives must feel when they arrive at the country club and trade their sports cars for golf carts. I suspected the perceived slow-down was the HDD, but just for fun I wanted to benchmark the computer so I could compare it to my ThinkPad. I created a Ubuntu LTS partition and installed the hardinfo benchmarking tool. See results below, and please pardon the lousy picture!

  

<center>
[![](https://nrwoodward.files.wordpress.com/2017/07/f2f5d-file_007.jpeg?w=300)](https://nrwoodward.files.wordpress.com/2017/07/f2f5d-file_007.jpeg)
</center>
  


Hardinfo generates a full system report, which includes putting your CPU through the paces with 6 different benchmarking tests: things like how long it takes you computer to perform various (mostly recursive and therefore single-threaded) computational tasks on integer and floating-point numbers (e.g., calculating the 42nd [Fibonacci number](https://en.wikipedia.org/wiki/Fibonacci_number) [267914296], doing a [Fast Fourier Transform](https://en.wikipedia.org/wiki/Fast_Fourier_transform#Algorithms), or finding solutions to the [N-Queens](http://groups.csail.mit.edu/cag/raw/benchmark/suites/nqueens/README.html) [placing n Queens on an n*n chessboard such that no two threaten each other, which I think bruteforces (n*n Choose n) possible solutions]). I can't find very much out about each of these specific benchmark tasks, but I don't care that much: feel free to have a look around [their github page](https://github.com/lpereira/hardinfo/) for source, etc. The basic processor specs for the two contenders are as follows.

  


The 2017 HP: [4x AMD A10-9600P](http://cpuboss.com/cpu/AMD-A10-7th-Gen-A10-9600P) (2.4 GHz, up to 3.3 GHz, 2 MB L2 cache)

The 2012 Lenovo: 2x [Intel i7-3520M](http://cpuboss.com/cpu/Intel-Core-i7-3520M?q=Intel%20Core%20i7%203520M&ts=1500312575919) (2.9 GHz, up to 3.6 Ghz, 1 MB L2 cache)  


  


Turns out that the 5-year-old ThinkPad outperforms every step of the way! Still though, not too different on the whole. The new machine should be perfectly capable of handling most any task that I would reasonably need it for. But that HDD had to go immediately. Here's how I got it out: first, locate your laptop's maintenance guide, which will serve as a crude roadmap (chances are you are voiding your warranty the minute you lay hands on a screwdriver, so be forewarned). The maintenance guide for this computer, for example, was found [here](http://h10032.www1.hp.com/ctg/Manual/c05227786), though the subsequent steps are probably general enough regardless of what kind of laptop you have.   
  
First, power the laptop down, unplug it, and remove the battery. Give it a few discretionary minutes to cool down. Turn it upside-down and remove all screws from the back (including the two under the rubber feet, which you must first peel off). On this particular computer, there should be 12 screws total: be delicate and try your best not to strip them.  
  
Next, remove the optical drive. Then, take a thin plastic object to serve as a shim (I used the lid of a ballpoint pen). Don't use a flathead screwdriver or anything metal, or else you will wind up with scratches all over your case. We are trying to remove the plastic bottom from the rest of the computer, so gently wedge the plastic shim between where the bottom connects to the keyboard surface. I found this easiest to do near where the optical drive had been, around the USB ports. This is delicate work, so take care you don't stress-fracture the piece of shit plastic case. Once you get your shim in there and get some purchase, work it all the way around the computer gently,_ doing the front first. _The case will effectively unzip: note the little four little rectangular snaps along the edge of the case in the left side of the picture below, where the optical drive used to be. These little snaps go all the way around, and it is these we are essaying to unzip.  


  

<center>
[![](https://nrwoodward.files.wordpress.com/2017/07/ae067-file_003.jpeg?w=300)](https://nrwoodward.files.wordpress.com/2017/07/ae067-file_003.jpeg)
</center>
  
Once you have freed it, remove the bottom and set it aside: you should see something like this  
  

<center>
[![](https://nrwoodward.files.wordpress.com/2017/07/a2acb-file_004.jpeg?w=300)](https://nrwoodward.files.wordpress.com/2017/07/a2acb-file_004.jpeg)
</center>
  
Needless to say, try your best to avoid getting dust, pet hair, etc. into the guts. Your HDD is (on this computer) in the bottom left-hand corner. It will be screwed into mounting brackets (or perhaps a rubber gasket), which will in turn be screwed onto the computer. Remove the screws that hold the drive to the computer and gently unplug the SATA connection. Set drive gently aside, perhaps in an anti-static bag.  
  

<center>
[![](https://nrwoodward.files.wordpress.com/2017/07/0bb70-file_002.jpeg?w=300)](https://nrwoodward.files.wordpress.com/2017/07/0bb70-file_002.jpeg)
</center>
  
Then--unless you have an SSD lying around--get on Amazon Prime Now, order an SSD (I recommend SanDisk products as you will see below, but there are many viable alternatives; I used [this particular drive](https://www.amazon.com/dp/B01F9G414U/ref=twister_B01FVDTA0G?_encoding=UTF8&psc=1)), and wait for free 2-hour delivery! Then unscrew the mounting brackets from your HDD and, noting their arrangement, reattach them in the same way to your new SSD.  
  

<center>
[![](https://nrwoodward.files.wordpress.com/2017/07/db107-file_001.jpeg?w=300)](https://nrwoodward.files.wordpress.com/2017/07/db107-file_001.jpeg)
</center>
  
Now plug in your SATA cable and remount the drive to the computer's HDD housing.  
  

<center>
[![](https://nrwoodward.files.wordpress.com/2017/07/516f4-file_000.jpeg?w=300)](https://nrwoodward.files.wordpress.com/2017/07/516f4-file_000.jpeg)
</center>
  


 And you're set! Put the case back on, snap all the little snaps back best as you can, and screw everything back into place (except for the optical drive screw: the left of the two screws in the middle row; clearly it must stay out until you reinsert your drive). Voila! The OS boots up in 20 seconds now, which is less than a third of the time it took the HDD.  
  
The 1TB HDD that came stock with the laptop was actually a name brand (Western Digital blue) so it is probably not too bad. Here it is inside my little optical bay caddy (this is what I use to switch between computers for backups).  
  

<center>
[![](https://nrwoodward.files.wordpress.com/2017/07/d786f-file_000.jpeg?w=300)](https://nrwoodward.files.wordpress.com/2017/07/d786f-file_000.jpeg)
</center>
  


You can pick up a [caddy like this](https://www.amazon.com/Adapter-Optical-MacBook-SuperDrive-Replacement/dp/B01I15ZVKY/) for about $10, but make sure your computer is compatible with such a set-up (most modern laptops should be, but you never know).  
  
Finally, the reason I'm plugging SanDisk is that I just had a 128 GB USB drive fart out on me after just over a year (and after very little use). It got irreparably locked into read-only, and try as a might to reset and reformat (and I spent over an hour in the attempt), no dice. But as it turns out, the thing has a 5 year warranty! I got on their website and submitted my issue and product information (including a screenshot of my online purchase confirmation); they promptly emailed me a paid USPS packing slip and told me to mail it in, and that I would receive a replacement. That's pretty good customer service for a bloody thumbdrive, what?  
