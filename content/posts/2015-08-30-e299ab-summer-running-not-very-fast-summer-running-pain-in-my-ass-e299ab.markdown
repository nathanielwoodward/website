---
title: '♫ Summer Running: Not Very Fast! / Summer Running: Pain in my Ass! ♫'
author: Nathaniel Raley 
comments: true
date: 2015-08-30
link: https://nrwoodward.wordpress.com/2015/08/30/%e2%99%ab-summer-running-not-very-fast-summer-running-pain-in-my-ass-%e2%99%ab/
slug: 'summer-running-not-very-fast-summer-running-pain-in-my-ass'
wordpress_id: 21
---

  
Every couple of days I force myself to go outside and run about 2-4 miles. I do not enjoy it. It makes me feel like I am dying _every time_; I gasp and wheeze and, even after showering I stay uncomfortably sweaty for a few hours. Worse still, I do not feel ["energized" or whatever](https://en.wikipedia.org/wiki/Neurobiological_effects_of_physical_exercise#Euphoria) other vital sensations people claim to derive from exercise; if anything, I feel especially fatigued afterwards, and this only gets more pronounced as the day progresses. However, I have convinced myself that [the benefits of cardiovascular exercise](https://en.wikipedia.org/wiki/Cardiorespiratory_fitness) outweigh its many miseries; I will go into my whys and wherefores later and try to convince you too (it could just be that I am an insane person); but to start, I want discuss the 'how' and the 'what'.  
  
I started keeping track of this gruelling ordeal using an android app ([RunKeeper](https://en.wikipedia.org/wiki/RunKeeper)); it uses GPS and links up with Google fit and is a terrible invasion of my privacy that has probably somehow already sent my info to every extant insurance company and devastated my future premiums. Indeed, it's probably also incremented with each new symptom-related google  search ("knees hurt a lot", "gasp and wheeze", "how much sweating is normal" etc). Fact is, information pertaining to my health now exists in the ether, and with supply, demand, and end-user licensing agreements being what they are, someone savvy can get it if they want it badly enough; still though, like [blogger](https://en.wikipedia.org/wiki/Blogger_%28service%29), the app is awfully convenient. I tried a couple others (that didn't look as eager to sell your soul) and found them to be complete shit, functionally. Runkeeper is good at what it does; it currently operates with a freemium model, and evidently if you pay a little you get better stats. I used the basic free version and just manually entered everything into a spreadsheet-- it took less than a half-hour.  
  

<center>
[![](https://nrwoodward.files.wordpress.com/2015/08/df2c5-runhist.png?w=292)](https://nrwoodward.files.wordpress.com/2015/08/df2c5-runhist.png)
</center>

I started running in late March, but I didn't really seriously commit until June (see histogram). Since then, across 44 different running events, I have travelled **103.72 miles** and wasted **13 hours and 22 minutes** doing so. There are two basic routes I would run: a short route (~1.7 miles) and a long route (~3.4 miles).  
  
So far, my average speed on the short run is **7:20/mile** (440 seconds) with a standard deviation of 26 seconds, while my average speed on the long route is **7:45/mile **(464 seconds) with a standard deviation of 20 seconds. On my fastest, I averaged 6:55/mile for 1.7 miles (update 8/30: new best time of 6:48/mile for 1.7 miles). On my slowest, I averaged 8:25/mile for 3.4 miles. Here's a graph showing my improvement over time.  
  

<center>
[![](https://nrwoodward.files.wordpress.com/2015/08/e32f0-running.png?w=400)](https://nrwoodward.files.wordpress.com/2015/08/e32f0-running.png)
</center>
  
Significant improvement over time, which was expected. A more interesting question is whether my improvement was greater for short runs or long runs.   
  
Separate regression equations were fit for both long and short runs:  
 
`$$
AveragePace(Short)= 471.647 - 1.68*(RunOrder) \\
AveragePace(Long)= 506.28 - 1.47*(RunOrder)
$$`


A quick test of differences between slopes would be [this](http://stats.stackexchange.com/questions/55501/test-a-significant-difference-between-two-slope-values):  `$Z = \frac{b1-b2}{\sqrt{(SE_b1)^2+(SE_b2)^2)}}$`
  
This gives: 
```
> (-1.6882- -1.4735)/sqrt(.2348^2+.2595^2)  
[1] -0.6135005  
> pnorm(ans())  
[1] 0.2697727  
```
  
So nope, slopes don't differ.  
  
R-squares were large (.63 and .74, respectively), indicating that a significant amount of the variance in pace measurements are attributable to practice or the passage of time.  Looking at the graph, there appears to have been three pretty precipitous drops in average pace: initially for the short runs, and then again for the short runs after about 30 running events, but the drop in average pace for my long run time occurred just after my 20th running event, and didn't seem to affect the short runs.  I am happy enough with this; without getting into time series or forecasting ([though here's a great tutorial](http://a-little-book-of-r-for-time-series.readthedocs.org/en/latest/src/timeseries.html)), I checked my residual autocorrelations (ACF) and everything looked OK.  
  
  

<center>
[![](https://nrwoodward.files.wordpress.com/2015/08/29e23-dates_running.png?w=600)](https://nrwoodward.files.wordpress.com/2015/08/29e23-dates_running.png)
</center>
  
  
I'm sure I look ridiculous when I run--I wear cut-off jeans, tattered old t-shirts, and my $15 Costco-brand running sneakers. But this is intentional! First, I like the feeling of getting extra use out of my holey old clothes by using them as a running costume. Second, they are positively indecent and wholly unwearable, even to sleep in--out on the block this is another incentive NOT to stop running, indeed not even to slow down!  
  
Why do I do this? Because I am by nature quite sedentary, and evidently this means [I am going to get several diseases](https://en.wikipedia.org/wiki/Sedentary_lifestyle#Health_effects), my brain is going to atrophy, and I will die quite prematurely. Because I am scared of these things happening, I have been following this self-imposed routine of aerobic hell rather sedulously for the past few months. During the school-year I can tell myself convincing stories about how my daily 5-minute bike-rides to and fro the bus-stop really add up: "[surely this is a sufficient amount of exercise](https://en.wikipedia.org/wiki/Active_mobility)". But during the summer, when I can easily remain seated in the same place for the entire day, even these weak rationalizations break down. Running is the easiest means of cardio-ing; you can do it anywhere there's a sidewalk.  
  
Running appears to enhance cognitive performance in healthy individuals.  
[This wikipedia article](https://en.wikipedia.org/wiki/Neurobiological_effects_of_physical_exercise) provides an excellent summary, but I'll talk about a few specific studies below. [Smith et al (2010)](http://journals.lww.com/psychosomaticmedicine/Abstract/2010/04000/Aerobic_Exercise_and_Neurocognitive_Performance__A.2.aspx) analyzed 29 studies that tested the association between neurocognitive performance and aerobic exercise; they found that individuals who had been randomly assigned to aerobic exercise conditions improved in attention, processing speed, executive function, and memory. Here's a PsychologyToday page about [another study](https://www.psychologytoday.com/blog/quilted-science/200912/cardiovascular-fitness-is-linked-intelligence) on the relationship between cardiovascular fitness and intelligence in young adulthood (spoiler: it's very positive).  
  
Not only that, but cardio also appears to be optimal for longevity. [VO2 max](https://en.wikipedia.org/wiki/VO2_max), the gold-standard measure for cardiovascular fitness, is [a good predictor of life expectancy](http://www.ncbi.nlm.nih.gov/pubmed/19454641); the higher it is, the lower your risk of "all cause mortality" and cardiovascular disease. The good news is, [VO2 max is trainable](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3774727/), especially if interval training is used!  
  
This isn't just me showcasing studies that confirm my beliefs--here's an excerpt  about the relationship between exercise and cognitive function from the recent textbook "Memory" by three leaders in the field (Baddeley, Eysenck, and Anderson, 2014):  


<blockquote>"The evidence is much stronger for a positive effect of exercise on maintaining cognitive function. In a typical study, Kramer, Hahn, Cohen, Banich, McAuley, Harrison, et al. (1999) studied 124 sedentary but healthy older adults, randomizing them into two groups. One group received aerobic walking-based exercise, while the control group received toning and stretching exercises. The groups trained for about an hour a day for 3 days a week over a 6-month period. Cognition was measured by a number of tests including task switching, attentional selection, and capacity to inhibit irrelevant information. They found a modest increase in aerobic fitness, together with a clear improvement in cognitive performance. A subsequent meta- analysis of a range of available studies by Colcombe and Kramer (2003) found convincing evidence for a positive impact of aerobic exercise on a range of cognitive tasks, most notably those involving executive processing."</blockquote>

  
  
Honestly though, I feel like the amount of car exhaust I have to breathe on my runs probably greatly offsets any potential gains of cardiovascular exercise. Especially when I read horrifying things about how [even sitting in traffic can cause brain damage](http://www.wsj.com/articles/SB10001424052970203733504577024000381790904) and how living near a busy road [increases the risk of birth defects.](https://en.wikipedia.org/wiki/Motor_vehicle_emissions_and_pregnancy) I sure hope I'm not running right into the very outcomes I intended to run away from!  
  
  
  
_Here's some R-code I used for this post:_  
```
> sd(data1$AvgPace)  
[1] 26.28296  
> sd(data2$AvgPace)  
[1] 20.17638  
> mean(data1$AvgPace)  
[1] 440.1333  
> mean(data2$AvgPace)  
[1] 464.6625  
> summary(fit1)  
  
Call:  
lm(formula = data1$AvgPace ~ data1$Order)  
  
Residuals:  
   Min      1Q  Median      3Q     Max   
-25.918 -10.718  -2.435   9.947  31.418   
  
Coefficients:  
           Estimate Std. Error t value Pr(>|t|)      
(Intercept) 471.6471     5.7739  81.687  < 2e-16 ***  
data1$Order  -1.6882     0.2595  -6.507 8.16e-07 ***  
---  
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1  
  
Residual standard error: 16.33 on 25 degrees of freedom  
Multiple R-squared:  0.6287,    Adjusted R-squared:  0.6139   
F-statistic: 42.34 on 1 and 25 DF,  p-value: 8.157e-07  
  
summary(fit2)  
  
Call:  
lm(formula = data2$AvgPace ~ data2$Order)  
  
Residuals:  
    Min       1Q   Median       3Q      Max   
-15.9043  -7.8003  -0.2513   6.0742  19.6548   
  
Coefficients:  
           Estimate Std. Error t value Pr(>|t|)      
(Intercept) 506.2880     7.1511  70.799  < 2e-16 ***  
data2$Order  -1.4735     0.2348  -6.276 2.04e-05 ***  
---  
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1  
  
Residual standard error: 10.69 on 14 degrees of freedom  
Multiple R-squared:  0.7378,    Adjusted R-squared:  0.719   
F-statistic: 39.39 on 1 and 14 DF,  p-value: 2.036e-05  
  
plot(data$Order,data$AvgPace,col=data$LongShort, main="Average Pace over Time (ordinal)", ylab="Average Pace (seconds)", xlab="Order (1 = first run, 2 = second run, ... , 44 = most recent run)")  
legend('bottomleft', legend = levels(data$LongShort), col = 1:3,  pch = 1)  
abline(lm(data1$AvgPace~data1$Date),col="red")  
abline(lm(data2$AvgPace~data2$Date),col="blue")  
lines(data1$Date,data1$AvgPace,type="l")  
lines(data2$Date,data2$AvgPace,type="l")  
  
plot(Date, AvgPace, t="l", xaxt="n", xlab="")  
axis(1, at=Date, labels=FALSE)  
text(x=seq(1,44,by=1), par("usr")[3]-6.5, labels=labs, adj=1, srt=45, xpd=TRUE)  
  
hist(Month1, xlab="Month (March=3, April=4,...)",main="Logged Running Events per Month",breaks=seq(3,9,1),right=F,labels=T)  
  
par(mfrow=c(2,2))  
plot.ts(res3,ylab="res (AvgPace - SHORT)",main="residual autocorrelation (short runs)")  
abline(0,0)  
Acf(res3)  
plot(res4,ylab="res (AvgPace - LONG)",main="residual autocorrelation (long runs)")  
abline(0,0)  
Acf(res4)
```