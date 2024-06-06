defmodule KandaGLAMWeb.Greeting do
  use KandaGLAMWeb, :html
  use Phoenix.Component

  def greet(assigns) do
    ~H"""
    <p>Hello, <%= @name %>!</p>
    """
  end
end
