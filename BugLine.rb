#!bin/usr/ruby

require 'rally_api'
require_relative 'config'

rally = RallyAPI::RallyRestJson.new(@config)

fields = {}
fields['Name'] = ARGV[0]
fields['Project'] = '<projectId>'
fields['SubmittedBy'] = '<userId'

new_defect = rally.create('defect', fields)

%x(/usr/bin/open -a "/Applications/Google Chrome.app" 'https://rally1.rallydev.com/#/#{fields['Project']}/detail/defect/#{new_defect.ObjectID}')
