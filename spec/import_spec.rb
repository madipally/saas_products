require './import'
describe "import" do 
    context "When importing json file" do 
       it "should parse and import json file" do 
          file_name = "softwareadvice"
          file_path = "feed-products/softwareadvice.json"
          response = ImportProducts.new(file_name, file_path).import
          expect(response[0]["title"]).to eq('Freshdesk')
          expect(response[0]["categories"][0]).to eq('Customer Service')
          expect(response[0]["twitter"]).to eq('@freshdesk')
       end
    end

    context "When importing yaml file" do 
        it "should parse and import json file" do 
           file_name = "capterra"
           file_path = "feed-products/capterra.yaml"
           response = ImportProducts.new(file_name, file_path).import
           expect(response[1]["tags"]).to eq('Instant Messaging & Chat,Web Collaboration,Productivity')
           expect(response[1]["name"]).to eq('Slack')
           expect(response[1]["twitter"]).to eq('slackhq')
        end
     end
 end