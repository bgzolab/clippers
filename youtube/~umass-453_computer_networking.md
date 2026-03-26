---
draft: true
aliases:
  - 自顶向下计算机网络
  - "Computer Networking A Top-Down Approach"
created: 2023-04-13
---

- [Jim Kurose Homepage (umass.edu)](https://gaia.cs.umass.edu/kurose_ross/index.php)
- [COMPSCI 453 Computer Networking | Cybersecurity Institute (umass.edu)](https://infosec.cs.umass.edu/content/compsci-453553-computer-networking)
## [Online](https://www.youtube.com/playlist?list=PLm556dMNleHc1MWN5BX9B2XkwkNE2Djiu) Lectures  -nested-2
  - CH 01
    - Overview. What is the Internet? What is a protocol?
      - ((643a7023-b789-4ea1-8ab5-e3cd27955dbe))
    - Network edge
    - Network core
    - Performance: loss, delay, throughput
    - Protocol layers, service models
    - Security
    - History
  - CH 02 **Application Layer**
    - Our goals
      - conceptual *and* implementation aspects of application-layer protocols
        - transport-layer service models
        - client-server paradigm
        - peer-to-peer paradigm
      - learn about protocols by examining popular application-layer protocols and infrastructure
        - HTTP
        - SMTP, IMAP
        - DNS
        - video streaming systems, CDNs
      - programming network applications
        - socket API
    - Principles of Network Applications
      - Some network apps
        - social networking
        - Web
        - text messaging
        - e-mail
        - multi-user network games
        - streaming stored video (YouTube, Hulu, Netflix)
        - P2P file sharing
        - voice over IP (e.g., Skype)
        - real-time video conferencing (e.g., Zoom)
        - Internet search
        - remote login
        - ...
      - Client-server paradigm
        - server:
          - always-on host
          - permanent IP address
          - often in data centers, for scaling (拓展)
        - clients:
          - contact, communicate with server
          - may be intermittently(间歇地) connected
          - may have dynamic IP addresses
          - do not communicate directly with each other
          - examples: HTTP, IMAP, FTP
      - Peer-peer architecture
        - no always-on server
        - arbitrary end systems directly communicate
        - peers request service from other peers, provide service in return to other peers
          - self scalability – new peers bring new service capacity, as well as new service demands
        - peers are intermittently connected and change IP addresses
        - complex management
        - example: P2P file sharing
      - Processes communicating
        - process: program running within a host
          - within same host, two processes communicate using  **inter-process communication** (mark: d by OS)
          - processes in different hosts communicate by exchanging messages
        - clients, servers
          - client process: process that initiates communication
          - server process: process that waits to be contacted
        - >[!note]
           > applications with P2P architectures have client processes & server processes
      - Sockets
        - process sends/receives messages to/from its socket
        - socket analogous to door
          - sending process shoves message out door
          - sending process relies on transport infrastructure on other side of door to deliver message to socket at receiving process
          - two sockets involved: one on each side
        - ((643f9efe-3522-4325-b637-9dac3903a191))
      - Addressing processes
        - to receive messages, process  must have identifier
        - host device has unique 32-bit IP address
          - Q: does IP address of host on which process runs suffice for identifying the process?
          - A: no, many processes can be running on same host
        - identifier includes both IP address and port numbers associated with process on host.
        - example port numbers:
          - HTTP server: 80
            mail server: 25
        - to send HTTP message to gaia.cs.umass.edu web server:
          - IP address: 128.119.245.12
            port number: 80
        - more shortly…
      - An application-layer protocol mark: s:
        - types of messages exchanged,
          - e.g., request, response
        - message syntax:
          - what fields in messages & how fields are delineated
        - message semantics
          - meaning of information in fields
        - rules for when and how processes send & respond to messages
        - open protocols:
          - description: d in RFCs, everyone has access to protocol definition
          - allows for interoperability
          - e.g., HTTP, SMTP
        - proprietary protocols:
          - e.g., Skype, Zoom
      - What transport service does an app need?
        - data integrity
          - some apps (e.g., file transfer, web transactions) require 100% reliable data transfer
          - other apps (e.g., audio) can tolerate some loss
        - timing
          - some apps (e.g., Internet telephony, interactive games) require low delay to be “effective”
        - throughput
          - some apps (e.g., multimedia) require minimum amount of throughput to be “effective”
          - other apps (“elastic apps”) make use of whatever throughput they get
        - security
          - encryption, data integrity, …
      - Transport service requirements: common apps
        - | application            | data loss     | throughput                            | time sensitive? |
          |------------------------|---------------|---------------------------------------|-----------------|
          | file transfer/download | no loss       | elastic                               | no              |
          | e-mail                 | no loss       | elastic                               | no              |
          | Web documents          | no loss       | elastic                               | no              |
          | real-time audio/video  | loss-tolerant | audio: 5Kbps-1Mbps<br>video:10Kbps-5Mbps | yes, 10’s msec  |
          | streaming audio/video  | loss-tolerant | same as above                         | yes, few secs   |
          | interactive games      | loss-tolerant | Kbps+                                 | yes, 10’s msec  |
          | text messaging         | no loss       | elastic                               | yes and no      |
      - Internet transport protocols services
        - TCP service:
          - **reliable transport** between sending and receiving process
          - **flow control**: sender won’t overwhelm receiver
          - **congestion control**: throttle sender when network overloaded
          - **connection-oriented**: setup required between client and server processes
          - does not provide: timing, minimum throughput guarantee, security
        - UDP service:
          - **unreliable data transfer** between sending and receiving process
          - does not provide: reliability, flow control, congestion control, timing, throughput guarantee, security, or connection setup.
        - >[!warning]
          > Q: why bother?  Why is there a UDP?
      - Internet applications, and transport protocols
        - | application            | application layer protocol                      | transport protocol |
          |------------------------|-------------------------------------------------|--------------------|
          | file transfer/download | FTP [RFC 959]                                   | TCP                |
          | e-mail                 | SMTP [RFC 5321]                                 | TCP                |
          | Web documents          | HTTP 1.1 [RFC 7320]                             | TCP                |
          | Internet telephony     | SIP [RFC 3261], RTP [RFC <br>3550], or proprietary  | TCP or UDP         |
          | streaming audio/video  | HTTP [RFC 7320], DASH                           | TCP                |
          | interactive games      | WOW, FPS (proprietary)                          | UDP or TCP         |
      - Securing TCP
        - Vanilla(普通、无特色的) TCP & UDP sockets:
          - no encryption
          - cleartext passwords sent into socket traverse Internet  in cleartext (!)
        - Transport Layer Security (TLS)
          - provides encrypted TCP connections
          - data integrity
          - end-point authentication
    - The Web and HTTP
      - HTTP overview
        - HTTP: hypertext transfer protocol
        - Web’s application-layer protocol
        - client/server model:
          - client: browser that requests, receives, (using HTTP protocol) and “displays” Web objects
          - server: Web server sends (using HTTP protocol) objects in response to requests
        - HTTP uses TCP:
          - client initiates TCP connection (creates socket) to server,  port 80
          - server accepts TCP connection from client
          - HTTP messages (application-layer protocol messages) exchanged between browser (HTTP client) and Web server (HTTP server)
          - TCP connection closed
        - HTTP is “stateless”
          - server maintains no information about past client requests
          -            >[!note]
            > protocols that maintain “state” are complex!
            - past history (state) must be maintained
            - if server/client crashes, their views of “state” may be inconsistent, must be reconciled (协调)
      - HTTP connections: two types
        - Non-persistent HTTP
          - TCP connection opened
          - at most one object sent over TCP connection
          - TCP connection closed
          - （downloading multiple objects required multiple connections）
        - Persistent HTTP
          - TCP connection opened to a server
          - multiple objects can be sent over single TCP connection between client, and that server
          - TCP connection closed
      - Non-persistent HTTP
        -          >[!example]
          > User enters URL:
          - 1a. HTTP client initiates TCP connection to HTTP server (process) at www.someSchool.edu on port 80
            1b. HTTP server at host www.someSchool.edu waiting for TCP connection at port 80  “accepts” connection, notifying client
          - 2. HTTP client sends HTTP request message (containing URL) into TCP connection socket. Message indicates that client wants object someDepartment/home.index
          - 3. HTTP server receives request message, forms response message containing requested object, and sends message into its socket
          - 4. HTTP server closes TCP connection.
          - 5. HTTP client receives response message containing html file, displays html.  Parsing html file, finds 10 referenced jpeg  objects
          - 6. Steps 1-5 repeated for each of 10 jpeg objects
        - response time
          - RTT (definition): time for a small packet to travel from client to server and back
          - HTTP response time (per object):
            - ![[image_1681888399411_0.png]]
            - one RTT to initiate TCP connection
            - one RTT for HTTP request and first few bytes of HTTP response to return
              obect/file transmission time
          - Non-persistent HTTP response time =  2RTT + file transmission time
      - Persistent HTTP (HTTP 1.1)
        - Non-persistent HTTP issues:
          - requires 2 RTTs per object
          - OS overhead (开销) for each TCP connection
          - browsers often open multiple parallel TCP connections to fetch referenced objects in parallel
        - Persistent HTTP (HTTP1.1):
          - server leaves connection open after sending response
          - subsequent (后来的) HTTP messages between same client/server sent over open connection
          - client sends requests as soon as it encounters a referenced object
          - as little as one RTT for all the referenced objects (cutting response time in half)
      - HTTP request message
        - two types of HTTP messages: request, response
        - HTTP request message:
          - ASCII (human-readable format)
          - ![[image_1681890064527_0.png]]
          - ((643fa04f-4e5f-4e2e-b85a-2b0f699710a6))
        - Other HTTP request messages
          - POST method:
            - web page often includes form input
            - user input sent from client to server in entity body of HTTP POST request message
          - GET method (for sending data to server):
            - include user data in URL field of HTTP GET request message (following a ‘?’):
          - HEAD method:
            - requests headers (only) that would be returned if specified URL were requested  with an HTTP GET method.
          - PUT method:
            - uploads new file (object) to server
            - completely replaces file that exists at specified URL with content in entity body of POST HTTP request message
      - HTTP response message
        - ![[image_1681891499706_0.png]]
      - HTTP response status codes
        - status code appears in 1st line in server-to-client response message.
```
        % nc -c -v gaia.cs.umass.edu 80
        Connection to gaia.cs.umass.edu 80 port [tcp/http] succeeded!
        GET /kurose_ross/interactive/index.php HTTP/1.1
        Host: gaia.cs.umass.edu
        HTTP/1.1 200 OK
        Date: Wed, 19 Apr 2023 15:07:07 GMT
        Server: Apache/2.4.6 (CentOS) OpenSSL/1.0.2k-fips PHP/7.4.33 mod_perl/2.0.11 Perl/v5.16.3
        X-Powered-By: PHP/7.4.33
        Set-Cookie: DevMode=0
        Transfer-Encoding: chunked
        Content-Type: text/html; charset=UTF-8
```
      - Maintaining user/server state: cookies
        - >[!warning]
          > HTTP GET/response interaction is stateless
        - no notion of multi-step exchanges of HTTP messages to complete a Web “transaction”
          没有多步交换的概念
        - no need for client/server to track “state” of multi-step exchange
          无需跟踪多部交换的状态
        - all HTTP requests are independent of each other
        - no need for client/server to “recover” from a partially-completed-but-never-completely-completed(部分完成但是永远都无法完成) transaction
        - Web sites and client browser use cookies to maintain some state between transactions
        - four components:
          - 1) cookie header line of HTTP response message
          - 2) cookie header line in next HTTP request message
          - 3) cookie file kept on user’s host, managed by user’s browser
          - 4) back-end database at Web site
        - ((6440bba0-a6b0-4621-9f09-fadf70fd9b68))
      - HTTP cookies: comments
        - What cookies can be used for:
          - authorization
          - shopping carts
          - recommendations
          - user session state (Web e-mail)
        - Challenge: How to keep state?
          - at protocol endpoints: maintain state at sender/receiver over multiple transactions
          - in messages: cookies in HTTP messages carry state
        -          >[!warning]
          > cookies and privacy
          - cookies permit sites to learn a lot about you on their site.
            third party persistent cookies (tracking cookies) allow
          - common identity (cookie value) to be tracked across multiple web sites
      - Web caches (aka proxy servers)
        - Goal
          - satisfy client requests without involving origin server
        - ((6440dc7c-3f8f-4b81-b6c6-595ae6bc5305))
          - user configures browser to point to a (local) Web cache
          - browser sends all HTTP requests to cache
            - if object in cache: cache returns object to client
            - else cache requests object from origin server, caches received object, then returns object to client
        - Web cache acts as both client and server
          - server for original requesting client
          - client to origin server
        - server tells cache about object’s allowable caching in response header:
