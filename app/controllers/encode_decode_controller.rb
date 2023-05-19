require 'securerandom'
class EncodeDecodeController < ApplicationController
    def encode
        http_base = "http://short.est/"
        # getting long_url from the query string
        long = params[:long] .to_s
        # check that long url is a valid url  
        unless (long.match?(/(http|https):\/{1,2}[a-zA-Z0-9@:%._\\+~#?&\/\/=]+\.[a-z]+([-a-zA-Z0-9@:%._\\+~#?&\/\/=])*/))
            render status: 400
        else
            #converting url to a shortened url using the base and a random base64
            long_id = http_base + SecureRandom.urlsafe_base64(6).to_s
            # check to see if the id has already been used
            while UrlTable.find_by_url_id(long_id).present?
                # generate a new shortened url while the current one already exists in the table
                long_id = http_base + SecureRandom.urlsafe_base64(6).to_s 
            end
            # making a new row in the table for the long_url and its id
            new_row = UrlTable.create(long_url:long, url_id:long_id)
            # returning JSON with the shortened url
            render json: {short: new_row.url_id}
        end 
    end
    def decode
        # getting the shortened url from the query string
        short = params[:short] 
        # finding the row that has the long_url that corresponds to the shortened url
        id_row = UrlTable.find_by_url_id(short) 
        # check to see if id_row is nil
        if id_row == nil
            render status: 400
        else
            # get the long_url from the id_row and return as JSON
            render json: {long:id_row.long_url} 
        end
    end
    
end
