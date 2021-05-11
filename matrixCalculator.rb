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

#function calls_______________________________________________________________
#add(matrixA, matrixB)
#subtract(matrixA, matrixB)
#multiply(matrixA, $matA_height, $matA_width, matrixB, $matB_height, $matB_width)
#identity($matA_height) #pass a matrix height or width
#transpose(matrixA, $matA_height, $matA_width)

print("\n\nInsert a value for scaler and pow function between 1 & 10: ")
int_input = gets.chomp.to_i   #takes input
if !(int_input.between?(1, 10))  #doe not accept letters
  while !(int_input.between?(1, 10))
    print("Input must be a number between 1 & 10: ")
    int_input = gets.chomp.to_i
  end
end
print("Input value is: #{int_input}")
scaler(matrixA, $matA_height, $matA_width, int_input)

require "matrix" #crucial for matrix operations to work


#convert "Array" to "Matrix" because determinant function
#only accepts "Matrix" types
matrixTmpA = Matrix[*matrixA] # * is splat operator: it essentially
#can be used to treat an array  as if it weren't an array, but
#rather as if its elements were individual elements/arguments.
#Without the splat operator, ther would be an extra '[]' around matrixA
matrixTmpB = Matrix[*matrixB]

print "\n\n Determinant of matrix\n"
matrix_detA = matrixTmpA.determinant()  #get result and store in variable
print "\nMatrix determinant A: ", matrix_detA

matrix_detB = matrixTmpB.determinant()
print "\nMatrix determinant B: ", matrix_detB


print "\n\n Inverse matrix\n"
matrix_invA = matrixTmpA.inverse() #get result and store in new variable
matrix_invA = *matrix_invA #covert from matrix back into array to print
matrix_invA = to_Decimal(matrix_invA, $matA_height, $matA_width) #change fraction to decimal
print "\nMatrix inverse A: ", matrix_invA
print("\n\n")
matrix_invB = matrixTmpB.inverse() #Do the same with matrix B
matrix_invB = *matrix_invB #covert from matrix back into array to print
matrix_invB = to_Decimal(matrix_invB, $matB_height, $matB_width) #change to decimal
print "\nMatrix inverse B: ", matrix_invB


print("\nPower/Exponent functions \n")
matrix_powA = exponent(matrixTmpA, int_input) #call function and store result in new var.
matrix_powA = *matrix_powA   #covert from matrix back into array. Indexes work now.
print("\nExponent A: ", matrix_powA)
print("\n\n")
matrix_powB = exponent(matrixTmpB, int_input)
matrix_powB = *matrix_powB   #covert from matrix back into array
print("\nExponent B: ", matrix_powB)
