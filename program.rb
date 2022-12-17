require_relative './config/environment'

class Program
    attr_accessor :file

    @@auth_id = ENV['SMARTY_AUTH_ID']
    @@auth_token = ENV['SMARTY_AUTH_TOKEN']
    
    def initialize(file)
        client = SmartyClient.build(@@auth_id, @@auth_token)

        formatted_file = FileFormatter.new(file)
        
        smarty = SmartyValidation.new(client, formatted_file)
        smarty.execute
        smarty.get_output
    end
end

if ARGV.empty?
    puts
    puts 'This command requires an argument. Please include the file that you wish the program to validate.'.red
    puts 'Example: ' + 'ruby program.rb file.csv'.cyan
    puts
else
    Program.new(ARGV[0])
end