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
def multiply(matrixA, matrixB) #A's columns must equal B's rows
  row, col = $matA_width, $matB_height
      #create a 3rd matrix
      #3rd matrix will have size of matrix A's column
      # and matrix B's row.
  matrixC = Array.new(matrixA.length){Array.new(matrixB[0].length)}
 
  for i in 0..col - 1
    for j in 0..row - 1
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
add(matrixA, matrixB)
subtract(matrixA, matrixB)
multiply(matrixA, matrixB)
identity($matA_height) #pass a matrix height or width
transpose(matrixA, $matA_height, $matA_width)




