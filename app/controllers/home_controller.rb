class HomeController < ApplicationController
  def index
    @recent_dreams = Dream.where(:visible => TRUE, :private => FALSE).limit(7)
    
    # move this stuff to the model or maybe extend ajaxful_rating_jquery?! TODO
    # also, why doesn't this sort work?!?
    # @most_interesting_dreams = Dream.order("rating_average_interestingness DESC").limit(7)
    
    @most_interesting_dreams = Dream.where("rating_average_interestingness > 0").sort_by { |o| -o.rate_average(true, "interestingness") }
    @best_written_dreams = Dream.where("rating_average_writing > 0").sort_by { |o| -o.rate_average(true, "writing") }
    @weirdest_dreams = Dream.where("rating_average_weirdness > 0").sort_by { |o| -o.rate_average(true, "weirdness") }
    
    
    # TODO add featured dream logic
    @featured_dream = Dream.first

    feelings = Dream.find(:all, :limit=> 30, :conditions => {:visible => TRUE}, :select => :feeling).map(&:feeling)
    @feeling_median = feelings.sort[feelings.length/2]
    @feeling_mean = feelings.instance_eval { reduce(:+) / size.to_f }
  end

end
