defmodule KandaGLAMWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use KandaGLAMWeb, :public_view
  use Phoenix.LiveView

  alias Phoenix.LiveView.JS

  import KandaGLAMWeb.Greeting

  defp show_active_tab(js, to) do
    js
    |> JS.hide(to: "div.tab-content")
    |> JS.show(
      to: to,
      transition: {"ease-out duration-500", "opacity-0", "opacity-100"},
      time: 500
    )
  end

  defp set_active_tab(js \\ %JS{}, tab) do
    js
    |> JS.remove_class("active-tab-item", to: "div.active-tab-item")
    |> JS.add_class("active-tab-item", to: tab)
  end
end
