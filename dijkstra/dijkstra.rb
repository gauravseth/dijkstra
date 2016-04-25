class  Dijkstra
  
  def initialize
    @vertics_hash = {}
  end
  
  def add_vertex(source,edge)
    @vertics_hash[source]= edge
  end

  def get_sort_path(sorce_edge) 
    final_hash = {}
    result_hash = {sorce_edge => [1.0/0.0,sorce_edge]}
    result_path_node = []
    @vertics_hash.keys.each do |k|
      arr = []
      arr << 1.0/0.0 # to save infinite as value in the beginning
      arr << k
    result_hash[k]=arr
    end
    i = 0
    child_hash = {}
    
    child_hash[sorce_edge] = [1.0/0.0,sorce_edge]
    while i != @vertics_hash.keys.length
      child_hash.each do |k,v|
        sorce_v= k
        child_hash = get_direct_link_shorage_value(@vertics_hash,sorce_v,child_hash)
        if result_hash and !result_hash.empty?
          child_hash.each do|ck,cv|
            if result_hash[ck] 
              if result_hash[k][0] == 1.0/0.0
                if result_hash[ck][0] >  cv[0]
                  result_hash[ck] = cv 
                end
              else
                if result_hash[ck][0] > (result_hash[k][0].to_f + cv[0])
                  result_hash[ck][0] =  result_hash[k][0].to_f + cv[0] 
                  result_hash[ck][1] =  "#{result_hash[k][1]}" + "#{cv[1]}" 
                end
              end
              
            else 
              if result_hash[k][0] == 1.0/0.0
                 result_hash[ck] = v
              else
                result_hash[ck][0] =  result_hash[k][0].to_f + v[0]
                result_hash[ck][1] =  "#{result_hash[k][1] + v[1]}"
              end
              
            end
          end 
        else
          result_hash = child_hash 
        end
      end
      i += 1 
    end
    return result_hash
  end
# get direct linked node with distance
  def get_direct_link_shorage_value(hash,source,child_hash)
    child_result = {}
    hash.each do|k,v_hash|
      v_hash.each do |ki,v|
        if ki == source
          if child_hash[ki] and child_hash[ki][0] < v[0]
          else
            child_result[k] = [v,ki]
	        end
        end
      end     
    end
  return child_result  
  end
  
  def get_sourch_path_from_node_to_node(source,dist)
    all_shortage_patch_hsh = get_sort_path(source) 
    length_path = all_shortage_patch_hsh[dist]
    #path_string = "Shortage distance from #{source} to #{dist} is #{length_path[0]} and path  is #{length_path[1]}"
    #return path_string
    return length_path
  end
  
end

# create hash 
  
