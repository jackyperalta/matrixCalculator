# button click funcitons
def btn_openMatrixA_click
    $matrixAFileName = Tk.getOpenFile
end

def btn_openMatrixB_click
    $matrixBFileName = Tk.getOpenFile
end
# start of unary button functions
def btn_unaryAtoI_click
    row = findRow($matrixA)
    col = findCol($matrixA)
    if (row == col)
        matrix = identity(row)
        insert_MatrixOut(matrix)
    end
end

def btn_unaryBtoI_click
    row = findRow($matrixB)
    col = findCol($matrixB)
    if (row == col)
        matrix = identity(row)
        insert_MatrixOut(matrix)
    end
end

def btn_unaryAT_click
    row = findRow($matrixA)
    col = findCol($matrixA)
    matrix = transpose($matrixA, row, col)
    insert_MatrixOut(matrix)
end

def btn_unaryBT_click
    row = findRow($matrixB)
    col = findCol($matrixB)
    matrix = transpose($matrixB, row, col)
    insert_MatrixOut(matrix)
end

require "matrix" #crucial for matrix operations to work
def btn_unaryInvA_click
    col = findCol($matrixA)
    row = findRow($matrixA)
    if (col == row) # inverse must be a square
        matrixA = convertMatrixToInteger($matrixA)
        matrixtmp = Matrix[*matrixA]
        matrix = matrixtmp.inverse()
        matrix = *matrix
        # convert matrix to decimal format
        matrix = to_Decimal(matrix, findRow(matrix), findCol(matrix))
        insert_MatrixOut(matrix)
    end
end

def btn_unaryInvB_click
    col = findCol($matrixB)
    row = findRow($matrixB)
    if (col == row) # inverse must be a square
        matrixB = convertMatrixToInteger($matrixB)
        matrixtmp = Matrix[*matrixB]
        matrix = matrixtmp.inverse()
        matrix = *matrix
        # convert matrix to decimal format
        matrix = to_Decimal(matrix, findRow(matrix), findCol(matrix))
        insert_MatrixOut(matrix)
    end
end

def btn_unaryDetA_click
    col = findCol($matrixA)
    row = findRow($matrixA)
    if (col == row) # must be a square
        matrixA = convertMatrixToInteger($matrixA)
    end
    matrixtmp = Matrix[*matrixA]
    matrix = matrixtmp.determinant()
    insert_MatrixOut(matrix)
end

def btn_unaryDetB_click
    col = findCol($matrixB)
    row = findRow($matrixB)
    if (col == row) # must be a square
        matrixB = convertMatrixToInteger($matrixB)
    end
    matrixtmp = Matrix[*matrixB]
    matrix = matrixtmp.determinant()
    insert_MatrixOut(matrix)
end

def btn_unaryNtimesA_click
    # gather input from entry box
    n = $entry_unaryNtimesA_Var
    col = findCol($matrixA)
    row = findRow($matrixA)
    if (n >= 1 && n <= 10) # input must be between 1-10
        matrixA = convertMatrixToInteger($matrixA)
        matrix = scaler(matrixA, row, col, n)
        insert_MatrixOut(matrix)
    end
end

def btn_unaryNtimesB_click
    # gather input from entry box
    n = $entry_unaryNtimesB_Var
    col = findCol($matrixB)
    row = findRow($matrixB)
    if (n >= 1 && n <= 10) # input must be between 1-10
        matrixB = convertMatrixToInteger($matrixB)
        matrix = scaler(matrixB, row, col, n)
        insert_MatrixOut(matrix)
    end
end

def btn_unaryPowerA_click
    # gather input from entry box
    n = $entry_unaryPowerA_Var
    col = findCol($matrixA)
    row = findRow($matrixA)
    if (col == row && n >= 1 && n <= 10) # must be a square
        matrixA = convertMatrixToInteger($matrixA)
        matrixTmp = Matrix[*matrixA]
        #call function and store result in new var.
        matrix = exponent(matrixTmp, n)
        insert_MatrixOut(matrix)
    end
