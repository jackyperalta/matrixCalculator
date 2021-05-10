   # course: cmps3500
   # CLASS Project
   # RUBY IMPLEMENTATION OF A CUSTOM MATRIX CALCULATION
   # date: 4/24/2021
   # Student 1: Jacqueline Peralta
   # Student 2: Angel Lopez
   # Student 3: Aldair Martinez
   # description: Implementation of a matrix calculator

require 'tk'

# global variables
$matrixAFileName
$matrixBFileName
$row
$column
$matrixA            # matrix variables
$matrixB
$matrixOut
$text_MatrixA       # text boxes
$text_MatrixB
$text_MatrixOut
$entry_unaryDetA_Var = TkVariable.new       # entry box variables
$entry_unaryDetB_Var = TkVariable.new
$entry_unaryNtimesA_Var = TkVariable.new
$entry_unaryNtimesB_Var = TkVariable.new
$entry_unaryPowerA_Var = TkVariable.new
$entry_unaryPowerB_Var = TkVariable.new

load 'guiElements.rb'
load 'guiFunctions.rb'

Tk.mainloop


#Code for storing csv to array/matrix
require 'csv'

row, col = 0, 0
index = 0

#create matrix
matrixA = Array.new(row){Array.new(col)}

puts "Matrix A\n"
#read in matrix A file
CSV.foreach("A.csv") do |row|
  matrixA[index] = row
  index = index + 1
  #print "Index: ", index, "  row: ", row, "\n"
end
print matrixA

#store height and width of matrix A
$matA_height = matrixA.length  #array.length gets you height
$matA_width = matrixA[0].length #array[0].length gets you width
print "\nMatrix A has a size of ", $matA_height, "x", $matA_width, "\n"


index = 0
puts "\n\nMatrix B\n"
#read in matrix B file
matrixB = Array.new(row){Array.new(col)}
  CSV.foreach("B.csv") do |row|
    matrixB[index] = row
    index = index + 1
  end
print matrixB

#store height and width of matrix B
$matB_height = matrixB.length
$matB_width = matrixB[0].length
print "\nMatrix B has a size of ", $matB_height, "x", $matB_width, "\n"

print "\n\n"
#convert strings to ints
for i in 0..$matA_height - 1
  for j in 0..$matA_width - 1
    matrixA[i][j] = matrixA[i][j].to_i
    matrixB[i][j] = matrixB[i][j].to_i
  end
end
#TEMPORARY SOLUTION for index [0][0] issue
#matrixA[0][0] = 66
#matrixB[0][0] = 51

#function calls
#add(matrixA, matrixB)
#subtract(matrixA, matrixB)
#multiply(matrixA, matrixB)
#identity($matA_height) #pass a matrix height or width
#transpose(matrixA, $matA_height, $matA_width)
