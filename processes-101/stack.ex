defmodule Stack do
  def new() do
    spawn(Stack, :loop, [_initial_stack = []])
  end

  def push(stack, item) do
    send(stack, {:push, item})
    :ok
  end

  def pop(stack) do
    send(stack, {:pop, self()})

    receive do
      {:popped_item, item} ->
        item
    end
  end

  def peek(stack) do
    send(stack, {:peek, self()})

    receive do
      {:peeked_item, item} ->
        item
    end
  end
  
  def loop(stack) do
    receive do
      {:push, item} ->
        loop([item | stack])

      {:pop, requestor} ->
        [first | new_stack] = stack
        send(requestor, {:popped_item, first})
        loop(new_stack)

      {:peek, requestor} ->
        [first | _rest] = stack
        send(requestor, {:peeked_item, first})
        loop(stack)
    end
  end
end
