class HomeController < ApplicationController
  def index
    @recent_dreams = Dream.where(:visible => TRUE, :private => FALSE).limit(7)
    @top_rated_dreams = Dream.where(:visible=> TRUE, :private => FALSE).limit(5)
    # TODO add featured dream logic
    @featured_dream = Dream.first

    feelings = Dream.find(:all, :limit=> 30, :conditions => {:visible => TRUE}, :select => :feeling).map(&:feeling)
    @feeling_median = feelings.sort[feelings.length/2]
    @feeling_mean = feelings.instance_eval { reduce(:+) / size.to_f }
  end

end
