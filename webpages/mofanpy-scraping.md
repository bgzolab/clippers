---
aliases:
  - Mofanpy-scraping
created: 2025-01-13T20:06:17
modified: 2025-08-31T13:46:30
title: Mofanpy-scraping
---

# Mofanpy-scraping

- [[python-beautifulsoup]]
- [[crawler]]

source: https://mofanpy.com/tutorials/data-manipulation/scraping/

- *[Why 爬虫?](https://mofanpy.com/tutorials/data-manipulation/scraping/why)*
- *[了解网页结构](https://mofanpy.com/tutorials/data-manipulation/scraping/understand-website)*
- *[BeautifulSoup 解析网页: 基础](https://mofanpy.com/tutorials/data-manipulation/scraping/beautifulsoup-basic)*
- *[BeautifulSoup 解析网页: CSS](https://mofanpy.com/tutorials/data-manipulation/scraping/beautifulsoup-css)*
- *[BeautifulSoup 解析网页: 正则表达](https://mofanpy.com/tutorials/data-manipulation/scraping/beautifulsoup-regex)*
- [小练习: 爬百度百科](https://mofanpy.com/tutorials/data-manipulation/scraping/practice-baidu-baike)

``` python
    from urllib.request import urlopen
    import re
    # if has Chinese, apply decode(), html is not
    # all utf-8???
    html = urlopen("https://mofanpy.com/static/scraping/basic-structure.html").read().decode('utf-8')
    print(html)
    res = re.findall(r"<title>(.+?)</title>", html)
    print('\nPage title is: ', res[0]);
    res = re.findall(r"<p>(.+?)</p>", html, flags = re.DOTALL)
    # re.DOTALL if such multi line as tab, new line
    print('\nPage paragraph is: ', res[0])
    res = re.findall(r'href="(.+?)"', html)
    print('\nAll links: \n', res)
```

- [正则表达式 | 莫烦Python](https://mofanpy.com/tutorials/python-basic/basic/regular-expression)
- BeautifulSoup: [Beautiful Soup Documentation — Beautiful Soup 4.12.0 documentation](https://www.crummy.com/software/BeautifulSoup/bs4/doc/.)
  - 学习资料:
    - [本节学习代码](https://github.com/MorvanZhou/easy-scraping-tutorial/blob/master/notebook/2-1-beautifulsoup-basic.ipynb)
    - BeautifulSoup [英文官网](https://www.crummy.com/software/BeautifulSoup/bs4/doc/), [中文官网](https://www.crummy.com/software/BeautifulSoup/bs4/doc.zh/)
    - 本节使用的爬虫 [测试网页](https://mofanpy.com/static/scraping/basic-structure.html)

``` python
      from bs4 import BeautifulSoup
      from urllib.request import urlopen
      # if has Chinese, apply decode()
      html = urlopen("https://mofanpy.com/static/scraping/basic-structure.html").read().decode('utf-8')
      print(html)
      soup = BeautifulSoup(html, features='lxml')
      print(soup.h1)
      print('\n', soup.p)
      all_href = soup.find_all('a') # attrs?
      all_href = [l['href'] for l in all_href]
      # l['href'] get the value of href in `a` tags, like array
      print('\n', all_href)
```

      CSS

``` python
      from bs4 import BeautifulSoup
      from urllib.request import urlopen
      # if has Chinese, apply decode()
      html = urlopen("https://mofanpy.com/static/scraping/list.html").read().decode('utf-8')
      print(html)
      soup = BeautifulSoup(html, features='lxml')
      # use class to narrow search
      month = soup.find_all('li', {"class": "month"})
      for m in month:
        print(m.get_text())
        jan = soup.find('ul', {"class": 'jan'})
        d_jan = jan.find_all('li') # use jan as a parent
        for d in d_jan:
          print(d.get_text())
```

      Regex

``` python
      from bs4 import BeautifulSoup
      from urllib.request import urlopen
      import re
      # if has Chinese, apply decode()
      html = urlopen("https://mofanpy.com/static/scraping/table.html").read().decode('utf-8')
      soup = BeautifulSoup(html, features='lxml')
      img_links = soup.find_all("img", {"src": re.compile('.*?\.jpg')})
      for link in img_links:
        print(link['src'])
        course_links = soup.find_all('a', {'href': re.compile('https://morvan.*')})
        for link in course_links:
          print(link['href'])
```

      百度百科

``` python
      from bs4 import BeautifulSoup
      from urllib.request import urlopen
      import re
      import random
      base_url = "https://baike.baidu.com"
      his = ["/item/%E7%BD%91%E7%BB%9C%E7%88%AC%E8%99%AB/5162711"]
      for i in range(10):
        url = base_url + his[-1]
        try:
          html = urlopen(url, timeout=1).read().decode('utf-8')
          soup = BeautifulSoup(html, features='lxml')
          print(i, soup.find('h1').get_text(), '; url: ', his[-1])
          sub_urls = soup.find_all('a', {'target': '_blank', 'href': re.compile('^/item/(%.{2})+$')})
          # /item/(%.{2})+$
          # /item/\w+?
          if len(sub_urls) !=0:
            his.append(random.sample(sub_urls, 1)[0]\['href'])
            else:
              his.pop()
              except Exception as e:
                print('Error:'+url+'ERROR!!!!')
                pass
              continue
              print(his)
```

      request

``` python
      import requests
      import webbrowser
      # param = {'q': 'bGZoCg'}
      # r = requests.get('http://www.google.com/search', params=param)
      # print(r.url)
      # webbrowser.open(r.url)
      # https://www.google.com/search?client=firefox-b-d&q=test
      # need proxy
      # data = {'firstname': '莫烦', 'lastname': '周'}
      # r = requests.post('http://pythonscraping.com/files/processing.php', data=data)
      # print(r.text)
      # print(r.url)
      # print(r.content)
      # print(r.json)
      payload = {'username': 'Morvan', 'password': 'password'}
      # r = requests.post('http://pythonscraping.com/pages/cookies/welcome.php', data=payload)
      # print(r.cookies.get_dict())
      # r = requests.get('http://pythonscraping.com/pages/cookies/profile.php', cookies=r.cookies)
      # print(r.text)
      session = requests.Session()
      r = session.post('http://pythonscraping.com/pages/cookies/welcome.php', data=payload)
      print(r.cookies.get_dict())
      r = session.get("http://pythonscraping.com/pages/cookies/profile.php")
      print(r.text)
```

      request: http://docs.python-requests.org/en/master/
