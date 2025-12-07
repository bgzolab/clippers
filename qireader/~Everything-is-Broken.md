---
comments: true
created: '2025-11-19T15:00:16'
draft: true
modified: '2025-11-19T15:00:16'
source: https://chriscoyier.net/2025/10/22/everything-is-broken/
title: Everything is Broken
type: archive-web
---

Over in the ol’ ShopTalk Discord (that’s what [our
Patreon](https://www.patreon.com/shoptalkshow) thingy unlocks) our editor
[Chris Enns](https://chrisenns.com/) was venting about some streaming gear
woes. And I said:

> Nothing Ever Works

![Screenshot of a chat conversation where Chris 'Podcast Editor' shares
frustrations about technical issues with gaming equipment. Another user, Chris
Coyier, responds with a brief comment.](https://i0.wp.com/chriscoyier.net/wp-
content/uploads/2025/10/Screenshot-2025-10-21-at-10.53.53-AM.png?resize=1000%2C1024&ssl=1)He
ultimately blogge

[Chris ultimately blogged the
situation](https://chrisenns.com/2025/10/nothing-ever-works-streaming-
edition/) and used my reply as part of the title of the blog post.

Then shortly after, Jason Rodriguez’s post made the rounds in my circles: [Why
doesn’t anything work anymore?](https://rodriguezcommaj.com//blog/why-doesnt-
anything-work-anymore/)

> I’ve officially reached “old man yells at cloud” age.

Same, Jason.

I feel like this should be one of those viral blog post topics! Like the “good
newsletters” one that went around or “why I started blogging” before that or
whatever those were. Let’s make it happen people.

Here’s my list from the last week or so.

* * *

I was trying to log into Paramount+ on my AppleTV, but was getting some kind
of unclear error. I wasn’t even sure if I had an account or not, so I tried
the signup flow from my laptop. Another unclear error. Tried a different
browser and the same. I just wanted to watch the Packer game and this service
I either already pay or wanted to pay just wouldn’t let me.

And it wasn’t [the only reason I was annoyed at
Paramount+](https://frontendmasters.com/blog/the-two-button-problem/) that
day.

* * *

I bought a Gandalf costume for Halloween for like $50. The picture has a guy,
ya know, dressed up as Gandalf on the cover of the package and it looks fine.
Big grey beard. Small text on the package: _beard not included_. What the
what.

![A close-up of a package for a Gandalf costume from 'The Hobbit: An
Unexpected Journey,' displaying the costume details and components including a
robe, hat, and belt. A warning note states the beard is not
included.](https://i0.wp.com/chriscoyier.net/wp-
content/uploads/2025/10/IMG_6403.jpg?resize=768%2C1024&ssl=1)Zoom into the
very small black text by the beard itself. I love how they split up the words
too. Also I took this photo on my phone and AirDropped it to my computer and
it was in that entirely unusable `.HEIC` file format.

* * *

I use [TablePlus](https://tableplus.com/) (which I get through
[SetApp](https://setapp.com/)) for local database spelunking. I had some data
I was trying to get at that I _knew_ was going to be a fairly complicated
query to write. It was a count of entries on a column that wasn’t the index
but then I needed the index to join onto another table while having where
filter and also filtering on that final count as well. I could probably reason
it out, but it would probably take me an hour. So I was like: AI! Turns out
TablePlus _does_ have an AI assistant built in, so I tossed in my OpenAI API
key and…

> You exceeded your current quota, please check your plan and billing details.

Fair enough. Figure out where I can put a few bucks into my account and… I get
some “unknown” error. WHY WILL NOBODY TAKE MY MONEY. I tried another browser
_and_ another credit card _and_ turned off any “blocker” extensions I had in
case of interference, but nothing worked. So I tried to use the Anthropic
integration instead, and it was behaving the same. (In retrospect, it was
probably the us-east-1 downtime period.)

I tried the Gemini integration last, and it worked and I got my API key
properly. I got my prompt together explaining exactly what I needed to do and…

> I am sorry, I cannot fulfill this request. The available tools lack the
> ability to query data or cross-reference tables. I can only retrieve
> metadata such as database lists, schema lists, table lists, and table
> creation statements.

What in the what. The AI tool built into TablePlus can’t… _query data?_ Like,
wouldn’t that be the entire point of an AI assistant in a tool like this? I
tried using the built-in tool rather than just going to an AI tool because I
figured it would be all extra-smart, having access to the actual local
database structure and stuff to use as context. I get that it might be a
saftey concern (you don’t want a tool like this sending _actual data_ over to
an LLM) but that wasn’t a concern here and I didn’t need that anyway, I just
needed a query that I’d run myself.

Anyway I just Zoomed [Marie](https://codepen.io/marie) and she helped me write
the query in like 2 minutes. We brain coded it.

* * *

I bought a little cheap remote control car the other day from Fred Meyer, for
me and Ruby to drive around and torment her new puppy.

The car took 6 AA batteries. The package came with 4 AA batteries. What in the
what. Can you imagine being in the meeting where this is decided? Everybody at
that table was either stupid or mean. I can’t even say greedy because someone
greedy would just advocate for no batteries at all which at least is
understandable. (As a consumer you’d just assume they adjust the price
accordingly and you don’t have to worry about cheap junk batteries that have
lost their power after sitting in a warehouse for 3 years. How far we’ve
fallen.)

* * *

I needed one of those like 4-cup measuring cups the other day, so grabbed a
GoodCook brand one from the grocery store. After _one usage_ and trip through
the dishwasher, the markings on the side are unreadable. What in the what.
Just complete garbage. Not sure why I would forsaken
[Pyrex](https://pyrexhome.com/), I just assumed the competition would have
caught up, but apparently they have not.