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

#Checks for any nils in matrix
def error_check(matrix, mat_height, mat_width)
  for i in 0..mat_height-1
    for j in 0..mat_width-1
      if matrix[i][j] == nil 
        print("\nERROR DETECTED: Matrix size is not consistent\n")
        return
      end
    end
  end
end


#function adds 2 matrices
def add(matrixA, matrixB)
  #take matrix size and store into row & col
  row, col = $matA_width, $matB_height
  #declare 3rd matrix with size of matrix width and height
  matrixC = Array.new(row){Array.new(col)}
  for i in 0..col-1
    for j in 0..row-1
      #add and store into 3rd matrix
      matrixC[i][j] = matrixA[i][j] + matrixB[i][j]
    end
  end
print "\nMatrix A + Matrix B\n", matrixC
end

#function subtracts 2 matrices
def subtract(matrixA, matrixB) #A and B must be same size
  #take matrix size and store into row & col
  row, col = $matA_width, $matB_height
  #declare 3rd matrix with size of matrix width and height
  matrixC = Array.new(row){Array.new(col)}
  for i in 0..col-1
    for j in 0..row-1
      #subtract and store into 3rd matrix
      matrixC[i][j] = matrixA[i][j] - matrixB[i][j]
    end
  end
print "\nMatrix A - Matrix B\n", matrixC
end


#fuction for matrix multiplication
def multiply(matrixA, matA_height, matA_width, matrixB, matB_height, matB_width)
  #create a 3rd matrix
  #3rd matrix will have size of matrix A's column
  # and matrix B's row.
matrixC = Array.new(matA_width){Array.new(matB_height)}

for i in 0..matrixC.length - 1
for j in 0..matrixC[0].length - 1
  matrixC[i][j] = 0  #set all to 0 initially
end
end

for i in 0..matrixC.length - 1
for j in 0..matrixC[0].length - 1
  for k in 0..matrixA[0].length - 1
    #multiplication of matrices is added to 3rd matrix
    matrixC[i][j] += matrixA[i][k] * matrixB[k][j]
  end
end
end
print "\nMatrix A * Matrix B\n", matrixC
end


#Identity matrix function
def identity(size)  #matrix must be square
  matrixC = Array.new(size){Array.new(size)}
  for i in 0..size - 1
    for j in 0..size - 1
      if i == j
        matrixC[i][j] = 1
      else
        matrixC[i][j] = 0
      end
    end
  end
  print "\n\nIdentity matrix: ", matrixC, "\n"
end

def transpose(matrix, height, width)
  #declare 3rd matrix with size of matrix width and height
  matrixC = Array.new(width){Array.new(height)}
  for i in 0..height-1
    for j in 0..width-1
      #arrange the values to resemble transpose
      #store result in 2D array
      matrixC[j][i] = matrix[i][j]
    end
  end
  print "\nTranspose of matrix ", matrixC,"\n"
end

#scaler function
def scaler(matrix, mat_height, mat_width, input)
  row, col = mat_width, mat_height
  matrixC = Array.new(row){Array.new(col)}
  for i in 0..col-1
    for j in 0..row-1
      #multiply by input and store in different matrix
      matrixC[i][j] = matrix[i][j] * input  
    end
  end
  print "\nMatrix index * #{input}\n", matrixC
end 


def exponent(matrixTmp, input)
  # the double splat operator returns exponent of matrix
  return *matrixTmp **input #splat operator make "Matrix" go away
end

#fraction to decimal function
def to_Decimal(matrix, mat_height, mat_width)
  row, col = mat_width, mat_height
  matrixC = Array.new(row){Array.new(col)}
  #loop through matrix
  for i in 0..col-1
    for j in 0..row-1
      #change fraction to decimal and round to the 5th 
      matrixC[i][j] = matrix[i][j].to_f.round(5) 
    end
  end
  return matrixC
end


#Main_______________________________________________________________
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

error_check(matrixA, $matA_height, $matA_width) #must be done before in coverstion


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

error_check(matrixB, $matB_height, $matB_width)

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
add(matrixA, matrixB)
subtract(matrixA, matrixB)
multiply(matrixA, $matA_height, $matA_width, matrixB, $matB_height, $matB_width)
identity($matA_height) #pass a matrix height or width
transpose(matrixA, $matA_height, $matA_width)

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