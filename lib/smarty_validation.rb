class SmartyValidation

    Lookup = SmartyStreets::USStreet::Lookup
    
    def initialize(client, validated_file)
        @client = client
        @validated_file = validated_file
        @batch = SmartyStreets::Batch.new
        @validated_file.input_addresses.each_with_index do |row, i|
            @batch.add(Lookup.new)
            @batch[i].street = row['Street']
            @batch[i].city = row['City']
            @batch[i].zipcode = row['Zipcode']
        end  
    end

    def execute  
        begin
            @client.send_batch(@batch)
        rescue SmartyStreets::SmartyError => err
            puts err
            return
        end
    end

    def get_output
        @batch.each_with_index do |lookup, i|
            candidates = lookup.result
            if candidates.empty?
              puts @validated_file.formatted_addresses[i].yellow + ' -> ' + 'Invalid Address'.red
              next
            end

            components = candidates[0].components
            metadata = candidates[0].metadata
            puts @validated_file.formatted_addresses[i].yellow +  ' -> ' + "#{candidates[0].delivery_line_1}, #{components.city_name}, #{components.zipcode}-#{components.plus4_code}".green
        end
    end
end