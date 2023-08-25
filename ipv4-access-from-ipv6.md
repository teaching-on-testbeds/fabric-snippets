
::: {.cell .code}
```python
# enable nodes to access IPv4-only resources, such as Github,
# even if the control interface is IPv6-only
from ipaddress import ip_address, IPv6Address
for node in slice.get_nodes():
    if type(ip_address(node.get_management_ip())) is IPv6Address:
        node.execute('echo "DNS=2a00:1098:2c::1" | sudo tee -a /etc/systemd/resolved.conf')
        node.execute('sudo service systemd-resolved restart')
        node.execute('echo "127.0.0.1 $(hostname -s)" | sudo tee -a /etc/hosts')
        node.execute('sudo rm -f /etc/resolv.conf; sudo ln -sv /run/systemd/resolve/resolv.conf /etc/resolv.conf')
```
:::
