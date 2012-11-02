module ApplicationHelper
  
  def check_similiraty x,y
    begin
      white = Text::WhiteSimilarity.new
      x = x.to_s
      y = y.to_s
      white.similarity(x,y) > 0.8 ? 'success' : ''
    rescue Exception => e
      ''
    end
  end
end
