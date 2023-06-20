# Snippets for FABRIC notebooks

This repository collects snippets that are commonly used across many FABRIC notebooks.


For example, an experiment might:

* Configure the FABRIC Jupyter environment (`fab-config.md`)
* Define the slice name and the experiment configuration (experiment specific, not in this repository)
* Reserve resources for the experiment and wait for them to be ready (`reserve-resources.md`)
* Configure the resources: add IPv4 addresses to experiment interfaces, bring interfaces up, add static routes, set up hosts files, enable IPv4 forwarding, install packages (`configure-resources.md`)
* Draw the slice topology (`draw-topo-detailed-labels.md` or `draw-topo.md`)
* Execute the experiment (experiment specific, not in this repository)
* Delete the resources in the slice (`delete-slice.md`)

Also in this repository, there is an example of a `Makefile` that generates a complete Python notebook for FABRIC using these snippets (with an example experiment configuration that is defined in the Makefile).
### Defining the experiment configuration

These snippets assume the experiment configuration is defined near the top of the notebook, including `slice_name`, `node_conf`, `net_conf`, `route_conf`, and `exp_conf`, as in the following example:

```python
slice_name="example-" + fablib.get_bastion_username()

node_conf = [
 {'name': "romeo",   'cores': 2, 'ram': 4, 'disk': 10, 'image': 'default_ubuntu_22', 'packages': ['mtr']}, 
 {'name': "juliet",  'cores': 2, 'ram': 4, 'disk': 10, 'image': 'default_ubuntu_22', 'packages': []}, 
 {'name': "hamlet",  'cores': 2, 'ram': 4, 'disk': 10, 'image': 'default_ubuntu_22', 'packages': []}, 
 {'name': "ophelia", 'cores': 2, 'ram': 4, 'disk': 10, 'image': 'default_ubuntu_22', 'packages': []}, 
 {'name': "router",  'cores': 2, 'ram': 4, 'disk': 10, 'image': 'default_ubuntu_22', 'packages': []}
]
net_conf = [
 {"name": "net0", "subnet": "10.0.0.0/24", "nodes": [{"name": "romeo",   "addr": "10.0.0.100"}, {"name": "juliet", "addr": None}, {"name": "router", "addr": "10.0.0.1"}]},
 {"name": "net1", "subnet": "10.0.1.0/24", "nodes": [{"name": "hamlet",   "addr": "10.0.1.100"}, {"name": "ophelia", "addr": "10.0.1.101"}, {"name": "router", "addr": "10.0.1.1"}]},
]
route_conf = [
 {"addr": "10.0.1.0/24", "gw": "10.0.0.1", "nodes": ["romeo"]}, 
 {"addr": "10.0.0.0/24", "gw": "10.0.1.1", "nodes": ["hamlet", "ophelia"]}
]
exp_conf = {'cores': sum([ n['cores'] for n in node_conf]), 'nic': sum([len(n['nodes']) for n in net_conf]) }
```
