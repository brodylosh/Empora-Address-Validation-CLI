class SmartyClient
    
    def self.build(id, token)
        credentials = SmartyStreets::StaticCredentials.new(id, token)
        return SmartyStreets::ClientBuilder.new(credentials).build_us_street_api_client
    end
end