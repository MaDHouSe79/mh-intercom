<p align="center">
    <img width="140" src="https://icons.iconarchive.com/icons/iconarchive/red-orb-alphabet/128/Letter-M-icon.png" />  
    <h1 align="center">Hi 👋, I'm MaDHouSe</h1>
    <h3 align="center">A passionate allround developer </h3>    
</p>

<p align="center">
  <a href="https://github.com/MaDHouSe79/mh-intercom/issues">
    <img src="https://img.shields.io/github/issues/MaDHouSe79/mh-intercom"/> 
  </a>
  <a href="https://github.com/MaDHouSe79/mh-intercom/watchers">
    <img src="https://img.shields.io/github/watchers/MaDHouSe79/mh-intercom"/> 
  </a> 
  <a href="https://github.com/MaDHouSe79/mh-intercom/network/members">
    <img src="https://img.shields.io/github/forks/MaDHouSe79/mh-intercom"/> 
  </a>  
  <a href="https://github.com/MaDHouSe79/mh-intercom/stargazers">
    <img src="https://img.shields.io/github/stars/MaDHouSe79/mh-intercom?color=white"/> 
  </a>
  <a href="https://github.com/MaDHouSe79/mh-intercom/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/MaDHouSe79/mh-intercom?color=black"/> 
  </a>      
</p>

<p align="center">
    <img src="https://komarev.com/ghpvc/?username=MaDHouSe79&label=Profile%20views&color=3464eb&style=for-the-badge&logo=star&abbreviated=true" alt="MaDHouSe79" style="padding-right:20px;" />
</p>

# MH Intercom
- The best intercom script for fivem.
- Add intercoms in your world for drivein at the mac or burgershot.
- or you can use it in the police HQ as intercom.

## Dependencies:
- [qb-core](https://github.com/qbcore-framework/qb-core) (Required)
- [pma-voice](https://github.com/AvarianKnight/pma-voice) (Required)

## Suports
- pma-voice
- TokoVOIP

# Exports Example
```lua
local job = 'ambulance'                       -- job 
local customerCoords = vector3(0.0, 0.0, 0.0) -- curtimer location
local workerCoords = vector3(0.0, 0.0, 0.0)   -- worker location
local number = 123456                         -- must by a unique number
local drivein = false                         -- is this a drive in
exports['mh-intercom']:AddIntercomLocation(job, customerCoords, workerCoords, number, drivein) -- Add Intercom Location 
```

# LICENSE
[GPL LICENSE](./LICENSE)<br />
&copy; [MaDHouSe79](https://www.youtube.com/@MaDHouSe79)