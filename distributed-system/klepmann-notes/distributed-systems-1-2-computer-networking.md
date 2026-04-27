# Distributed Systems 1.2: Computer Networking

**Date:** 2026-04-27  
**Category:** distributed-systems

## What I Learned

In a distributed system, nodes communicate by sending messages over a network. Even a simple web page request can be viewed as communication between two nodes: a client and a web server.

I also learned the basic distinction between latency and bandwidth. Latency is the time it takes for a message or operation to complete, while bandwidth is the amount of data or work that can be transferred per unit of time.

## Context

This note is from Martin Kleppmann's distributed systems lecture on computer networking. The goal of this section is not to understand every low-level detail of networking, but to build a useful mental model for how nodes exchange messages.


## Details

The video starts by introducing the concept of a node in a distributed system. A node can be a computer, storage device, memory device, or any other machine that participates in the system. The network is what connects these nodes and allows them to share data.

Two important networking terms are introduced:

- **Latency:** how long it takes to complete an operation, such as sending a request and receiving a response.
- **Bandwidth:** how much data or work can be transferred per unit of time.

The lecture then uses a simple HTTP web page request as an example of a two-node distributed system. The two nodes are:

- **Client:** the browser or program requesting the web page.
- **Server:** the machine serving the HTML page.

The client talks to the server using HTTP. HTTP itself runs on top of TCP, which provides a reliable byte stream between the two machines. At the HTTP level, the request and response contain headers such as `Content-Type`, `Accept`, and `User-Agent`. These headers carry metadata that helps the client and server understand how to communicate and interpret the data being exchanged.

Underneath the HTTP abstraction, the data may be split across multiple network packets. These packets flow through a TCP connection as a stream of bytes, and TCP is responsible for delivering them reliably and in order. The receiving side does not usually need to think in terms of individual packets; it can treat the data as a continuous stream.

The main takeaway is that, for now, it is safe to think of a request as one message and a response as another message. The lower-level networking details matter, but they can be abstracted away when reasoning about many distributed systems concepts.

## References

- [Distributed Systems 1.2: Martin Kleppmann](https://youtu.be/1F3DEq8ML1U?si=U0sVgoGiomsAcqxl)

