require_relative '../lib/smarty_client'
require 'smartystreets_ruby_sdk/static_credentials'
require 'smartystreets_ruby_sdk/client_builder'

describe 'client' do
    it 'is an instance of SmartyClient' do
        auth_id = 'test'
        auth_token = 'test'
        client = SmartyClient.build(auth_id, auth_token)
        expect(client).to be_instance_of(SmartyStreets::USStreet::Client)
    end
end