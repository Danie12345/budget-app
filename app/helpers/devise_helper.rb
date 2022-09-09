module DeviseHelper
  def flashes!
    all = ''
    flash.each do |type, msg|
      all += msg
    end
    all
  end
end