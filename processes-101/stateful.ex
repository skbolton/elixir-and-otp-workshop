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

