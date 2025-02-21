# Stateful Processes

* Processes can also be used to maintain state
* By recursively looping on function calls they remain alive

```elixir
# stateful.ex
defmodule StatefulProcesses do
  def loop() do
    state = :hi
    receive do
      {:get_state, requestor} ->
      send(requestor, state)
      loop()
    end
  end
end
```
