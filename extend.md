
::: {.cell .markdown}

### Extend your slice

If you don't plan to finish an experiment in one day, you can extend your slice. The following cell extends your reservation for 7 days.
:::

::: {.cell .code}
```python
from datetime import datetime
from datetime import timezone
from datetime import timedelta

# Set end date to 7 days from now
end_date = (datetime.now(timezone.utc) + timedelta(days=7)).strftime("%Y-%m-%d %H:%M:%S %z")
slice.renew(end_date)
```
:::


