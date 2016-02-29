class AnalyticsController < ApplicationController
  def index
    @image_path = Visualization.new.generate_graph(Student.all)
    render :visualization
  end
end
