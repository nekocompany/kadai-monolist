class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  
  
  has_many :ownerships
  has_many :items, through: :ownerships
  
  
  # want関連
  has_many :wants
  has_many :want_items, through: :wants, class_name: 'Item', source: :item
  
  # have関連 命名規則上 class_nameを明示
  has_many :haves, class_name: 'Have'
  has_many :have_items, through: :haves, class_name: 'Item', source: :item
  
  
  # want関連
  def want(item)
    self.wants.find_or_create_by(item_id: item.id)
  end

  def unwant(item)
    want = self.wants.find_by(item_id: item.id)
    want.destroy if want
  end

  def want?(item)
    self.want_items.include?(item)
  end
  
  
  # have関連
  def have(item)
    self.haves.find_or_create_by(item_id: item.id)
  end

  def unhave(item)
    have = self.haves.find_by(item_id: item.id)
    have.destroy if have
  end

  def have?(item)
    self.have_items.include?(item)
  end
  
end
