# Message Passing

* Processes communicate with each other through message passing
* Every process has a "mailbox" where messages sent from other processes are stored

```elixir
us = self()
spawn(fn -> send(us, "hello my creator") end)
```
