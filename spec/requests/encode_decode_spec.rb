require "rails_helper"
test_url = "http://wikepedia.com/"

describe "EncodeDecodes", type: :request do
    it "encode returns a valid JSON response" do
        get "/encode?long=" + test_url

        # check that the request returns a success
        expect(response).to have_http_status(:success)
        # check that the response is of type JSON
        expect(response.content_type).to start_with("application/json")
        # check that there is a key "short" that corresponds to a non nil value
        expect(JSON.parse(response.body)["short"] != nil) 
    end

    it "decode returns a valid JSON response" do
        # get a valid shortened URL to decode by calling the encode endpoint
        get "/encode?long=" + test_url
        response_values = JSON.parse(response.body)
        shortened_url = response_values["short"]
        
        # use the encoded url in a call to the decode endpoint
        get "/decode?short=" + shortened_url.to_s
        # check that the request returns a success
        expect(response).to have_http_status(:success)
        # check that the response is of type JSON
        expect(response.content_type).to start_with("application/json")
        # check that there is a key "long" that corresponds to the original long url
        expect(JSON.parse(response.body)["long"] == test_url) 
    end
end