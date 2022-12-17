require 'smartystreets_ruby_sdk/batch'
require 'smartystreets_ruby_sdk/us_street/lookup'
require_relative '../lib/smarty_validation'

describe 'SmartyValidation' do
    describe '#execute' do
        it 'calls send_batch on client with an instance of SmartyStreets::Batch' do
            client = double("Client")
            allow(client).to receive(:send_batch)
            filename = 'addresses.csv'
            formatted_file = FileFormatter.new(filename)
            smarty_validation = SmartyValidation.new(client, formatted_file)
            expect(client).to receive(:send_batch).with(smarty_validation.instance_variable_get(:@batch))
            smarty_validation.execute
        end
    end
end
