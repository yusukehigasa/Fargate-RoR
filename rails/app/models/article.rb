class Article < ApplicationRecord
  validates :title,
    presence: true,
    length: { maximum: 50 }

  validates :body,
    presence: true,
    length: { maximum: 200 }

  validates :released_at,
    presence: true

  enum status: {
    draft: 0, #下書き
    publish: 1 #公開
  }
end
