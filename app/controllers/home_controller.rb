class HomeController < ApplicationController
  def index
    @recent_dreams = Dream.where(:visible => TRUE, :private => FALSE).limit(7)
    @most_interesting_dreams = Dream.order("rating_average_interestingness DESC").limit(7)
    @best_written_dreams = Dream.order("rating_average_writing DESC").limit(7)
    @weirdest_dreams = Dream.order("rating_average_weirdness DESC").limit(7)
    
    # TODO add featured dream logic
    @featured_dream = Dream.first

    feelings = Dream.find(:all, :limit=> 30, :conditions => {:visible => TRUE}, :select => :feeling).map(&:feeling)
    @feeling_median = feelings.sort[feelings.length/2]
    @feeling_mean = feelings.instance_eval { reduce(:+) / size.to_f }
  end

end
