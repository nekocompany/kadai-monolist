class Have < Ownership
  
  # def selfでクラスメソッドとなる
  # self(つまりHaveクラス).groupでクラスメソッドgroupを呼んでいる
  def self.ranking
    self.group(:item_id).order('count_item_id DESC').limit(10).count(:item_id)
  end
end