```
            cache-control: max-age=<seconds>
            cache-control: no-cache
```
        - Why Web caching?
          - reduce response time for client request
            - cache is closer to client
          - reduce traffic(流量) on an institution’s access link(访问链路)
          - Internet is dense with caches
            - enables “poor” content providers to more effectively deliver content
        - <iframe src="https://www.youtube.com/embed/4M39gEPWPYs" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
<center>via: <a href='https://www.youtube.com/watch?v=4M39gEPWPYs' target='_blank' class='external-link'>https://www.youtube.com/watch?v=4M39gEPWPYs</a></center>
          -            >[!example]
            > Cache Example
            {{youtube-timestamp 195}}
            $$delay_{end-end} =  delay_{Internet}+ delay_{access-link}+delay_{LAN}$$
            - $delay_{Internet}$ is **RTT from institutional router to server**
              从机构路由器到服务器的RTT
            - $delay_{access-link}$ 是公网延时
          - Solution
            - Option 1: buy a faster access link
            - Option 2: install a web cache (cheaper and better)
        - Conditional GET
          - Goal: don’t send object if cache has up-to-date cached version
          - no object transmission delay (or use of network resources)
          - client: specify date of cached copy in HTTP request
            - If-modified-since: <date>
          - server: response contains no object if cached copy is up-to-date: `HTTP/1.0 304 Not Modified`
      - HTTP/2
        - Key goal: decreased delay in multi-object HTTP requests
          - HTTP1.1: introduced multiple, pipelined GETs over single TCP connection
            - server responds in-order (FCFS: first-come-first-served scheduling) to GET requests
            - with FCFS, small object may have to wait for transmission  (head-of-line (HOL) blocking) behind large object(s)
            - loss recovery (retransmitting lost TCP segments) stalls object transmission
        - HTTP/2: [RFC 7540, 2015] increased flexibility at server in sending objects to client:
          - methods, status codes, most header fields unchanged from HTTP 1.1
          - transmission order of requested objects based on client-specified object priority (not necessarily FCFS)
          - ==`push unrequested objects to client`==
          - ==`divide objects into frames, schedule frames to mitigate HOL blocking`==
        - HTTP/2 mitigating HOL(Head of Line) blocking
          HTTP 2 减少队头阻塞
          - HTTP 1.1: client requests 1 large object (e.g., video file) and 3 smaller objects
            - objects delivered in order requested: O2, O3, O4 wait behind O1
          - HTTP/2: objects divided into frames, frame transmission interleaved (交错)
            - O2, O3, O4 delivered quickly, O1 slightly delayed
      - HTTP/2 to HTTP/3
        - HTTP/2 over single TCP connection means:
          - recovery from packet loss still stalls(拖慢) all object transmissions
            - as in HTTP 1.1, browsers have incentive(奖励) to open multiple parallel TCP connections to reduce stalling, increase overall throughput
          - no security over vanilla TCP connection
          - HTTP/3: adds security, per object error- and congestion-control (more pipelining) over UDP
            HTTP/3：增加了安全性，每个对象的错误和拥堵控制（更多的管道），超过UDP
            - more on HTTP/3 in transport layer
    - Email, SMTP, IMAP
      - Email
        - Three major components:
          - user agents
          - mail servers
          - simple mail transfer protocol: SMTP
        - User Agent (a.k.a. “mail reader”)
          - composing(合成, 组成), editing, reading mail messages
          - e.g., Outlook, iPhone mail client
          - outgoing(传出), incoming messages stored on server
        - mail servers:
          - mailbox contains incoming messages for user
          - message queue of outgoing (to be sent) mail messages
        - SMTP protocol between mail servers to send email messages
          - client: sending mail server
          - “server”: receiving mail server
        - ((6441023e-d102-4223-8ec1-487482420155))
      - SMTP RFC (5321)
        - uses TCP to reliably transfer email message from client (mail server initiating connection) to server, port 25
        - direct transfer: sending server (acting like client) to receiving server
        - three phases of transfer
          - SMTP handshaking (greeting)
          - SMTP transfer of messages
          - SMTP closure
          - ![[image_1681983708356_0.png]]
        - command/response interaction (like HTTP)
          - commands: ASCII text
          - response: status code and phrase
        - >[!example]
          > S: 220 hamburger.edu
          C: HELO crepes.fr
          S: 250 Hello crepes.fr, pleased to meet you
          C: MAIL FROM: <alice@crepes.fr>
          S: 250 alice@crepes.fr ... Sender ok
          C: RCPT TO: <bob@hamburger.edu>
          S: 250 bob@hamburger.edu ... Recipient ok
          C: DATA
          S: 354 Enter mail, end with ”.” on a line by itself
          C: Do you like ketchup?
          C: How about pickles?
          C: .
          S: 250 Message accepted for delivery
          C: QUIT
          S: 221 hamburger.edu closing connection
        - observations
          - comparison with HTTP:
            - HTTP: client pull
            - SMTP: client push
            - both have ASCII command/response interaction, status codes
            - HTTP: each object encapsulated in its own response message
            - SMTP: multiple objects sent in multipart message
            - SMTP uses persistent connections
            - SMTP requires message (header & body) to be in 7-bit ASCII
            - SMTP server uses CRLF.CRLF to determine end of message
      - Mail message format
        - SMTP: protocol for exchanging e-mail messages, mark: d in RFC 5321 (like RFC 7231 mark: s HTTP)
        - RFC 2822 mark: s syntax for e-mail message itself (like HTML mark: s syntax for web documents)
          - header lines, e.g.,
            - To:
              From:
              Subject:
            - these lines, within the body of the email message area different from SMTP MAIL FROM:, RCPT TO: commands!
          - Body: the “message” , ASCII characters only
      - Retrieving email: mail access protocols
        - ((64412d97-59b0-487b-9672-99bf09e643be))
        - SMTP: delivery/storage of e-mail messages to receiver’s server
        - mail access protocol: retrieval(检索) from server
          - IMAP (Internet Mail Access Protocol) [RFC 3501]
            - messages stored on server, IMAP provides retrieval, deletion, folders of stored messages on server
        - HTTP
          - gmail, Hotmail, Yahoo!Mail, etc.
          - provides web-based interface on top of STMP (to send), IMAP (or POP) to retrieve e-mail messages
    - The Domain Name Service:DNS
      - DNS: Domain Name System
        - distributed database implemented in hierarchy of many name servers
        - application-layer protocol: hosts, DNS servers communicate to resolve names (address/name translation)
          - note: core Internet function, implemented as application-layer protocol
          - complexity at network’s “edge”
      - DNS: services, structure
        - DNS services:
          - hostname-to-IP-address translation
          - host aliasing
            - canonical(规范的), alias names
          - mail server aliasing
          - load distribution
            - replicated Web servers: many IP addresses correspond to one name
        - Q: Why not centralize DNS?
          - single point of failure (单点故障)
          - traffic volume
          - distant centralized database
          - maintenance
        - A: doesn‘t scale!
          - Comcast DNS servers alone: 600B DNS queries/day
          - Akamai DNS servers alone: 2.2T DNS queries/day
      - DNS: a distributed, hierarchical database
        - ((64413fb3-cb64-42fc-bdef-f10f6f5d32c6))
        - Client wants IP address for www.amazon.com; 1st approximation:
          - client queries root server to find .com DNS server
          - client queries .com DNS server to get amazon.com DNS server
          - client queries amazon.com DNS server to get IP address for www.amazon.com
      - DNS: root name servers
      - Top-Level Domain, and authoritative servers
        - Top-Level Domain (TLD) servers:
          - responsible for .com, .org, .net, .edu, .aero, .jobs, .museums, and all top-level country domains, e.g.: .cn, .uk, .fr, .ca, .jp
          - Network Solutions: authoritative registry for .com, .net TLD
          - Educause: .edu TLD
        - authoritative DNS servers:
          - organization’s own DNS server(s), providing authoritative hostname to IP mappings for organization’s named hosts
          - can be maintained by organization or service provider
      - Local DNS name servers
        - when host makes DNS query, it is sent to its local DNS server
          - Local DNS server returns reply, answering:
            - from its local cache of recent name-to-address translation pairs (possibly out of date!)
            - forwarding request into DNS hierarchy for resolution
              each ISP has local DNS name server; to find yours:
