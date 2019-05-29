# Setup

0. Get your Grove Particle board transferred into your own Particle.io account. WARNING: NO OFFICIAL GROVE APP WILL WORK AFTER YOU DO THIS.

1. Install [particle-cli](https://github.com/particle-iot/particle-cli) in this working directory.

2. Run `./p login`

# Real Time control

Use the following scripts to control things in real time.

```
./fans-control <off|low|medium|high> <duration minutes 0-9999>
```

```
./lights-control <intensity % 0-100> <color % 0-100> <duration minutes 0-9999>
```

```
./pumps-control <on|off> <duration minutes 0-9999>
```

Use the following scripts to schedule lights and pumps and set default behaviors for fans and heater:

```
./fans-schedule <off|low|medium|high>
```

```
./heater-schedule <temperature in degrees Celcius, or 0 for off>
```

```
./lights-schedule <garden|seedling|aquarium> <intensity %> <color %> <sunrise HHMM> <sunrise duration in mins> <sunset HHMM> <sunset duration in mins>
```

```
./pumps-schedule <minutes on> <minutes off>
```
