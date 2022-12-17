require_relative '../lib/file_formatter'
require 'csv'

describe 'formatted_file' do
    it 'is an instance of FileFormatter' do
        filename = 'addresses.csv'
        formatted_file = FileFormatter.new(filename)
        expect(formatted_file.input_addresses.length).to eq(2)
        expect(formatted_file.formatted_addresses[0]).to eq("143 e Maine Street, Columbus, 43215")
    end
end
