---
draft: true
author: Stack Overflow
cover: https://wsrv.nl/?url=https%3A%2F%2Fimage.simplecastcdn.com%2Fimages%2Ff0fdf349-149b-42f9-95d0-8ddf72185776%2F02a60604-9d42-4ec4-a716-8d9a2942f79c%2F3000x3000%2Fstack-overflow-podcast-1080x1080.jpg%3Faid%3Drss_feed&w=200&h=200
created: '2025-06-10T09:36:39'
modified: '2025-06-10T09:36:39'
published: '2025-06-10T09:36:39'
show: The Stack Overflow Podcast
snipd: https://share.snipd.com/episode/3794fc8c-a831-4721-ac88-6e0a3f4b9def
source: https://stackoverflow.blog/podcast/
title: Better vibes and vibe coding with Gemini 2.5
type: podcast-episode
---
## Show notes
> Gemini 2.5  is DeepMind’s most advanced model yet, with strong reasoning and coding capabilities. 
> Connect with Tulsee on  LinkedIn .
> Connect with Logan on  LinkedIn  and  Stack Overflow . 
> Check out  our previous episode  with Logan, we discussed his unique path from coding to AI to product, the challenges of non-determinism in AI models, and surprising lessons from working at the Apple Store.
> Congrats to Populous badge winner  Pascal MARTIN  for answering the question  PHP echo vs PHP short echo tags .

## Snips
### [04:47] Optimizing Cost-Quality Balance
[🎧 Play snip - 1min️ (03:50 - 04:47)](https://share.snipd.com/snip/11e4f8c1-ba10-4cb0-b6e9-2c7e85dc6f3b)
<audio controls> <source src="https://pdrl.fm/c28362/injector.simplecastaudio.com/6fa1d34c-502b-4abf-bd82-483804006e0b/episodes/33609542-2d12-468a-9885-33c8ba7392f6/audio/128/default.mp3?aid=rss_feed&awCollectionId=6fa1d34c-502b-4abf-bd82-483804006e0b&awEpisodeId=33609542-2d12-468a-9885-33c8ba7392f6&feed=XA_851k3#t=03:50,04:47"> </audio>
**Optimizing Cost-Quality Balance**
- Gemini 2.5 is designed to optimize a Pareto frontier of cost and quality.  
- Developers can control the model's thinking budget to manage cost and latency for different quality needs.
#### 📚 Transcript
Click to expand
<blockquote><b>Ben Popper</b>

Or developer?</blockquote>
<blockquote><b>Tulsee Doshi</b>

I'm glad you asked because we talk a lot about this idea of like a Pareto frontier of cost to quality. And one of the goals we set for ourselves on the Gemini models is we want to be at the top of that Pareto frontier. So you can think about it as how do we maximize the balance between best cost for quality? So it's not just about the quality benchmark itself. It's about the combination of cost and quality and how these two things play together. And we want all of our models to sit at that frontier. And so that's actually a very, very strong goal for what we build. And actually with 2.5 Flash, which we most recently released, a big priority was actually giving developers control over that dynamic. So being able to turn off thinking, for example, or being able to control how much the model thinks with different budgets actually allows developers to have control over cost and latency For different quality thresholds. And I think that's actually super important to the developer experience and super important to what we want to build, which is the most usable models,</blockquote>

### [08:29] Tools and Reasoning Reduce Hallucinations
[🎧 Play snip - 1min️ (07:23 - 08:29)](https://share.snipd.com/snip/8c91edd2-27a7-4771-b49b-dbf12bd388e6)
<audio controls> <source src="https://pdrl.fm/c28362/injector.simplecastaudio.com/6fa1d34c-502b-4abf-bd82-483804006e0b/episodes/33609542-2d12-468a-9885-33c8ba7392f6/audio/128/default.mp3?aid=rss_feed&awCollectionId=6fa1d34c-502b-4abf-bd82-483804006e0b&awEpisodeId=33609542-2d12-468a-9885-33c8ba7392f6&feed=XA_851k3#t=07:23,08:29"> </audio>
**Tools and Reasoning Reduce Hallucinations**
- Tools like search and code execution help reduce hallucinations by grounding models in external data.  
- Models with self-reflection can catch mistakes during reasoning, improving answer accuracy.
#### 📚 Transcript
Click to expand
<blockquote><b>Logan Kilpatrick</b>

And I think there's two other quick dimensions to this and Tulsi jump in if I'm misrepresenting this here, but I think one of them is like tools being a mechanism to stop model hallucinations Because there's just things we know the models are not good at. Like they're never going to have the most up-to information from the internet. Therefore, like don't even pretend that you're going to be able to guess what the weather's like in Chicago right now. It's not possible for the model. So you can use search to do that. A bunch of the math stuff code execution, I think, solves like a whole class of really like gnarly hallucinations. But I also think like the reasoning step is super important. And from my understanding, what we've seen is the model is able to catch cases where it's like making blatant mistakes that historically wouldn't otherwise have been able to because It has that like self-reflection process as it's coming up with an answer. It is interesting that it feels like generally over time as the models reason more and have access to more tools, hypothetically, you'd expect the number of hallucinations to continue To go down because the model, it's not like stuck with the hallucination. Whereas like in the previous iteration where like you basically get one shot to answer the question, if you go down the wrong sort of chain of thought, you end up putting out the wrong Answer. Now you can sort of self-correct during that process. I</blockquote>

### [18:18] Gemini's Native Multimodality
[🎧 Play snip - 1min️ (17:31 - 18:18)](https://share.snipd.com/snip/c77f9032-9113-4970-b855-c5b4a8b1dadd)
<audio controls> <source src="https://pdrl.fm/c28362/injector.simplecastaudio.com/6fa1d34c-502b-4abf-bd82-483804006e0b/episodes/33609542-2d12-468a-9885-33c8ba7392f6/audio/128/default.mp3?aid=rss_feed&awCollectionId=6fa1d34c-502b-4abf-bd82-483804006e0b&awEpisodeId=33609542-2d12-468a-9885-33c8ba7392f6&feed=XA_851k3#t=17:31,18:18"> </audio>
**Gemini's Native Multimodality**
- Gemini 2.5 models have native multimodality in input and output contexts.  
- They process text, video, and images to generate text, images, and audio with contextual understanding.
#### 📚 Transcript
Click to expand
<blockquote><b>Tulsee Doshi</b>

Or image, Gemini should be able to do amazing things with that. And actually like one thing that's really awesome at the 2.5 models is how good they are at video understanding. So you can give these models a video and then ask actually based on that video to generate a web app and you'll see really interesting outcomes. Or you can give a video and ask to caption or timestamp that video and Gemini will do a pretty awesome job of breaking that down. And so I think that part is super important to us. Then there's native multimodality in the output. So can Gemini generate images or can Gemini generate audio, which actually Gemini natively generates images. And that's a big part of building out native multimodality is being able to combine these aspects together. And what that allows you to do is more nuanced things in the generation of the content because you benefit from Gemini's world knowledge in the way that you're actually generating the Media.</blockquote>

