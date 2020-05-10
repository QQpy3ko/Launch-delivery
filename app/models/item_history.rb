class ItemHistory < ApplicationRecord
  belongs_to :menu_item, autosave: true
end
