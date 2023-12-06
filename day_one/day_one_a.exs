defmodule DayOne do
  def a(path) do
    File.stream!(path)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&process_line_ints/1)
    |> Enum.to_list()
  end

  def process_line_ints(line) do
    [head | tail] = String.split(line, ~r/\D+/) |> Enum.reject(&(&1 == ""))

    case String.to_integer(head) do
      {:ok, first_int} ->
        case List.last(tail) |> String.to_integer() do
          {:ok, last_int} ->
            result = Integer.to_string(first_int) <> Integer.to_string(last_int)
            IO.puts(result)
            result

          _ ->
            nil
        end

      _ ->
        nil
    end
  end

  def test_read(path) do
    res =
      File.stream!(path)
      |> Stream.map(&String.trim/1)
      |> Enum.to_list()

    IO.puts(res)
  end
end

# DayOne.a("input1.txt")
# DayOne.test_read("input1.txt")
res = DayOne.process_line_ints("he1lo2")
IO.puts("12" == res)

res2 = DayOne.process_line_ints("anoth3r")
IO.puts(res2)
