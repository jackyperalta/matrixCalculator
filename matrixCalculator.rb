   # course: cmps3500
   # CLASS Project
   # RUBY IMPLEMENTATION OF A CUSTOM MATRIX CALCULATION
   # date: 4/24/2021
   # Student 1: Jacqueline Peralta
   # Student 2: Angel Lopez
   # Student 3: Aldair Martinez
   # description: Implementation of a matrix calculator

require 'tk'


root = TkRoot.new { title "Matrix Calculator" }
TkLabel.new(root) do
    text 'Matrix Calculator'
    pack { padx 15 ; pady 15; side 'left' }
end

# Designate two entry boxes and button for matrix entry box creation
$entry1Val = TkVariable.new
$entey2Val = TkVariable.new
entry1 = TkEntry.new(root) { textvariable $entry1Val }
entry2 = TkEntry.new(root) { textvariable $entry2Val }
btn_createMatrix1 = TkButton.new(root) do
    text "CREATE Matrix 1"
    borderwidth 5
    underline 0
    state "normal"
    cursor "hand2"
    relief "groove"
    activebackground "blue"
    command {btn_createMatrix1_click}
end

entry1.insert(0, 0)     # inserting default values to entry boxes
entry2.insert(0, 0)

# Place widgets in GUI window
btn_createMatrix1.place('height' => 25, 'width' => 100, 'x' => 80, 'y' => 20)
entry1.place('height' => 25, 'width' => 30, 'x' => 10, 'y' => 20)
entry2.place('height' => 25, 'width' => 30, 'x' => 40, 'y' => 20)

# button click funciton
def btn_createMatrix1_click
    puts $entry1Val     # output what is in entry box 1
end

Tk.mainloop


#Code for storing csv to array/matrix
require 'csv'

row, col = 8, 8
index = 0
puts "Matrix A\n"
matrixA = Array.new(row){Array.new(col)}
#for i in 0..9
CSV.foreach("A.csv") do |row|
    matrixA[index] = row
    index = index + 1
end
#end
print matrixA

puts "\n\nMatrix B\n"
index = 0
matrixB = Array.new(row){Array.new(col)}
  CSV.foreach("B.csv") do |row|
    matrixB[index] = row
    index = index + 1
  end
print matrixB

string_num = matrixB[0][0]
print "\nstring num: ", string_num
num = string_num
print "\nnum: ", num
