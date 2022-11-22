# WAN

# Table of Contents

- [Fabric Switches and Management IP](#fabric-switches-and-management-ip)
  - [Fabric Switches with inband Management IP](#fabric-switches-with-inband-management-ip)
- [Fabric Topology](#fabric-topology)
- [Fabric IP Allocation](#fabric-ip-allocation)
  - [Fabric Point-To-Point Links](#fabric-point-to-point-links)
  - [Point-To-Point Links Node Allocation](#point-to-point-links-node-allocation)
  - [Loopback Interfaces (BGP EVPN Peering)](#loopback-interfaces-bgp-evpn-peering)
  - [Loopback0 Interfaces Node Allocation](#loopback0-interfaces-node-allocation)
  - [ISIS CLNS interfaces](#isis-clns-interfaces)
  - [VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)](#vtep-loopback-vxlan-tunnel-source-interfaces-vteps-only)
  - [VTEP Loopback Node allocation](#vtep-loopback-node-allocation)

# Fabric Switches and Management IP

| POD | Type | Node | Management IP | Platform | Provisioned in CloudVision |
| --- | ---- | ---- | ------------- | -------- | -------------------------- |
| WAN | p | P1 | 10.30.30.104/24 | - | Provisioned |
| WAN | p | P2 | 10.30.30.106/24 | - | Provisioned |
| WAN | pe | PE1 | 10.30.30.101/24 | vEOS-LAB | Provisioned |
| WAN | pe | PE2 | 10.30.30.102/24 | vEOS-LAB | Provisioned |
| WAN | pe | PE3 | 10.30.30.103/24 | vEOS-LAB | Provisioned |
| WAN | pe | PE4 | 10.30.30.105/24 | vEOS-LAB | Provisioned |
| WAN | pe | PE5 | 10.30.30.105/24 | vEOS-LAB | Provisioned |
| WAN | rr | RR1 | 10.30.30.107/24 | vEOS-LAB | Provisioned |
| WAN | rr | RR2 | 10.30.30.108/24 | vEOS-LAB | Provisioned |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

## Fabric Switches with inband Management IP
| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

# Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| p | P1 | Ethernet1 | pe | PE1 | Ethernet1 |
| p | P1 | Ethernet2 | pe | PE2 | Ethernet2 |
| p | P1 | Ethernet3 | p | P2 | Ethernet3 |
| p | P1 | Ethernet4 | rr | RR1 | Ethernet4 |
| p | P2 | Ethernet1 | pe | PE3 | Ethernet1 |
| p | P2 | Ethernet4 | rr | RR2 | Ethernet4 |
| p | P2 | Ethernet5 | pe | PE4 | Ethernet5 |
| pe | PE1 | Ethernet2 | rr | RR1 | Ethernet2 |
| pe | PE2 | Ethernet1 | rr | RR1 | Ethernet1 |
| pe | PE3 | Ethernet2 | rr | RR2 | Ethernet2 |
| pe | PE4 | Ethernet6 | pe | PE5 | Ethernet6 |
| pe | PE5 | Ethernet5 | rr | RR2 | Ethernet5 |
| rr | RR1 | Ethernet3 | rr | RR2 | Ethernet3 |

# Fabric IP Allocation

## Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |

## Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |
| P1 | Ethernet1 | 100.70.100.1/31 | PE1 | Ethernet1 | 100.70.100.0/31 |
| P1 | Ethernet2 | 100.70.100.3/31 | PE2 | Ethernet2 | 100.70.100.2/31 |
| P1 | Ethernet3 | 100.70.100.4/31 | P2 | Ethernet3 | 100.70.100.5/31 |
| P1 | Ethernet4 | 100.70.100.6/31 | RR1 | Ethernet4 | 100.70.100.7/31 |
| P2 | Ethernet1 | 100.70.100.26/31 | PE3 | Ethernet1 | 100.70.100.27/31 |
| P2 | Ethernet4 | 100.70.100.24/31 | RR2 | Ethernet4 | 100.70.100.25/31 |
| P2 | Ethernet5 | 100.70.100.22/31 | PE4 | Ethernet5 | 100.70.100.23/31 |
| PE1 | Ethernet2 | 100.70.100.12/31 | RR1 | Ethernet2 | 100.70.100.13/31 |
| PE2 | Ethernet1 | 100.70.100.14/31 | RR1 | Ethernet1 | 100.70.100.15/31 |
| PE3 | Ethernet2 | 100.70.100.31/31 | RR2 | Ethernet2 | 100.70.100.30/31 |
| PE4 | Ethernet6 | 100.70.100.32/31 | PE5 | Ethernet6 | 100.70.100.33/31 |
| PE5 | Ethernet5 | 100.70.100.29/31 | RR2 | Ethernet5 | 100.70.100.28/31 |
| RR1 | Ethernet3 | 100.70.100.16/31 | RR2 | Ethernet3 | 100.70.100.17/31 |

## Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 100.70.1.0/24 | 256 | 2 | 0.79 % |
| 100.70.2.0/24 | 256 | 5 | 1.96 % |
| 100.70.3.0/24 | 256 | 2 | 0.79 % |

## Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| WAN | P1 | 100.70.3.1/32 |
| WAN | P2 | 100.70.3.2/32 |
| WAN | PE1 | 100.70.2.1/32 |
| WAN | PE2 | 100.70.2.2/32 |
| WAN | PE3 | 100.70.2.3/32 |
| WAN | PE4 | 100.70.2.4/32 |
| WAN | PE5 | 100.70.2.5/32 |
| WAN | RR1 | 100.70.1.1/32 |
| WAN | RR2 | 100.70.1.2/32 |

## ISIS CLNS interfaces

| POD | Node | CLNS Address |
| --- | ---- | ------------ |
| WAN | P1 | 49.0001.0000.0003.0001.00 |
| WAN | P2 | 49.0001.0000.0003.0002.00 |
| WAN | PE1 | 49.0001.0000.0002.0001.00 |
| WAN | PE2 | 49.0001.0000.0002.0002.00 |
| WAN | PE3 | 49.0001.0000.0002.0003.00 |
| WAN | PE4 | 49.0001.0000.0002.0004.00 |
| WAN | PE5 | 49.0001.0000.0002.0005.00 |
| WAN | RR1 | 49.0001.0000.0001.0001.00 |
| WAN | RR2 | 49.0001.0000.0001.0002.00 |

## VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |

## VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
