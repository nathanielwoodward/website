---
author: Nathaniel Raley
comments: true
date: 2014-02-11 
link: https://nrwoodward.wordpress.com/2014/02/11/idea-density-or-teenage-essays-predict-old-age-alzheimers/
slug: idea-density-or-teenage-essays-predict-old-age-alzheimers
title: Idea Density, or, "teenage essays predict old-age Alzheimer's"
wordpress_id: 65
---

Yesterday in the car I caught a couple intriguing snatches of NPR's Radiolab, a program that has been, in my experience, very hit-or-miss (though I guess it's got something for everyone). Anyway, the day's topic was aging and dementia and they were reporting in their pop-sciencey way on findings from the "[Nun Study](http://en.wikipedia.org/wiki/Nun_Study)"---a longitudinal study funded by the National Institute of Aging to examine the onset of Alzheimer's disease in a population of some 700 nuns who have been participating in the study since 1986 (the youngest at the time was 75). This enviable experimental design has yielded several notable findings, but particularly striking--_rubberneckingly double-takingly striking_--was their discovery that the essays these nuns had written upon first taking their monastic vows (mean age: 22 years) had characteristics that correlated with whether or not they developed Alzheimer's disease. Specifically, it was found that an essay's lack of "idea density" or "propositional density" was a significant predictor of this dementia in old age.  
  
To put it more starkly, **roughly 80% of nuns whose essays was found to be lacking in idea density later developed Alzheimer's, while among those whose essays were not lacking only 10% got Alzheimer's**. This huge effect is incredible! These essays were written 50+ years before the onset of symptoms! Furthermore, other measured psycholinguistic constructs, such as grammatical complexity, did not exhibit this relationship. For all their listenability, Jad Abumrad and Robert Krulwich did a lousy job explaining this "idea density" on the air, so I did some poking around online and turned up a couple pertinent articles.  
  
Idea/proposition density is "the number of propositions divided by the number of words," where a proposition is anything in speech that can be true or false. So, for example "The quick brown fox jumps over the lazy dog" has five propositions: (1) quick, (2) brown, (3) jumped, (4) over, (5) lazy. The theory here is that each proposition entails a certain amount of mental processing effort, and high idea density, by packing in the propositions, makes for slower processing by increasing the amount of work the reader must do to understand the text. [Covington (2009)](http://www.ai.uga.edu/caspr/Covington-2009-Idea-Density-paper-SEC09-060.pdf) showed that "popular" texts (e.g., magazines, pulp fiction) and "introductory" texts (addressed to serious nonspecialists) always have an idea density below 0.5, while technical documents are always above 0.5. It is also of note that idea density does not correlate particularly well with lexical diversity or with [Flesch-Kincaid](http://en.wikipedia.org/wiki/Flesch-Kincaid_Readability_Test) level.  
  
Because propositions correspond roughly to verbs, adjectives, prepositions, and subordinating conjunctions, computer programs can calculate idea density with a part-of-speech tagger that counts only true propositions. [CPIDR](http://www.ai.uga.edu/caspr/) is one such program, and it is powerful! It agrees with the consensus of a panel of trained human idea-density raters better than the raters agree with each other (Brown et al., 2008)! It was developed by Michael Covington at the University of Georgia, and while not open source, it is free for non-commercial use. I had to have it!   
  
<center>
![](ideadensity1.png)
</center>  
  
I'm using the newest version, `CPIDR 5.1`, on Windows 7 (there Linux/*nix/Mac is support through [Mono runtime](http://www.mono-project.com/Mono:Runtime)). I dredged a few old essays up from the depths of immemorium and plugged them in to see what I'd find. To my relief and gloating satisfaction, the first one I tried, a freshman-year [humanities essay](http://docs.google.com/viewer?url=http%3A%2F%2Fwww.nathanielraley.com%2Fpascal_essay.doc) (a good five years old, be nice), came in at a density of .553 (+/-0.18), which I'm assuming unequivocally disqualifies me from Alzheimer's. Hah! It's not quite on par with the Bard, though; Lindsay suggested I feed CPIDR an excerpt from [King John](http://www.gutenberg.org/cache/epub/1511/pg1511.html), which she is currently reading. I only pasted a single monologue because having the actors and stage directions would deflate the idea density score. Shakespeare came in extremely high with .583 (but see the 95% confidence intervals... it could just be a small sample). How interesting! What a fun tool! Oh, the research ideas...  
  
FYI, the idea density of this post (including this bit) is 0.515  
  
<center>
![](ideadensity2.png)
</center>
