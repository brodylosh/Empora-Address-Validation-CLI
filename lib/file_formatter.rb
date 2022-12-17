class FileFormatter
    attr_accessor :input_addresses, :formatted_addresses

    def initialize(file)
        @input_addresses = CSV.read(file, :headers=>true)
        @formatted_addresses = []
        @input_addresses.each do |row|
            @formatted_addresses.push(row['Street'] + ', ' + row['City'] + ', ' + row['Zipcode'])
        end  
    end
end

        
        
        
        
        
        
        
        
        
        
        
#         puts

#         batch.each_with_index do |lookup, i|
#             candidates = lookup.result
#             if candidates.empty?
#               puts validated_addresses.input_addresses[i].yellow + ' -> ' + 'Invalid Address'.red
#               next
#             end

#             components = candidates[0].components
#             metadata = candidates[0].metadata
#             puts validated_addresses.input_addresses[i].yellow +  ' -> ' + "#{candidates[0].delivery_line_1}, #{components.city_name}, #{components.zipcode}-#{components.plus4_code}".green
        
#         end
#         puts
#     end
# end