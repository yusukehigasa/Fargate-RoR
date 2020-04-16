class ApplicationRecord < ActiveRecord::Base
  acts_as_paranoid #論理削除の利用
  self.abstract_class = true
end
