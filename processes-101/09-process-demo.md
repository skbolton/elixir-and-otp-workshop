# Processes Demo

Lightweight, synchronous, code execution contexts with isolation guarantees

```elixir
spawn(fn -> IO.puts "hello, world!" end)
```

* `spawn`
* PID's
* `self` 
* `Process.alive?`
* `Enum.each(0..200_000)`
* `spawn(1 / 0)`
* `link`
* `spawn_link`
