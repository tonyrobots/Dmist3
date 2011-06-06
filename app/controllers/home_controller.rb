class HomeController < ApplicationController
  def index
    @dreams = Dream.where(:visible => TRUE, :private => FALSE).limit(5)
    # TODO add featured dream logic
    @featured_dream = Dream.first

    feelings = Dream.find(:all, :limit=> 30, :conditions => {:visible => TRUE}, :select => :feeling).map(&:feeling)
    @feeling_median = feelings.sort[feelings.length/2]
    @feeling_mean = feelings.instance_eval { reduce(:+) / size.to_f }
  end

end
