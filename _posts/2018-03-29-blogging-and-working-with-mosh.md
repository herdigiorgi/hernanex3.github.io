---
layout: default
title: "Blogging and Working with MOSH protocol"
tags: learning
---

The idea is simple, trying to be productive each time I can, at
every free moment I have. Which includes the time I travel to and from
work, this time is approximately 5 a day, It sound a lot, but that
number also includes preparation time that includes other activities
related to commuting, from where I can only really use 3 hours of
effective learning or working.

How I code while traveling or commuting then? I just do it using
my phone connected to internet via 4g **to a cloud virtual machine**,
currently an Azure A1. My phone has installed [Termux], [Mosh], ssh
and a ssh server.

Why? I have many software for many uses cases:

* When traveling in public transportation.
* When working with a computer without internet connection.
* Working with a Windows machine I don't own.

## When traveling in public transportation
In this case I need something small and cheap that doesn't get me
noticed, that is why I got a very cheap phone, aside of don't having
money for other better. But the important thing here is knowing
that SSH works using TCP that consumes a lot of data because of the
protocol overhead. But that isn't the only problem, is the **roaming**,
it means you will loose your connection many times while traveling,
even more you will loose a lot of packet. In conclusion you can code
while traveling using TCP SSH.

[Mosh] resolves those problems using UDP and having a persistent connection
that endures high latency and package loss. Even more it uses less
bandwidth because of how it handles the data transfer.

## Working with a Windows machine I don't own
In linux you have [Mosh] available, but in Windows that isn't the case,
which forces you to connect via SSH, but if you use a windows machine
while commuting or traveling this won't work. For this reason, I
started and SSH server in my phone [(is easy)](https://termux.com/ssh.html),
and then i connected back to my phone from windows using SSH with putty
via USB, and that is also easy:

~~~bash
$ adb forward tcp:8022 tcp:8022
~~~

that `adb` command just maps the port 8022 of your android phone
to the port 8022 of your own machine, in that way you can connect
via normal SSH using your USB connected phone. Then logged in your
phone you can use [MOSH] to finally connect to a remote production
or working machine.

Also having the possibility to connect via ssh using only usb without
any wifi lets you to work even without a working network, like when
you are in the bus.

[Termux]: https://termux.com/
[Mosh]: https://termux.com/
