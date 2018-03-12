class Want < Ownership
  def self.ranking
    # 正解
    self.group(:item_id).order('count_item_id DESC').limit(10).count(:item_id)
    
    # 動かない
    #self.group(:item_id).count(:item_id).order('count_item_id DESC').limit(10)
    
    # 動かない
    #self.group(:item_id).order('count_item_id DESC').count(:item_id).limit(10)
    
    # 動かない
    #self.group(:item_id).limit(10).count(:item_id).order('count_item_id DESC')
    
  end
end