end

def btn_unaryPowerB_click
    n = $entry_unaryPowerB_Var
    col = findCol($matrixB)
    row = findRow($matrixB)
    if (col == row && n >= 1 && n <= 10) # must be a square
        matrixB = convertMatrixToInteger($matrixB)
        matrixTmp = Matrix[*matrixB]
        #call function and store result in new var.
        matrix = exponent(matrixTmp, n)
        insert_MatrixOut(matrix)
    end
end
# --start of binary function buttons--
def btn_binaryAplusB_click
    rowA = findRow($matrixA)
    colA = findCol($matrixA)
    rowB = findRow($matrixB)
    colB = findCol($matrixB)
    # if both are the same size, continue
    if (rowA == rowB && colA == colB)
        matrixC = add($matrixA, $matrixB, rowA, colA)
        insert_MatrixOut(matrixC)
    end
end

def btn_binaryAminusB_click
    rowA = findRow($matrixA)
    colA = findCol($matrixA)
    rowB = findRow($matrixB)
    colB = findCol($matrixB)
    # if both are the same size, continue
    if (rowA == rowB && colA == colB)
        matrixC = subtract($matrixA, $matrixB, rowA, colA)
        insert_MatrixOut(matrixC)
    end
end

def btn_binaryBminusA_click
    rowA = findRow($matrixA)
    colA = findCol($matrixA)
    rowB = findRow($matrixB)
    colB = findCol($matrixB)
    # if both are the same size, continue
    if (rowA == rowB && colA == colB)
        matrixC = subtract($matrixB, $matrixA, rowA, colA)
        insert_MatrixOut(matrixC)
    end
end

def btn_binaryAtimesB_click
    colA = findCol($matrixA)
    rowB = findRow($matrixB)
    matrixC = multiply($matrixA, $matrixB, rowB, colA)
    insert_MatrixOut(matrixC)
end

def btn_binaryBtimesA_click
    colB = findCol($matrixB)
    rowA = findRow($matrixA)
    matrixC = multiply($matrixB, $matrixA, rowA, colB)
    insert_MatrixOut(matrixC)
end

def btn_binaryAcopytoB_click
    $matrixB = $matrixA
    insert_MatrixB($matrixB)
end

def btn_binaryBcopytoA_click
    $matrixA = $matrixB
    insert_MatrixA($matrixA)
end

def btn_binaryAswaptoB_click
    matrixtmp = $matrixA
    $matrixA = $matrixB
    $matrixB = matrixtmp
    insert_MatrixA($matrixA)
    insert_MatrixB($matrixB)
end

# gathering input from csv file functions
require 'csv'
def btn_loadMatrixA_click
    row, col = 0, 0
    matrixAtmp = Array.new(row){Array.new(col)}
    CSV.foreach($matrixAFileName) do |row|
        matrixAtmp.push(row.to_a)
    end
    $matrixA = matrixAtmp
    insert_MatrixA($matrixA)
end

def btn_loadMatrixB_click
    row, col = 0, 0
    matrixBtmp = Array.new(row){Array.new(col)}
    CSV.foreach($matrixBFileName) do |row|
        matrixBtmp.push(row.to_a)
    end
    $matrixB = matrixBtmp
    insert_MatrixB($matrixB)
end

# insert Matrix's into their text boxes
def insert_MatrixA (matrix)
    $text_MatrixA['state'] = 'normal'
    $text_MatrixA.delete(1.0, 10.40)
    i = 1
    j = 0
    matrix.each do |row|
        row.each do |element|
            index = i.to_s + "." + j.to_s
            $text_MatrixA.insert(index , element)
            j = j + 4
            index = i.to_s + "." + j.to_s
            $text_MatrixA.insert(index , ",")
            j = j + 4
        end
        index = i.to_s + "." + j.to_s
        $text_MatrixA.insert(index, "\n")
        i = i + 1
    end
    $text_MatrixA['state'] = 'disabled'
