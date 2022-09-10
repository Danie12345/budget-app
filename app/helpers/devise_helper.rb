module DeviseHelper
  def flashes!
    all = ''
    flash.each do |_type, msg|
      all += msg
    end
    all
  end
end
