namespace :purpose_map do

  namespace :data do

    desc 'Import non-profits from IRS web site'
    task :import_organizations_from_irs => :environment do |task|
      puts "Importing organizations (will take some time)"
      Organization.destroy_all
      require 'state_iterator'
      StateIterator.import_all
    end

end
