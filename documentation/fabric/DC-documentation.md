# DC

# Table of Contents

- [Fabric Switches and Management IP](#fabric-switches-and-management-ip)
  - [Fabric Switches with inband Management IP](#fabric-switches-with-inband-management-ip)
- [Fabric Topology](#fabric-topology)
- [Fabric IP Allocation](#fabric-ip-allocation)
  - [Fabric Point-To-Point Links](#fabric-point-to-point-links)
  - [Point-To-Point Links Node Allocation](#point-to-point-links-node-allocation)
  - [Loopback Interfaces (BGP EVPN Peering)](#loopback-interfaces-bgp-evpn-peering)
  - [Loopback0 Interfaces Node Allocation](#loopback0-interfaces-node-allocation)
  - [VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)](#vtep-loopback-vxlan-tunnel-source-interfaces-vteps-only)
  - [VTEP Loopback Node allocation](#vtep-loopback-node-allocation)

# Fabric Switches and Management IP

| POD | Type | Node | Management IP | Platform | Provisioned in CloudVision |
| --- | ---- | ---- | ------------- | -------- | -------------------------- |
| DC | l3leaf | EL1 | 192.168.0.113/24 | vEOS-LAB | Provisioned |
| DC | l3leaf | EL2 | 192.168.0.114/24 | vEOS-LAB | Provisioned |
| DC | l3leaf | L1A | 192.168.0.115/24 | vEOS-LAB | Provisioned |
| DC | l3leaf | L1B | 192.168.0.116/24 | vEOS-LAB | Provisioned |
| DC | l3leaf | L2A | 192.168.0.115/24 | vEOS-LAB | Provisioned |
| DC | l3leaf | L2B | 192.168.0.116/24 | vEOS-LAB | Provisioned |
| DC | spine | S1 | 192.168.0.11/24 | vEOS-LAB | Provisioned |
| DC | spine | S2 | 192.168.0.12/24 | vEOS-LAB | Provisioned |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

## Fabric Switches with inband Management IP
| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

# Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| l3leaf | EL1 | Ethernet1 | spine | S1 | Ethernet1 |
| l3leaf | EL1 | Ethernet2 | spine | S2 | Ethernet1 |
| l3leaf | EL2 | Ethernet1 | spine | S1 | Ethernet2 |
| l3leaf | EL2 | Ethernet2 | spine | S2 | Ethernet2 |
| l3leaf | L1A | Ethernet1 | spine | S1 | Ethernet3 |
| l3leaf | L1A | Ethernet2 | spine | S2 | Ethernet3 |
| l3leaf | L1A | Ethernet3 | mlag_peer | L1B | Ethernet3 |
| l3leaf | L1A | Ethernet4 | mlag_peer | L1B | Ethernet4 |
| l3leaf | L1B | Ethernet1 | spine | S1 | Ethernet4 |
| l3leaf | L1B | Ethernet2 | spine | S2 | Ethernet4 |
| l3leaf | L2A | Ethernet1 | spine | S1 | Ethernet5 |
| l3leaf | L2A | Ethernet2 | spine | S2 | Ethernet5 |
| l3leaf | L2A | Ethernet3 | mlag_peer | L2B | Ethernet3 |
| l3leaf | L2A | Ethernet4 | mlag_peer | L2B | Ethernet4 |
| l3leaf | L2B | Ethernet1 | spine | S1 | Ethernet6 |
| l3leaf | L2B | Ethernet2 | spine | S2 | Ethernet6 |

# Fabric IP Allocation

## Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |
| 100.64.2.0/24 | 256 | 24 | 9.38 % |

## Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |
| EL1 | Ethernet1 | 100.64.2.1/31 | S1 | Ethernet1 | 100.64.2.0/31 |
| EL1 | Ethernet2 | 100.64.2.3/31 | S2 | Ethernet1 | 100.64.2.2/31 |
| EL2 | Ethernet1 | 100.64.2.7/31 | S1 | Ethernet2 | 100.64.2.6/31 |
| EL2 | Ethernet2 | 100.64.2.9/31 | S2 | Ethernet2 | 100.64.2.8/31 |
| L1A | Ethernet1 | 100.64.2.13/31 | S1 | Ethernet3 | 100.64.2.12/31 |
| L1A | Ethernet2 | 100.64.2.15/31 | S2 | Ethernet3 | 100.64.2.14/31 |
| L1B | Ethernet1 | 100.64.2.19/31 | S1 | Ethernet4 | 100.64.2.18/31 |
| L1B | Ethernet2 | 100.64.2.21/31 | S2 | Ethernet4 | 100.64.2.20/31 |
| L2A | Ethernet1 | 100.64.2.25/31 | S1 | Ethernet5 | 100.64.2.24/31 |
| L2A | Ethernet2 | 100.64.2.27/31 | S2 | Ethernet5 | 100.64.2.26/31 |
| L2B | Ethernet1 | 100.64.2.31/31 | S1 | Ethernet6 | 100.64.2.30/31 |
| L2B | Ethernet2 | 100.64.2.33/31 | S2 | Ethernet6 | 100.64.2.32/31 |

## Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 100.64.0.0/24 | 256 | 8 | 3.13 % |

## Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| DC | EL1 | 100.64.0.11/32 |
| DC | EL2 | 100.64.0.12/32 |
| DC | L1A | 100.64.0.13/32 |
| DC | L1B | 100.64.0.14/32 |
| DC | L2A | 100.64.0.15/32 |
| DC | L2B | 100.64.0.16/32 |
| DC | S1 | 100.64.0.1/32 |
| DC | S2 | 100.64.0.2/32 |

## VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |
| 100.64.1.0/24 | 256 | 6 | 2.35 % |

## VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
| DC | EL1 | 100.64.1.11/32 |
| DC | EL2 | 100.64.1.12/32 |
| DC | L1A | 100.64.1.13/32 |
| DC | L1B | 100.64.1.13/32 |
| DC | L2A | 100.64.1.15/32 |
| DC | L2B | 100.64.1.15/32 |