end

def insert_MatrixB (matrix)
    $text_MatrixB['state'] = 'normal'
    $text_MatrixB.delete(1.0, 10.40)
    i = 1
    j = 0
    matrix.each do |row|
        row.each do |element|
            index = i.to_s + "." + j.to_s
            $text_MatrixB.insert(index , element)
            j = j + 4
            index = i.to_s + "." + j.to_s
            $text_MatrixB.insert(index , ",")
            j = j + 4
        end
        index = i.to_s + "." + j.to_s
        $text_MatrixB.insert(index, "\n")
        i = i + 1
    end
    $text_MatrixB['state'] = 'disabled'
end

def insert_MatrixOut (matrix)
    $text_MatrixOut['state'] = 'normal'
    $text_MatrixOut.delete(1.0, 10.40)
    i = 1
    j = 0
    if (matrix.is_a? Integer)
        index = i.to_s + "." + j.to_s
        $text_MatrixOut.insert(index , matrix)
    else
        matrix.each do |row|
            row.each do |element|
                index = i.to_s + "." + j.to_s
                $text_MatrixOut.insert(index , element)
                j = j + 4
                index = i.to_s + "." + j.to_s
                $text_MatrixOut.insert(index , ",")
                j = j + 4
            end
            index = i.to_s + "." + j.to_s
            $text_MatrixOut.insert(index, "\n")
            i = i + 1
        end
    end
    $text_MatrixOut['state'] = 'disabled'
end

def findRow(matrix_input)
    rowCount = 0
    # start finding row
    matrix_input.each do |row|
        rowCount = rowCount + 1
    end
    return rowCount
end

def findCol(matrix_input)
    colCount = 0
    # start finding col
    matrix_input.each do |row|
        row.each do |element|
            colCount = colCount + 1
        end
        return colCount
    end
end

def convertMatrixToInteger(matrix)
    col = findCol(matrix)
    row = findRow(matrix)
    matrixNew = Array.new(row){Array.new(col)}
    for i in 0..col-1
        for j in 0..row-1
            matrixNew[i][j] = matrix[i][j].to_i
        end
    end
    return matrixNew
end

def exponent(matrixTmp, input)
  # the double splat operator returns exponent of matrix
  input = input.to_i
  return *matrixTmp**input #splat operator make "Matrix" go away
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
  return matrixC
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

#function adds 2 matrices
def add(matrixA, matrixB, row, col)
  #take matrix size and store into row & col
  #declare 3rd matrix with size of matrix width and height
  matrixC = Array.new(row){Array.new(col)}
  for i in 0..col-1
    for j in 0..row-1
      #add and store into 3rd matrix
      matrixC[i][j] = matrixA[i][j].to_i + matrixB[i][j].to_i
    end
  end
print "\nMatrix A + Matrix B\n", matrixC
return matrixC
end

#function subtracts 2 matrices
def subtract(matrixA, matrixB, row, col) #A and B must be same size
  #take matrix size and store into row & col
  #declare 3rd matrix with size of matrix width and height
  matrixC = Array.new(row){Array.new(col)}
  for i in 0..col-1
    for j in 0..row-1
      #subtract and store into 3rd matrix
      matrixC[i][j] = matrixA[i][j].to_i - matrixB[i][j].to_i
    end
  end
print "\nMatrix A - Matrix B\n", matrixC
return matrixC
end

#fuction for matrix multiplication
def multiply(matrixA, matrixB, row, col) #A's columns must equal B's rows
  #row, col = $matA_width, $matB_height
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
        matrixC[i][j] += matrixA[i][k].to_i * matrixB[k][j].to_i
      end
    end
  end
  print "\nMatrix A * Matrix B\n", matrixC
  return matrixC
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
  return matrixC
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
  return matrixC
end
