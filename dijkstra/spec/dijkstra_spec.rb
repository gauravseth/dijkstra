require 'spec_helper'

describe Dijkstra do
 
 before :each do
    @dijks = Dijkstra.new
    @dijks.add_vertex('b',{'a' => 7, 'f'=>2})
    @dijks.add_vertex('c',{'a' => 8, 'f'=>6, 'g'=> 4})
    @dijks.add_vertex('d',{'f'=>8})
    @dijks.add_vertex('e',{'h'=>1})
    @dijks.add_vertex('f',{'b' => 2, 'c'=>6, 'd'=>8, 'g' => 9, 'h'=> 3})
    @dijks.add_vertex('g',{'c' => 4, 'f'=>9})
    @dijks.add_vertex('h',{'e' => 1, 'f'=>3}) 
  end
  


  describe "#get_sourch_path_from_a_to_b" do
    it "it will return distance from source node a to b" do
        @dijks.get_sourch_path_from_node_to_node('a','b')[0].should  == 7.0
        @dijks.get_sourch_path_from_node_to_node('a','b')[1].should  == 'a'
    end
 end

  describe "#get_sourch_path_from_a_to_c" do
    it "it will return distance from source node a to c" do
        @dijks.get_sourch_path_from_node_to_node('a','c')[0].should  == 8.0
        @dijks.get_sourch_path_from_node_to_node('a','c')[1].should  == 'a'
    end
  end
  
  describe "#get_sourch_path_from_a_to_d" do
    it "it will return distance from source node a to d" do
        @dijks.get_sourch_path_from_node_to_node('a','d')[0].should  == 17.0
        @dijks.get_sourch_path_from_node_to_node('a','d')[1].should  == 'abf'
    end
  end
  
   describe "#get_sourch_path_from_a_to_e" do
    it "it will return distance from source node a to e" do
        @dijks.get_sourch_path_from_node_to_node('a','e')[0].should  == 13.0
        @dijks.get_sourch_path_from_node_to_node('a','e')[1].should  == 'abfh'
    end
  end
  
   describe "#get_sourch_path_from_a_to_f" do
    it "it will return distance from source node a to f" do
        @dijks.get_sourch_path_from_node_to_node('a','f')[0].should  == 9.0
        @dijks.get_sourch_path_from_node_to_node('a','f')[1].should  == 'ab'
    end
  end
  
   describe "#get_sourch_path_from_a_to_g" do
    it "it will return distance from source node a to g" do
        @dijks.get_sourch_path_from_node_to_node('a','g')[0].should  == 12.0
        @dijks.get_sourch_path_from_node_to_node('a','g')[1].should  == 'ac'
    end
  end
  
   describe "#get_sourch_path_from_a_to_h" do
    it "it will return distance from source node a to h" do
        @dijks.get_sourch_path_from_node_to_node('a','h')[0].should  == 12.0
        @dijks.get_sourch_path_from_node_to_node('a','h')[1].should  == 'abf'
    end
  end
  
end

