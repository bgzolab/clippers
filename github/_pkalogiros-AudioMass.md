---
title: "pkalogiros/AudioMass"
aliases: AudioMass
released: 2018-07-22T00:00:01Z
modified: 2026-07-19T00:04:49
created: 2026-07-18T14:25:43Z}
description: "Free full-featured web-based audio & waveform editing tool"
source: "https://github.com/pkalogiros/AudioMass"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/pkalogiros/AudioMass?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/pkalogiros/AudioMass?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/pkalogiros/AudioMass?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=pkalogiros&repo=AudioMass&bg_color=00000000)](https://github.com/pkalogiros/AudioMass)


# AudioMass

Free full-featured web-based audio & waveform editing tool

## README

# AudioMass
Free full-featured web-based audio &amp; waveform editing tool


Live: [https://audiomass.co](https://audiomass.co)

### Now with multitrack support!

AudioMass now ships with a full multitrack mode -- layer multiple tracks, drag clips around, crossfade overlaps, record onto armed channels, and bounce the whole thing back down to a single file. More details on the [about page](https://audiomass.co/about.html).

![AudioMass Multitrack](https://audiomass.co/about/multitrack.png)

---

## Getting it to Run!
1. please checkout this repo (or download it as zip)
2. navigate to it through your favorite CLI, then access the ```src``` dir
3. Run ```go run audiomass-server.go```  -  or if you do not have golang installed, you can use a simple python webserver by running ```python audiomass-server.py```
4. Navigate to [http://localhost:5055/](http://localhost:5055/) and have fun!

...



---

If you want to build the all.build.js minified file for delivery/publishing this then you can use uglify and run as:
```cat dist/wavesurfer.js dist/plugin/wavesurfer.regions.js oneup.js app.js keys.js contextmenu.js lufs.js ui-fx.js ui.js modal.js state.js engine.js actions.js drag.js recorder.js multitrack.js welcome.js fx-pg-eq.js fx-auto.js local.js id3.js lzma.js | uglifyjs -c -m -o all.build.js```

Thanks!



## Notes

