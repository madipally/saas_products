#!/usr/bin/env ruby
class ImportProducts
    def initialize(file_name, path)
        @file_name = file_name
        @path = path
    end
    def import
        extention = File.extname(@path)
        case extention
        when '.json'
            parse_json
        when '.yaml'
            parse_yaml
        end
    end

    def parse_json
        require 'json'
        json_file = File.read(@path)
        products_json = JSON.parse(json_file)
        products_json["products"].each do |product|
            puts "importing: Name: #{product['title']}; Categories: #{product['categories'].join(' &')}; Twitter: @#{product['twitter']}"
        end
    end

    def parse_yaml
        require 'yaml'
        yaml_file = YAML.load_file(@path)
        yaml_file.each do |product|
            puts "importing: Name: #{product['name']}; Categories: #{product['tags']}; Twitter: @#{product['twitter']}"
        end
    end
end

ImportProducts.new(ARGV[0], ARGV[1]).import