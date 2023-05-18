class EncodeDecodeController < ApplicationController
    def encode
        http_base = "http://short.est/"
        # getting long_url from the query string
        long = params[:long] 
        #converting url to a int has then converting to string and concatenating to the end of the base
        long_id = http_base + long.hash.to_s 
         # making a new row in the table for the long_url and its id
        new_row = UrlTable.create(long_url:long, url_id:long_id)
        # returning JSON with the shortened url
        render json: {short: new_row.url_id} 
    end
    def decode
        # getting the shortened url from the query string
        short = params[:short] 
        # finding the row that has the long_url that corresponds to the shortened url
        id_row = UrlTable.find_by_url_id(short) 
        # get the long_url from the id_row and return as JSON
        render json: {long:id_row.long_url} 
    end
    
end