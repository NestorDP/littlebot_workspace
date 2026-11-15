Firmware
========

The firmware subsystem runs on the embedded controller and provides
low-level control of hardware peripherals and actuators.

Firmware changes should account for timing, resource limits, communication
protocols, and safe startup and shutdown behavior. Protocol changes must be
kept compatible with the software components that communicate with the
controller, or be accompanied by a migration plan.