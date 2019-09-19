require 'rails_helper'
require "will_paginate"
RSpec.describe CarparkController, :type => :request do
    

    let(:valid_url){'http://localhost:3000/carparks/nearest?latitude=1.381570&longitude=103.936030&page=1&per_page=100'}
    let(:no_latlong_url) {"http://localhost:3000/carparks/nearest?page=1&per_page=100"}
    let(:bad_request_url) {"http://localhost:3000/carparks/nearest"}
  
    describe '#show' do
        context "when valid URL" do
            it "should return 200" do
                get valid_url
                expect(response).to have_http_status(200)
            end
        end

        context "Without lat and long in the params" do
            it "should respond with 400" do
                get no_latlong_url
                expect(response).to have_http_status(400)
            end
        end
    end

    describe '#error' do
        context "when malformed URL " do
            it "should return 400" do
                get bad_request_url
                expect(response).to have_http_status(400)
            end
        end
    end
end
