class RankingsController < ApplicationController
  def want
    
    # Want.〇〇でクラスからメソッドを呼び出している=クラスメソッド(?)
    @ranking_counts = Want.ranking
    @items = Item.find(@ranking_counts.keys)
  end
end
