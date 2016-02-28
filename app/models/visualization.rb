
require 'pry'
# require 'ruby-graphviz'

class Visualization
  attr_reader :graphviz

  def initialize
    @graphviz = GraphViz.new( :G, :type => :graph )
    # @student_array = student_array
  end

  def generate_graph(student_array)
    student_array.each do |student|
      @graphviz.add_node(student.name)
      # student.par
      @graphviz.add_edge(student)
    end
    image_path = "app/assets/images/graphviz/#{Time.now}_graph.png"
    @graphviz.output( :png => image_path)
    image_path
  end
end

# v = Visualization.new.generate_graph
