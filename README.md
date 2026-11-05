![Lober](modified-files/pfsense272/lober.gif)

# Trolls
- mv usr/local/www/fireball_rules.php usr/local/www/firewall_rules.php
- mv usr/local/www/cornhill.inc usr/local/www/head.inc

# Rules for messing with teams pfSense
NEVER DISABLE LAN INTERFACE

### Breaks:
Disable WAN through WebGUI, if done through cli using ifconfig, it wont show on WebGUI when they go to fix it

# Important commands
## pfctl: firewall rules
- F all: flush all rules
- d: disable firewall