defmodule FirstProject.FAQFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FirstProject.FAQ` context.
  """

  @doc """
  Generate a faq.
  """
  def faq_fixture(attrs \\ %{}) do
    {:ok, faq} =
      attrs
      |> Enum.into(%{
        question: "some question",
        answer: "some answer",
        vote_count: 42
      })
      |> FirstProject.FAQ.create_faq()

    faq
  end
end
