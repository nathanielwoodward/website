---
author: Nathaniel Raley
comments: true
date: 2014-07-13 
link: https://nrwoodward.wordpress.com/2014/07/13/the-math-of-secrecy-rsa-cryptography-and-shapes-you-can-draw/
slug: the-math-of-secrecy-rsa-cryptography-and-shapes-you-can-draw
title: 'The Math of Secrecy: RSA Cryptography (and Shapes You Can Draw!)'
wordpress_id: 35
---

When [Gauss](https://en.wikipedia.org/wiki/Carl_Friedrich_Gauss) was 19, he discovered that of the infinite number of polygons that have a prime number of sides, a mere five of them can be [constructed](https://en.wikipedia.org/wiki/Constructible_polygon) with a ruler and compass (i.e., [using only straight lines and circles](https://en.wikipedia.org/wiki/Compass-and-straightedge_construction)). These prime-sided polygons can have 3, 5, 17, 257, or 65537 sides, but only these five are possible (probably).  
  


[![](https://nrwoodward.files.wordpress.com/2014/07/064f5-pentagon.gif)](https://nrwoodward.files.wordpress.com/2014/07/064f5-pentagon.gif)

  
Indeed, the only shapes you can draw with an odd number of equal-length sides are the multiples of these 5 primes: 3, 5, 15, 17, 51, 85,..., 4294967295  
(_amazingly, all constructable polygons must have a number of sides that is a multiple of a Fermat prime and a power of 2!_). There are [good reasons](http://mathworld.wolfram.com/TrigonometryAngles.html) why this is true, but they are confusing and would belabor this post.  
  
Apparently, Gauss was so happy with his finding that he requested a regular [heptadecagon](https://en.wikipedia.org/wiki/Heptadecagon) on his tombstone; the stonemason declined, stating that it would essentially look like a circle. After watching the requisite process below, one begins to sympathize with the stonemason ([diligent wikipedian Aldoaldoz](https://commons.wikimedia.org/wiki/User:Aldoaldoz) made both of these; in case you want to build your own 17-gon, you can break out the compass and follow along at home). It's hypnotically beautiful, but the .gif alone is 462 frames and takes a full 1:26 to watch...  
  


[![](https://nrwoodward.files.wordpress.com/2014/07/e8377-17gon.gif)](https://nrwoodward.files.wordpress.com/2014/07/e8377-17gon.gif)

  
These strange numbers are known as [Fermat primes](https://en.wikipedia.org/wiki/Fermat_prime), and take the form `$2^{2n}+1$`. Though there are infinitely many numbers of this form, only the first 5 (above) are prime (the sixth is `$2^{2(5)}+1=1025 $`). As I was reading about these yesterday, I found that they have an important application in the most common form of public-key cryptosystems, whereby messages are encoded so as to conceal their meaning.  
  
This method of encryption is used to secure electronic communication over the internet; even if a third party somehow manages to nab your encrypted message, it will be almost impossible for them to crack it. If you've used SSH, SSL/HTTPS, PGP, or had to verify a digital signature, you've used [RSA encryption](https://en.wikipedia.org/wiki/RSA_encryption) or one of its descendants.  
  
On personal websites, you may have run into these before:  
  

    
    <code>-----BEGIN PGP PUBLIC KEY BLOCK-----<br></br>Version: GnuPG v1.4.11 (GNU/Linux)<br></br><br></br>mQENBFPCyXEBCACuHid62W3FI3DegXw3G6Xyjdj3SBl3+f/fBNIN4Yrx0auPjuZG<br></br>TqtA6opOH7jzAEBdBBysiQ+1frQlfiWlmdzJ/GQR7KGhuZNx33pyCwXV85bcKtno<br></br>A4CQK8r2sfrRF796voNWxW/MaStT7IWQfHrMYsgcl+7cZogBu/nl3nnHuZz+oMMG<br></br>ZZl+uziKF1+M4naOr6gH3UMTECk2Xib2lk58RFN4pmqPzbWG5gUU5ugN13c6hO7S<br></br>eKN/cbGSHRHPQci0aZo743rIoWgQZ+S88j3BweGFbD78tw5UYJUW+rnyYISzDbVi<br></br>R+i8luzVtVhkHZnetcQoz6IBsDyfnK0dKMLhABEBAAG0K05hdGhhbmllbCBSYWxl<br></br>eSA8bmF0aGFuaWVsLnJhbGV5QGdtYWlsLmNvbT6JATgEEwECACIFAlPCyXECGwMG<br></br>CwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEH4levi+sCboeHoH/3IyNGGwxVWy<br></br>VVnjKj2vpbgysU4W4xieL9sWvMBFnKDhpHZsazBEhXnmhEbDouixZaFeMmul8C7J<br></br>2/5Ljync/fkPCKtyF+Ibovs3ALuHnY4Iu8vukxMbr7cmB1lOkVGxHIKcjGX4H9F7<br></br>6qnGYmJWpz+pgYIbq5xO07aCcwE9/EUQwh0MdDml0euRiDWio1HOM7XTVJJ7AmyX<br></br>MKroqF+Ik/93mSl4vGlKKqDhPr3hcxqFsE8LhHgMxeI2NGomhka064mwWqRpFf0f<br></br>ce33cWaFSgl+rRAqkQkZUdiMnbIj9P89OH/PqOQgaB/nXIVXmjMb6HluhJA/2ZnM<br></br>h+Y8e0pF2j+5AQ0EU8LJcQEIAK38D6Bnho1cennrFOVcCj1nmlG4UW9mWr2ox+WJ<br></br>QBEqw8IUsWg/0LEe5K3MPoOE3lO3VTHnKqLMJSbA9byjSwYxIE3Y1QoY1Uq43Da1<br></br>sYkeETVkMgnAGmIwSQgsdfdAGhXv5uF/Ck3O+QMdUW5qZ4s+WXUCMWcj4ZgomUxC<br></br>i0bQgE/w/TDc0JAisma2oOuOTVjpfyX5VCk6XtwmDxE+STHZTCIKvSnyodx3Hlke<br></br>1gr+f/ejpbAnYiyjjWpiQGS47YCjAzGAsn0CRJ4dQYsjv6RVL/O/EYEJDUs49cLW<br></br>ccYhj0BQZyeMqWxZqP8ZUIGsoPfzh/ahLNXnxlqVTD53eA8AEQEAAYkBHwQYAQIA<br></br>CQUCU8LJcQIbDAAKCRB+JXr4vrAm6OFPB/9P4GkEV+XpejL4TO17Sh7vj3nZvKxd<br></br>AoPKKG1qbJNuYqasz0d5C0hfZN4aLaKdiWide9sIMfjRrG1gbN8o34uR3i3887Eg<br></br>zrhZWS/E01jGqR4ey/iACyfXvDfEFEwthfChyS9qQVYw7fWWSBtpZqJ5iul7Jf7b<br></br>tHPeqizK2FqOSnJy9ovaHHcZL4Wt26Y+IDWq0WQKB89guhN6LhlaQQXrAhlbwW2N<br></br>DcvTrHm3g4sVxeuAujGJzJGRmf5hkV+YxG2OrpLQjx+n4XsZSFO3tdfNwTwDn1Xj<br></br>9AFqGhRzm9j1Cq3iqcTbJtQwwJknkNm7CLFeHuy4zurzP3gmwnRvZ2UM<br></br>=X1Q+<br></br>-----END PGP PUBLIC KEY BLOCK-----<br></br></code>

  
To the untrained eye someone's cat has been traipsing about on their keyboard, but in reality this string of characters represents two (big, random) numbers that allow you to communicate with it's provider in a completely secure fashion. It is a _"public key"_ and is used to encrypt messages sent to its owner; it has a mathematically precise twin, a _"private key"_ which only the owner has access to. This private key is required to decode the message originally encoded by the public key.  
  
For an extremely helpful analogy, consider a padlock. A public key can be thought of as an open padlock and a private key is the key that can unlock it once it is closed. In public key cryptosystems, you give your close friends copies of your personal padlock, open and unlocked (this is your public key). They can now send you messages securely by locking them in a box using your padlock (i.e., encrypting it with your public key) and sending it to you, because only you have the key (the private key) which can open it. Note that your friends don't need a key to close the padlock: they simply put their message in the box and shut the padlock.   
  
How does this work mathematically? Here's a technically correct but very basic run-through of RSA for didactic purposes:   
  
Let's say you want to communicate privately with another party. They're going to send you a secret message (message: "PRIVATE") over the internet, and they want to be sure that no one else can read it. In order to do so, they can encrypt this message using your public key and send it to you; you can then use your private key to decrypt and read it.  
  
Let's assume you haven't yet generated public/private keys, and you want to do so by hand:  
  
* _STEP 1_  
Choose a pair of prime numbers,** p** and **q**, at random.  
To keep the math reasonable, let's take **p**=3 and **q**=17  
  
* _STEP 2_  
Multiply **p** and **q** together to get their product **n**.  
Here `$n = 3 \times 17 = 51$` (This is the step that is hard to reverse in practice!)  
  
* _STEP 3_  
Multiply `$(q-1) \times (p-1)$` to get the totient of n, `$\phi(n)$`
`$ \phi(n)= (3-1) \times (17-1) = (2) \times (16) = 32 $`
  
* _STEP 4_  
For the first key, choose any number **e** that is smaller than `$\phi(n)$` and has no common factors with `$\phi(n)$`. **Since `$\phi(n)=32$`, we can choose any number besides 1, 2, 4, 8, 16, and 32.   
Lets pick **e** =11.  
  
* _STEP 5_  
Finally, the matching key **d** must be computed. This is achieved by taking the inverse of *e* [modulo](https://en.wikipedia.org/wiki/Modular_arithmetic) `$\phi(n)$`. All this means is that we need to find the number **d** to  multiply **e**= 11 by so that when we divide their product by `$\phi(n)$=32`, we get a  remainder of 1. This isn't as hard as it sounds: `$\phi(n)=32$`, and `$e=11$`. Since 11 x 3 = 33, and 33 divided by 32 leaves a remainder of 1, we know that the **d**, "the inverse of 11 modulo 32" , equals **3**.  
  
These keys **e**=11 and **d**=3 are mathematically linked through **n**=51, because   
if you take the number you want to encrypt to the power of **e** and divide by **n**, you get a remainder. _This remainder the encrypted version of your original number_. To decode it, just raise it to power of **d** and divide by **n**.  
  
As quick example, say the secret message you want to send is the number 4. To encrypt it using our public key (**e**=11, **n**=51), do the following (with "mod" being the modulo operator):
  
`$4^{11}\mod 51 = 4194304 \mod 51 = 13$`
  
The number 13 is our encrypted message, which can only be unlocked if you have the private key (**d**=3, **n**=51). The same procedure used to encrypt is used to decrypt, but take 13 to the power of **d** and find the remainder when dividing by 51.  
  
`$13^{3} \mod 51 = 2197\mod 51= 4$`, our original message  
  
Without factoring **n** = 51, you can't easily compute `$\phi(n)=32$` and thus knowing one key, you can't easily compute the other.  
  
  
  
But how do we send the secret message "PRIVATE"? First you should get a numerical representation of this message;  commonly, a much longer messages is being sent and it is converted from  [ASCII](https://en.wikipedia.org/wiki/ASCII#ASCII_printable_code_chart) to its decimal representation. For now, we can just take the  number that corresponds to each letter's position in the alphabet, (A=1,  B=2,..., Z=26). Doing so for this message yields "16 18 9 22 1 20 5".  
  
To encrypt our message ("16 18 9 22 1 20 5") using one of the keys (now therefore the public key), we repeat the process used above for the number 4, but now we use it on each of the numbers in our numeric code:  
  
encrypted = original-public-key _mod_ **n**.   

`$$  
\begin{align}
16^{11}\mod 51 &= 17,592,186,044,416 \mod 51 &= 16  \\
18^{11} \mod 51 &= 64,268,410,079,232 \mod 51 &= 18  \\
9^{11} \mod 51 &= 31,381,059,609 \mod 51 &= 15  \\
22^{11} \mod 51 &= 584,318,301,411,328 \mod 51 &= 28\\  
1^{11} \mod 51 &= 1 \mod 51 &= 1  \\
20^{11} \mod 51 &= 204,800,000,000,000 \mod 51 &= 41  \\
5^{11} \mod 51 &= 48,828,125 \mod 51 &= 11  \\
\end{align}
$$` 

So our encrypted message is (16 18 15 28 1 41 11). This is the message we send to our intended recipient. Even if it is intercepted in transit, it remains unintelligible without the private key.  
  
To decrypt the message, repeat the process except now we are raising the encrypted message to the power of the private key (3), which transforms it back into its original code.  
  
original = encrypted(privatekey) _mod_ **n**.  

`$$  
\begin{align}  
16^{3} \mod 51 &= 4096\mod 51 &= 16 \\ 
18^{3} \mod 51 &= 5832\mod 51 &= 18 \\ 
15^{3} \mod 51 &= 3375\mod 51 &= 9  \\
28^{3} \mod 51 &= 21952\mod 51 &= 22  \\
1^{3} \mod 51 &= 1\mod 51 &= 1  \\
41^{3} \mod 51 &= 68921\mod 51 &= 20  \\
11^{3} \mod 51 &= 1331\mod51 &= 5  \\
\end{align}
$$`   
  
Resulting in the original message, (16 18 15 28 1 41 11 = "**P R I V A T E**").   
  
  
The way this works in practice is that you generate your own set of keys, one public and one private. The public key is made known to others with whom you wish to communicate privately (often by posting it somewhere online). Then, if someone wants to send you an encrypted message, they simply encode their message using your public key and send it to you. At this point, the message is garbled and can only be decoded using your private key. Remember that big block of garbled nonsense above? That's my public key, analogous to (11, 51) in the example above except that in decimal form it has over 300 digits!  
  
In the demonstrative example above, our **n** = 51. Numbers like 51, which are the product of two primes numbers, are called [semiprimes](https://en.wikipedia.org/wiki/Semiprimes). Its not hard to see that 51 = 17 x 3, and these factors are all you need to crack our code! So how is this secure? The strength of the security offered by RSA and similar cryptographic methods is that finding the original factors of a [huge semiprime](https://en.wikipedia.org/wiki/RSA_numbers) is [computationally difficult](https://en.wikipedia.org/wiki/RSA_problem). For small semiprimes its no big deal, but when the two prime factors are large (~300 digits, which is more than a "[googol](https://en.wikipedia.org/wiki/Googol)"!), randomly chosen, and about the same size, the search becomes impractical for even the most powerful computers. The number of operations required to perform the factorization exhausts all our of present computer power.  
  
The [largest RSA number that has even been successfully factored](https://en.wikipedia.org/wiki/RSA-768#RSA-768) is 768 bits (232 decimal digits), and this took hundreds of computers more than two years to accomplish! Indeed, much smaller RSA numbers, many with large bounties in their day, [remain unfactored](https://en.wikipedia.org/wiki/RSA_numbers). Still, this method of encryption is not "uncrackable" in theory, and the size of the numbers used will have to stay one step ahead of developments in computing power. There do exist [uncrackable codes](https://en.wikipedia.org/wiki/One-time_pad), however...  
  
Now, after that long aside, why then are Fermat primes (`$2^{2n}+1$`) useful in RSA cryptography? Often, the public key exponent is one of these five numbers, typically 65537. Consider their binary representation:  

`$$  
\begin{align}    
3 &= (11)_2  \\
5 &= (101)_2  \\
17 &= (10001)_2 \\ 
257 &= (100000001)_2  \\
65537 &= (100000000000000001)_2 \\ 
\end{align}
$$`  
  
They are computationally convenient! There are probably other reasons too... let me know if you think of any!
