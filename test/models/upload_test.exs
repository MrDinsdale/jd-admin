defmodule JdAdmin.UploadTest do
  use JdAdmin.ModelCase

  alias JdAdmin.Upload

  @valid_attrs %{full_url: "some content", thumb_url: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Upload.changeset(%Upload{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Upload.changeset(%Upload{}, @invalid_attrs)
    refute changeset.valid?
  end
end
