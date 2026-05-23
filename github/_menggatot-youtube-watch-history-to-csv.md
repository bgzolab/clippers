---
title: "menggatot/youtube-watch-history-to-csv"
aliases: youtube-watch-history-to-csv
released: 2023-05-23T16:08:56Z
modified: 2026-05-23T17:15:32
created: 2025-08-02T13:34:18Z}
description: "This project allows you to convert your YouTube watch history HTML file from Google Takeout into a CSV file that can be used by the universalscrobbler.com to Scrobble manually in bulk."
source: "https://github.com/menggatot/youtube-watch-history-to-csv"
tags:
  - github/star
---

![](https://img.shields.io/github/stars/menggatot/youtube-watch-history-to-csv?style=for-the-badge&label=stars) ![](https://img.shields.io/github/repo-size/menggatot/youtube-watch-history-to-csv?style=for-the-badge&label=size) ![](https://img.shields.io/github/created-at/menggatot/youtube-watch-history-to-csv?style=for-the-badge&label=since)

[![](https://github-stats-extended.vercel.app/api/pin/?username=menggatot&repo=youtube-watch-history-to-csv&bg_color=00000000)](https://github.com/menggatot/youtube-watch-history-to-csv)


# youtube-watch-history-to-csv

This project allows you to convert your YouTube watch history HTML file from Google Takeout into a CSV file that can be used by the universalscrobbler.com to Scrobble manually in bulk.

## README

# youtube-watch-history-to-csv

This project allows you to convert your YouTube watch history HTML file from Google Takeout into a CSV file that can be used by the universalscrobbler.com to Scrobble manually in bulk.

## Getting your YouTube Watch History

Follow these steps to download your YouTube watch history from Google Takeout:

1. Go to [Google Takeout](https://takeout.google.com/settings/takeout).
2. Click `Create new export`.
3. Click `Deselect all`.
4. Scroll down and find YouTube, then check mark it.
5. Click `All YouTube data included`.
6. Click `Deselect all`.
7. Only select `History`.
8. Click `Ok`.
9. Click `Next step`.
10. Select `Send the download link via email`.
11. Select `Export once`.
12. For file type, choose `.zip`.
13. Choose the maximum size of 1GB (the history file is less than 100MB).
14. Click `Create export`.

You will receive a `.zip` file named `takeout-xxxxx-xxx.zip` in your email. Extract the file named `watch-history.html` located in the `Takeout/Youtube and YouTube Music/history/` directory from the zip file.

## Formatting the HTML File

To make the script work faster, use `tidy` to fix the formatting of the HTML file. Install tidy using:

For apt:
```bash
sudo apt install tidy
```

For brew:
```bash
brew install tidy-html5
```

Then, type this in your terminal:
```bash
tidy -indent --indent-spaces 2 -quiet --tidy-mark no watch-history.html > tidy-watch-history.html
```

## Script Setup

This script requires Python 3.7 or higher. Run the `setup.sh` to create the environment. After it is done, activate it using this command:

```bash
source yt-history-env/bin/activate
```

Then run the script like this:

```bash
python yt-history-to-csv.py tidy-watch-history.html yt-history.csv
```

To stop the script, press `ctrl+c`. To continue the script, run the script again. It will fetch the last progress and continue from that point.

This will convert your YouTube watch history into a CSV file that can be used by the [universalscrobbler.com to Scrobble manually in bulk](https://universalscrobbler.com/bulk.php).

## Notes

