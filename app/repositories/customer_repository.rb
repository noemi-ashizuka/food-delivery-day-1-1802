require "csv"
require_relative "../models/customer"

class CustomerRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @next_id = 1
    @customers = [] # an array of meal instances
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @customers
  end

  def create(customer)
    customer.id = @next_id
    @next_id += 1
    @customers << customer
    save_csv
  end

  def update
	  save_csv
	end

	def destroy(index)
    # p @customers
	  @customers.delete_at(index)
	  save_csv
	end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # change the data from the csv to be what we actually want in the customer (price and id integer)
      row[:id] = row[:id].to_i
      # make a customer instance and push it into the @customers
      @customers << Customer.new(row)
      # p row
    end
    @next_id = @customers.last.id + 1 unless @customers.empty?
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << %w(id name address)
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end
end
