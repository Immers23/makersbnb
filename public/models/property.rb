require 'pg'
require_relative 'db_connect'

class Property
  attr_reader :address, :post_code, :photo, :pid, :uid, :data


  def initialize(db_row)
     @address = db_row['address']
     @post_code = db_row['post_code']
     @photo = db_row['photo']
     @pid = db_row['pid']
     @uid = db_row['uid']
  end 


  def self.all
    # @data
    #@data = DatabaseConnection.setup.exec("SELECT * FROM properties")
     DatabaseConnection.query("SELECT * FROM properties").map { |row| Property.new(row) }
  end 


  def self.create(address:, post_code:, photo:, uid:)
    DatabaseConnection.setup
    DatabaseConnection.query("INSERT INTO properties(address, post_code, photo, uid) VALUES ('#{address}', '#{post_code}', '#{photo}', '#{uid}')")
  end 


  def self.delete(pid:)
    DatabaseConnection.query("DELETE FROM properties WHERE pid = #{pid}")
  end 

end 