# CAMPUS

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
| CAMPUS | leaf | L2L1A | 172.100.100.105/24 | vEOS-LAB | Provisioned |
| CAMPUS | leaf | L2L1B | 172.100.100.106/24 | vEOS-LAB | Provisioned |
| CAMPUS | leaf | L2L2A | 172.100.100.107/24 | vEOS-LAB | Provisioned |
| CAMPUS | leaf | L2L2B | 172.100.100.108/24 | vEOS-LAB | Provisioned |
| CAMPUS | l3spine | SPL1 | 172.100.100.101/24 | vEOS-LAB | Provisioned |
| CAMPUS | l3spine | SPL2 | 172.100.100.102/24 | vEOS-LAB | Provisioned |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

## Fabric Switches with inband Management IP
| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

# Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| leaf | L2L1A | Ethernet1 | l3spine | SPL1 | Ethernet3 |
| leaf | L2L1A | Ethernet2 | l3spine | SPL2 | Ethernet3 |
| leaf | L2L1A | Ethernet3 | mlag_peer | L2L1B | Ethernet3 |
| leaf | L2L1A | Ethernet4 | mlag_peer | L2L1B | Ethernet4 |
| leaf | L2L1B | Ethernet1 | l3spine | SPL1 | Ethernet4 |
| leaf | L2L1B | Ethernet2 | l3spine | SPL2 | Ethernet4 |
| leaf | L2L2A | Ethernet1 | l3spine | SPL1 | Ethernet5 |
| leaf | L2L2A | Ethernet2 | l3spine | SPL2 | Ethernet5 |
| leaf | L2L2A | Ethernet3 | mlag_peer | L2L2B | Ethernet3 |
| leaf | L2L2A | Ethernet4 | mlag_peer | L2L2B | Ethernet4 |
| leaf | L2L2B | Ethernet1 | l3spine | SPL1 | Ethernet6 |
| leaf | L2L2B | Ethernet2 | l3spine | SPL2 | Ethernet6 |
| l3spine | SPL1 | Ethernet1 | mlag_peer | SPL2 | Ethernet1 |
| l3spine | SPL1 | Ethernet2 | mlag_peer | SPL2 | Ethernet2 |

# Fabric IP Allocation

## Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |

## Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |

## Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 192.168.0.0/24 | 256 | 2 | 0.79 % |

## Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| CAMPUS | SPL1 | 192.168.0.1/32 |
| CAMPUS | SPL2 | 192.168.0.2/32 |

## VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |

## VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
