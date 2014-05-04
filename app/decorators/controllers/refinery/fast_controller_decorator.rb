Refinery::FastController.class_eval do
  def wymiframe
    render :template => "/refinery/wymiframe", :layout => false
  end
end
