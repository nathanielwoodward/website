---
title: How many times I "googled it", June 2012 to present
author: Nathaniel Raley
comments: true
date: 2015-04-03
link: https://nrwoodward.wordpress.com/2015/04/03/how-many-times-i-googled-it-june-2012-to-present/
slug: how-many-times-i-googled-it-june-2012-to-present
wordpress_id: 26
---

Today at 4:13 pm I got the urge to google "google search history".  
  

<center>
[![](https://nrwoodward.files.wordpress.com/2015/04/8f387-searched.png)](https://nrwoodward.files.wordpress.com/2015/04/8f387-searched.png)
</center>
  
  
  
  
  
  
I figured that google was keeping all kinds of tabs on me, but at [google.com/searchhistory](http://www.google.com/searchhistory) you can find a nice browsable catalog of everything you've ever searched for while logged into your google account. Many people disabled this feature when they noticed that they were getting targeted ads and personalized search results, but all my ads are blocked and I've never been bothered enough to disable it. If you haven't either, you can access a timestamped list of your entire search history plus a few summary graphs/statistics about your search patterns, such as these:  
  
  

<center>
[![](https://nrwoodward.files.wordpress.com/2015/04/d3a35-hourlydaily.png)](https://nrwoodward.files.wordpress.com/2015/04/d3a35-hourlydaily.png)[![](https://nrwoodward.files.wordpress.com/2015/04/98492-topsites.png)](https://nrwoodward.files.wordpress.com/2015/04/98492-topsites.png)
</center>
  
It appears I like to google things around 8 pm, that there's not a lot of day-to-day variation in my search frequency, and that I usually end up at Wikipedia! Also, counting only the searches I've made while logged into my main google/gmail account, the answer to the titular question is **52,786**. More than fifty thousand searches in less than 3 years, or about 55 searches each day!  
  
I found this out by wading through the calendar applet and manually copying the numbers for each month, but there is certainly some easier way to go about it. I pulled these data into R and generated the following scatterplot:  
  
<center>
![](https://nrwoodward.files.wordpress.com/2015/04/ce794-mygooglesearch.png)
</center>

Crazy! Looks like an almost linear increase which stabilizes around 1760. Indeed, for the last year (Mar 2014-present) the mean number of searches per month was 1766 with a standard deviation of 29.6; contrast this with an overall mean and SD of 1600 and 173, respectively. What caused my linear increase in searches (and why does it appear to have stabilized)?!   
  
Well, the Summer of 2012 came right after I finished my undergraduate degree; indeed, losing access to my college email address led me to set up this gmail account. At first I was doing a lot of travelling (without internet), and then I was in the throes of finding an apartment/moving, working, applying to grad school, and other semistressful things. [My wife](http://www.lindsaywoodward.com/) and I moved to Euless in September 2012 and we shared a computer during this time; we were probably alternately logged in/out of our respective accounts quite regularly (and she has her google tracker disabled).  
  
I have no idea what prompted the large jump in February 2013; AFAIK nothing unusual occurred during this time period. Puzzling...  
  
But then in Fall 2013, after we had moved to Austin, I bought a laptop for myself and have probably been logged into google ever since. Furthermore, I had just started school and was probably consulting the web for course-related things. Still though, I've got no clue why the increase would be so gradual here instead of just one big jump. Is Google messing with me? I'm sure I could comb through my search history and learn something from the kinds of things I was searching for during these various periods of my life, but for now I think I'll leave it at that.   
  
[Here's the R code](https://bitbucket.org/snippets/nraley/L6qa) I used for this in case you're interested. This blog post is brought to you by Google's "Blogger" platform!  
  

