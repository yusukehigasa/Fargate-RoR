articles = [
  [1, "記事タイトル　その1", "初めての投稿。本文あいうえお。"],
  [2, "記事タイトル　その2", "二回目の投稿。本文かきくけこ。"],
  [3, "記事タイトル　その3", "三回目の投稿。本文さしすせそ。"]
]

unless Article.all.exists?
  articles.each_with_index do |article, i|
    Article.create(
      id: article[0],
      title: article[1],
      body: article[2],
      released_at: DateTime.now
    )
  end
else
  puts "Article has already some records, and Skipped."
end
