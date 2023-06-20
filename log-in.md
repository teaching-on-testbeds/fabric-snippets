
::: {.cell .markdown}
### Log into resources
:::


::: {.cell .markdown}
Now, we are finally ready to log in to our resources over SSH! Run the following cells, and observe the table output - you will see an SSH command for each of the resources in your topology.
:::


::: {.cell .code}
```python
import pandas as pd
pd.set_option('display.max_colwidth', None)
slice_info = [{'Name': n.get_name(), 'SSH command': n.get_ssh_command()} for n in slice.get_nodes()]
pd.DataFrame(slice_info).set_index('Name')
```
:::


::: {.cell .markdown}
Now, you can open an SSH session on any of the resources as follows:

* in Jupyter, from the menu bar, use File > New > Terminal to open a new terminal.
* copy an SSH command from the table, and paste it into the terminal. (Note that each SSH command is a single line, even if the display wraps the text to a second line! When you copy and paste it, paste it all together.)

You can repeat this process (open several terminals) to start a session on each resource. Each terminal session will have a tab in the Jupyter environment, so that you can easily switch between them.
:::
