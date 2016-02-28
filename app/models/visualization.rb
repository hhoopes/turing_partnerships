require 'ruby-graphviz'
require 'pry'

class Visualization
  attr_reader :graphviz

  def initialize
    @graphviz = GraphViz.new( :G, :type => :graph )
    # @student_array = student_array
  end

  def generate_graph(student_array)
    student_array.each_with_index do |student, i|
      @graphviz.add_node(student)
      if i > 0
        @graphviz.add_edge(student, student_array[i-1])
      end
    end


    image = "graph.png"
    puts image
    binding.pry
    @graphviz.output( :png => image)
    image
  end
  # # Create two nodes
  # hello = g.add_nodes( "Hello" )
  # world = g.add_nodes( "World" )
  #
  # # Create an edge between the two nodes
  # g.add_edges( hello, world )
  #
  # # Generate output image
  # g.output( :png => "hello_world.png" )

end

v = Visualization.new
v.generate_graph(["bob", 'sue', "sally", 'd', 'e'])