```shell
                # MacOS
                scutil --dns
                # Windows
                ipconfig /all
```
        - local DNS server doesn’t strictly belong to hierarchy
      - DNS name resolution
        - Iterated(迭代) query:
          - contacted server replies with name of server to contact
          - “I don’t know this name, but ask this server”
          - ((64414229-8d0d-4383-9311-e2fdfa0e87e8))
            - ((644143b8-573a-45ee-a91d-c6752eb1e19e))
        - Recursive(递归) query:
          - puts burden of name resolution on contacted name server
          - heavy load at upper levels of hierarchy?
          - ((644143c6-94b6-48e0-a561-a15c3d8db2ba))
      - Caching DNS Information
        - once (any) name server learns mapping, it caches mapping, and immediately returns a cached mapping in response to a query
          - caching improves response time
          - cache entries timeout (disappear) after some time (TTL)
          - TLD servers typically cached in local name servers
        - cached entries may be out-of-date
          - if named host changes IP address, may not be known Internet-wide until all TTLs expire!
          - best-effort(尽力而为) name-to-address translation!
      - DNS records
        - DNS: distributed database storing resource records (RR)
          - $$(Name, Value, Type, TTL)$$
        - type=A
          - name is hostname
          - value is IP address
        - type=NS
          - name is domain (e.g., foo.com)
          - value is hostname of authoritative name server for this domain
        - type=CNAME
          - name is alias name for some “canonical” (the real) name
            www.ibm.com is really servereast.backup2.ibm.com
          - value is canonical name
        - type=MX
          - value is name of SMTP mail server associated with name
      - DNS protocol messages
        - ((64415633-be09-472b-bd35-cb831016b75b))
      - Getting your info into the DNS
        - >[!example]
          > example: new startup “Network Utopia”
          - register name networkuptopia.com at DNS registrar (e.g., Network Solutions)
            - provide names, IP addresses of authoritative name server (primary and secondary)
            - registrar inserts NS, A RRs into .com TLD server:
              - (networkutopia.com, dns1.networkutopia.com, NS)
                (dns1.networkutopia.com, 212.212.212.1, A)
          - create authoritative server locally with IP address 212.212.212.1
            - type A record for www.networkuptopia.com
              type MX record for networkutopia.com
      - DNS security
        - DDoS attacks
          - bombard(轰击) root servers with traffic
            - not successful to date
              到目前为止还没有成功
            - traffic filtering
            - local DNS servers cache IPs of TLD servers, allowing root server bypass
          - bombard TLD servers
            - potentially(可能地，潜在地) more dangerous
        - Spoofing(欺骗性) attacks
          - intercept(拦截) DNS queries, returning bogus(假的) replies
            - DNS cache poisoning(中毒)
            - RFC 4033: DNSSEC authentication services
    - Peer-to-Peer File Distribution
    - Video Streaming and Content Distribution Networks
      - Video Streaming and CDNs: context
        - stream video traffic: major consumer of Internet bandwidth
          - Netflix, YouTube, Amazon Prime: 80% of residential ISP traffic (2020)
        - challenge:  scale(规模) - how to reach ~1B users?
        - challenge: heterogeneity(异质性)
          - different users have different capabilities (e.g., wired versus mobile; bandwidth rich versus bandwidth poor)
        - solution: distributed, application-level infrastructure
      - Multimedia: video
        - video: sequence of images displayed at constant rate
          - e.g., 24 images/sec
        - digital image: array of pixels
          - each pixel represented by bits
        - coding: use redundancy(冗余性) within and between images to decrease # bits used to encode image
          - spatial (within image)
            空间性
          - temporal (from one image to next)
            时间性
        - CBR: (constant bit rate): video encoding rate fixed
        - VBR:  (variable bit rate): video encoding rate changes as amount of spatial, temporal coding changes
        - examples:
          - MPEG 1 (CD-ROM) 1.5 Mbps
          - MPEG2 (DVD) 3-6 Mbps
          - MPEG4 (often used in Internet,  64Kbps – 12 Mbps)
      - Streaming stored video
        - Main challenges in simple scenario:
          - server-to-client **bandwidth** will vary over time, with changing network congestion levels (in house, access network, network core, video server)
          - **packet loss, delay** due to congestion will delay playout, or result in poor video quality
        - ![[POWERPNT_431_1682068477119_0.png]]
        - playout buffering
          - ![[POWERPNT_432_1682068525541_0.png]]
          - client-side buffering and playout delay
            - compensate(补偿) for network-added delay, delay jitter(抖动)
      - Streaming multimedia: DASH (Dynamic, Adaptive Streaming over HTTP)
        - server:
          - divides video file into multiple chunks
          - each chunk encoded at multiple different rates
          - different rate encodings stored in different files
          - files replicated in various CDN nodes
          - manifest file: provides URLs for different chunks
        - client:
          - periodically(定期) estimates server-to-client bandwidth
          - consulting manifest, requests one chunk at a time
            - chooses maximum coding rate sustainable given current bandwidth
            - can choose different coding rates at different points in time (depending on available bandwidth at time), and from different servers
        - “intelligence” at client: client determines
          - when to request chunk (so that buffer starvation(饥饿), or overflow does not occur)
          - what encoding rate to request (higher quality when more bandwidth available)
          - where to request chunk (can request from URL server that is “close”(靠近) to client or has high available bandwidth)
      - Content distribution networks (CDNs)
        - challenge: how to stream content (selected from millions of videos) to hundreds of thousands of simultaneous users?
        - ~~option 1: single, large “mega-server”~~ (doesn’t scale)
          - single point of failure
            point of network congestion
            long (and possibly congested) path to distant clients
        - option 2: store/serve multiple copies of videos at multiple geographically distributed sites (CDN)
          - enter deep: push CDN servers deep into many access networks
            - close to users
            - Akamai: 240,000 servers deployed in > 120 countries (2015)
          - bring home: smaller number (10’s) of larger clusters in POPs near access nets
            - used by Limelight
        - CDN: stores copies of content (e.g. MADMEN) at CDN nodes
        - subscriber requests content, service provider returns manifest
          - using manifest, client retrieves content at highest supportable rate
          - may choose different rate or copy if network path congested
          - ((64425378-5d93-4cb9-b5f4-977b165178d6))
        - OTT challenges: coping with a congested(拥挤) Internet from the “edge”
          - what content to place in which CDN node?
          - from which CDN node to retrieve content? At which rate?
    - Socket Programming:Creating Network Applications
      - Socket programming
      - Socket programming with UDP
      - Client/server socket interaction: UDP
      - Example app: UDP client
      - Example app: UDP server
      - Socket programming with TCP
      - Client/server socket interaction: TCP
      - Example app: TCP client
      - Example app: TCP server
    - Chapter 2: Supplemental topics Video
  - CH 03
  - CH 05
  - CH 06
## ![[book_computer_networking_a_top_down_approach.pdf]]
## CONTENTS
## Comment