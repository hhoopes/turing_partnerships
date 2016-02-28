class AnalyticsController < ApplicationController
  def visualization
    @image_route = Visualization.new.generate_graph(Student.all)
    render :visualization
  end
end
