
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
            next if student == partner
            next if student.id < partner.id
            edge = @graphviz.add_edge(student.name, partner.name)
            edge[:label] = "#{my_project.project.name}"
            edge[:fontsize] = 8
          end
        end
      end
    end
    image_path = "graphviz/3graph.png"
    @graphviz.output( :png => "app/assets/images/#{image_path}")
    image_path
  end

end

# Visualization.new.generate_graph(["a", "b", "c"])
