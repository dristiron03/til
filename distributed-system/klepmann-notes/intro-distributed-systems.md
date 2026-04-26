# Distributed Systems 1.1: Introduction

**Date:** 2025-12-29
**Category:** distributed-systems

The [video](https://youtu.be/UEAMfLPZZhE?si=zwdQIEf10tZqfnr_) starts with describing the technique with a single process, multiple threads.
With single process, we have the leverage of shared space through which multiple threads can communicate.

The same is not true, we have multiple process running across different machines. And the way these processes need
to communicate is over the network.
So, we have to think about different ways to share data and messages in such scenarios.

### Why make a system distributed ??

It might not be required in most cases to make your system distributed; and that's why we do vertical scaling instead
of horizontal scaling. But high QPS, and huge server costs kicking in; we need to find ways to make it horizontally scalable.<br/>
*Note: horizontal scaling is a method/application of distributed systems.*

OP gives the below reasons:
1. Better reliability -> even if one of your node fails, your system overall keeps running.
2. Better performance -> you can locate your nodes/servers in different geographical locations to keep
turnaround times to minimum for audience across the globe.
3. To solve problems with large amount of data -> You cannot fit all of the data in one machine, you need to split
them across machines.


### Challenges
We saw the benefits of distributed system above, then why not always try to make our systems distributed ?
OP mentions the below reasons:
1. Network is unreliable
2. Processes may crash
3. Above can happen non-deterministically and we might not know at all

We cannot remove these problems altogether, rather we have to make our system prone to these challenges i.e. fault tolerant system where units inside it can fail, but the system as a whole keeps running.

<br/><br/>
**If your usecase fits well in a single machine, without much headache. Do not try to over-engineer**

## References

- [Distributed Systems 1.1: Martin Kleppmann](https://youtu.be/UEAMfLPZZhE?si=zwdQIEf10tZqfnr_)

