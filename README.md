## trafficcop

###Basic Idea/Motivation
* The idea is to allow people to connect to a wifi hotspot and then immediately be able to simulate shitty mobile network connections from developing countries.
* Lets developers easily test application performance with on slow connection in mind
* Relates to “mobile first” thinking by acknowledging “mobile first” means connections that are not always as reliable/speedy/generally good (i.e. 💩).

###Specification
* Ability to introduce extra:
 * Latency (delay)
 * Jitter (variance of latency/delay)
 * Packet loss
 * Bandwidth limitations
 * Per MAC address throttling → i.e. web interface such that you can go and adjust the setting for your client only.
* Stretch goals:
 * Simulate duplicate packets
 * Out of order arrival
 * Force TCP retransmission

Accessible at http://networkemulation.local (or something)
