
require 'pry'
require 'ruby-graphviz'

class Visualization
  attr_reader :graphviz

  def initialize
    @graphviz = GraphViz.new( :G, :type => :graph )
  end

  def generate_graph(student_array)
    student_array.each do |student|
      @graphviz.add_node(student.name)
    end
    student_array.each do |student|
      if student.my_projects
        student.my_projects.each do | my_project |
          student.partners(my_project).each do |partner|
            return if student == partner
            @graphviz.add_node(student.name, partner.name)
          end
        end
      end
    end
    image_path = "app/assets/images/graphviz/graph.png"
    @graphviz.output( :png => image_path)
  end

end

# Visualization.new.generate_graph(["a", "b", "c"])
