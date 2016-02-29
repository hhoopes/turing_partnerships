class AnalyticsController < ApplicationController
  def visualization
    @image_path = Visualization.new.generate_graph(Student.all)
    render :visualization
  end
end
