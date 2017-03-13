class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  require 'csv'

  csv_text = File.read(File.join(Rails.root, 'app','csv','cards_20170227.csv'))
  csv = CSV.parse(csv_text, headers:true)
  csv.each do |row|
    # User.create!(row.to_hash)
    t = User.new
    t.name = row['name']
    t.room = row['room']
    t.pic = row['pic']
    t.save

  end

  #  text = File.read(File.join(Rails.root, 'app','csv','lista.csv'))
  #  csv = CSV.parse(text, :headers => true)
  #  csv.each do |row|
  #    row = row.to_hash.with_indifferent_access
  #    User.create!(row.to_hash.symbolize_keys)
  #  end
end
