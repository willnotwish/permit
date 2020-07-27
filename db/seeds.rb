# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# 
COLOURS = %w(red yellow blue grey brown black white)
CATEGORIES = %w( Active Passive Default )
SIZES = %w( large medium small )
WIDGETS = %w( Granpan Peasuit Flopper Bismarq Chutter Bankslam Gremskow Binither Koppy Zagger Yumpy Greenpan )
PRICES = [50, 55, 80, 90, 100, 150, 200, 500]

Widget.delete_all
Category.delete_all
Colour.delete_all
Size.delete_all

COLOURS.each do |name|
    Colour.create(name: name)
end

CATEGORIES.each do |name|
    Category.create(name: name)
end

SIZES.each do |name|
    Size.create(name: name, code: name.downcase[0])
end

WIDGETS.each do |name|
    Widget.create(name: name, price: PRICES.sample, 
                              category: Category.all.sample, 
                              colour: Colour.all.sample, 
                              size: Size.all.sample)
end
