# Setup

WARNING: NO OFFICIAL GROVE APP WILL WORK AFTER YOU FOLLOW THESE STEPS.

1. Create a [Particle.io](https://particle.io) account.

2. Get your Grove Photon released from the corporate Particle.io account. Make sure you get the Device ID of your Photon when this happens, so that you can claim it.

3. Install particle-cli via `bash <( curl -sL https://particle.io/install-cli )`

4. Log into particle.io via `particle login`

5. Claim your device via `particle device add <your device ID here>`

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
