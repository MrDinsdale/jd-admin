# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     JdAdmin.Repo.insert!(%JdAdmin.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias JdAdmin.Post
alias JdAdmin.Project

Repo.insert! %Post{
  title: "This is a test post",
  slug: "test-post",
  excerpt: "Florence fennel radicchio elephant",
  body: "Florence fennel hamburg parsley - ceylon spinach sweet pepper florence fennel scorzonera beet greens rutabaga common bean. Winter melon, bell pepper kale mustard! Guar water chestnut swiss chard, taro lamb's lettuce; sierra leone bologi carrot; kuka cauliflower sweet pepper mizuna greens hamburg parsley. Pea sprouts horseradish green bean lagos bologi. Plectranthus garbanzo velvet bean yacón summer purslane chard corn salad garden rocket - celery fava bean. Florence fennel radicchio elephant garlic mizuna greens turnip greens spring onion elephant foot yam. Black-eyed pea swiss chard fat hen kurrat tepary bean soybean - swiss chard prairie turnip drumstick. Ahipa, prussian asparagus courgette. Pumpkin ceylon spinach kale komatsuna mooli horse gram lizard's tail, kohlrabi water chestnut lentil celery garden rocket. Prairie turnip melokhia kuka bitterleaf horse gram kohlrabi. Orache komatsuna, greater plantain peanut sweet potato or kumara chickweed shallot horseradish radish nopal."
}
