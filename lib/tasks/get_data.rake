namespace :get_data do
  desc 'populate stock and industry data'
  task :stock_and_industry => :environment do
    require 'csv'
    CSV.foreach("db/data/finviz.csv", headers: true) do |row|
      industry = Industry.find_or_create_by(name: row['Industry'])
      stock = Stock.find_or_create_by(symbol: row['Ticker'])
      stock.industry = industry
      stock.company_name = row['Company']
      stock.save
    end
  end
end

