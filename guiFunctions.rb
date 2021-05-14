# ---- Start of button click functions----
def btn_openMatrixA_click
    $matrixAFileName = Tk.getOpenFile
end

def btn_openMatrixB_click
    $matrixBFileName = Tk.getOpenFile
end

# -- start of unary button functions --
def btn_unaryAtoI_click
    row = findRow($matrixA)
    col = findCol($matrixA)
    if (row == col) # must be square
        matrix = identity(row)
        insert_MatrixOut(matrix)
    else
        insert_MatrixOut_ERROR("MatrixA must have equal rows to columns..")
    end
end

def btn_unaryBtoI_click
    row = findRow($matrixB)
    col = findCol($matrixB)
    if (row == col) # must be square
        matrix = identity(row)
        insert_MatrixOut(matrix)
    else
        insert_MatrixOut_ERROR("MatrixB must have equal rows to columns..")
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
        # convert matrix to decimal format, so output is not a fraction
        matrix = to_Decimal(matrix, findRow(matrix), findCol(matrix))
        insert_MatrixOut(matrix)
    else
        insert_MatrixOut_ERROR("MatrixA must be square matrix..")
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
        # convert matrix to decimal format, so output is not a fraction
        matrix = to_Decimal(matrix, findRow(matrix), findCol(matrix))
        insert_MatrixOut(matrix)
    else
        insert_MatrixOut_ERROR("MatrixB must be square matrix..")
    end
end

def btn_unaryDetA_click
    col = findCol($matrixA)
    row = findRow($matrixA)
    if (col == row) # must be a square
        matrixA = convertMatrixToInteger($matrixA)
        matrixtmp = Matrix[*matrixA]
        matrix = matrixtmp.determinant()
        insert_MatrixOut(matrix)
    else
        insert_MatrixOut_ERROR("MatrixA must be square matrix..")
    end
end

def btn_unaryDetB_click
    col = findCol($matrixB)
    row = findRow($matrixB)
    if (col == row) # must be a square
        matrixB = convertMatrixToInteger($matrixB)
        matrixtmp = Matrix[*matrixB]
        matrix = matrixtmp.determinant()
        insert_MatrixOut(matrix)
    else
        insert_MatrixOut_ERROR("MatrixB must be square matrix..")
    end
end

def btn_unaryNtimesA_click
    # gather input from entry box
    n = $entry_unaryNtimesA_Var
    col = findCol($matrixA)
    row = findRow($matrixA)
    if (n >= 1 && n <= 10) # input must be between 1-10
        matrixA = convertMatrixToInteger($matrixA)
        matrix = scaler(matrixA, row, col, n)   # does calculation on matrix
        insert_MatrixOut(matrix)
    else
        insert_MatrixOut_ERROR("Input is between 1-10..")
    end
end

def btn_unaryNtimesB_click
    # gather input from entry box
    n = $entry_unaryNtimesB_Var
    col = findCol($matrixB)
    row = findRow($matrixB)
    if (n >= 1 && n <= 10) # input must be between 1-10
        matrixB = convertMatrixToInteger($matrixB)
        matrix = scaler(matrixB, row, col, n)   # does calculation of matrix
        insert_MatrixOut(matrix)
    else
        insert_MatrixOut_ERROR("Input is between 1-10..")
    end
end

def btn_unaryPowerA_click
    # gather input from entry box
    n = $entry_unaryPowerA_Var
    col = findCol($matrixA)
    row = findRow($matrixA)
    if (col == row && n >= 1 && n <= 10) # must be a square
        matrixA = convertMatrixToInteger($matrixA)
        matrixTmp = Matrix[*matrixA]    # neccesary to make exponent() work
        #call function and store result in new var.
        matrix = exponent(matrixTmp, n)
        insert_MatrixOut(matrix)
    else
        insert_MatrixOut_ERROR("Must be square matrix and input is between 1-10..")
    end
end

def btn_unaryPowerB_click
    n = $entry_unaryPowerB_Var
    col = findCol($matrixB)
    row = findRow($matrixB)
    if (col == row && n >= 1 && n <= 10) # must be a square
        matrixB = convertMatrixToInteger($matrixB)
        matrixTmp = Matrix[*matrixB]    # neccesary to make exponent() work
        #call function and store result in new var.
        matrix = exponent(matrixTmp, n)
        insert_MatrixOut(matrix)
    else
        insert_MatrixOut_ERROR("Must be square matrix and input is between 1-10..")
    end
end

# --start of binary function buttons--
def btn_binaryAplusB_click
    if ($matrixA == nil || $matrixB == nil)
        insert_MatrixOut_ERROR("MatrixA or MatrixB are empty..")
    else
        rowA = findRow($matrixA)
        colA = findCol($matrixA)
        rowB = findRow($matrixB)
        colB = findCol($matrixB)
        # if both are the same size, continue
        if (rowA == rowB && colA == colB)
            matrixC = add($matrixA, $matrixB, rowA, colA)
            insert_MatrixOut(matrixC)
        else
            insert_MatrixOut_ERROR("Both MatrixA and MatrixB must be same size..")
        end
    end
end

def btn_binaryAminusB_click
    if ($matrixA == nil || $matrixB == nil)
        insert_MatrixOut_ERROR("MatrixA or MatrixB are empty..")
    else
        rowA = findRow($matrixA)
        colA = findCol($matrixA)
        rowB = findRow($matrixB)
        colB = findCol($matrixB)
        # if both are the same size, continue
        if (rowA == rowB && colA == colB)
            matrixC = subtract($matrixA, $matrixB, rowA, colA)
            insert_MatrixOut(matrixC)
        else
            insert_MatrixOut_ERROR("Both MatrixA and MatrixB must be same size..")
        end
    end
end

def btn_binaryBminusA_click
    if ($matrixA == nil || $matrixB == nil)
        insert_MatrixOut_ERROR("MatrixA or MatrixB are empty..")
    else
        rowA = findRow($matrixA)
        colA = findCol($matrixA)
        rowB = findRow($matrixB)
        colB = findCol($matrixB)
        # if both are the same size, continue
        if (rowA == rowB && colA == colB)
            matrixC = subtract($matrixB, $matrixA, rowA, colA)
            insert_MatrixOut(matrixC)
        else
            insert_MatrixOut_ERROR("Both MatrixA and MatrixB must be same size..")
        end
    end
end

def btn_binaryAtimesB_click
    if ($matrixA == nil || $matrixB == nil)
        insert_MatrixOut_ERROR("MatrixA or MatrixB are empty..")
    else
        rowA = findRow($matrixA)
        colA = findCol($matrixA)
        rowB = findRow($matrixB)
        colB = findCol($matrixB)
        if (colA == rowB)   # must meet this condition before multiplying
            matrixC = multiply($matrixA, $matrixB, rowA, colA, rowB, colB)
            insert_MatrixOut(matrixC)
        else
            insert_MatrixOut_ERROR("A's columns must be equal to B's rows..")
        end
    end
end

def btn_binaryBtimesA_click
    if ($matrixA == nil || $matrixB == nil)
        insert_MatrixOut_ERROR("MatrixA or MatrixB are empty..")
    else
        rowA = findRow($matrixA)
        colA = findCol($matrixA)
        rowB = findRow($matrixB)
        colB = findCol($matrixB)
        if (colB == rowA)   # must meet this condition before multiplying
            matrixC = multiply($matrixB, $matrixA, rowB, colB, rowA, colA)
            insert_MatrixOut(matrixC)
        else
            insert_MatrixOut_ERROR("B's columns must be equal to A's rows..")
        end
    end
end

def btn_binaryAcopytoB_click
    if ($matrixA == nil)
        insert_MatrixOut_ERROR("MatrixA or MatrixB are empty..")
    else
        $matrixB = $matrixA
        insert_MatrixB($matrixB)
    end
end

def btn_binaryBcopytoA_click
    if ($matrixB == nil)
        insert_MatrixOut_ERROR("MatrixA or MatrixB are empty..")
    else
        $matrixA = $matrixB
        insert_MatrixA($matrixA)
    end
end

# ADD check if is determinant here
def btn_outToA_click
    if ($matrixOut == nil)
        insert_MatrixOut_ERROR("Nothing outputted to copy..")
    elsif ($matrixOut.is_a? Integer)    # checking if what is being outputted is a matrix or not
        insert_MatrixOut_ERROR("Cannot output determinant to A..")
    else
        $matrixA = $matrixOut
        insert_MatrixA($matrixOut)
    end
end

def btn_outToB_click
    if ($matrixOut == nil)
        insert_MatrixOut_ERROR("Nothing outputted to copy..")
    elsif ($matrixOut.is_a? Integer)    # checking if what is being outputted is a matrix or not
        insert_MatrixOut_ERROR("Cannot output determinant to B..")
    else
        $matrixB = $matrixOut
        insert_MatrixB($matrixOut)
    end
end

def btn_binaryAswaptoB_click
    if ($matrixA == nil || $matrixB == nil)
        insert_MatrixOut_ERROR("MatrixA or MatrixB are empty..")
    else
        matrixtmp = $matrixA
        $matrixA = $matrixB
        $matrixB = matrixtmp
        insert_MatrixA($matrixA)
        insert_MatrixB($matrixB)
    end
end

def enableAllBtns(input)
    # enables buttons once valid matrix is inputted
    if (input == 'A')
        $btn_unaryAtoI['state'] = "normal"
        $btn_unaryAT['state'] = "normal"
        $btn_unaryInvA['state'] = "normal"
        $btn_unaryDetA['state'] = "normal"
        $btn_unaryNtimesA['state'] = "normal"
        $btn_unaryPowerA['state'] = "normal"
    elsif (input == 'B')
        $btn_unaryBtoI['state'] = "normal"
        $btn_unaryBT['state'] = "normal"
        $btn_unaryInvB['state'] = "normal"
        $btn_unaryDetB['state'] = "normal"
        $btn_unaryNtimesB['state'] = "normal"
        $btn_unaryPowerB['state'] = "normal"
    end
end

def disableAllBtns(input)
    # disable buttons at the start of the program
    if (input == 'A')
        $btn_unaryAtoI['state'] = "disabled"
        $btn_unaryAT['state'] = "disabled"
        $btn_unaryInvA['state'] = "disabled"
        $btn_unaryDetA['state'] = "disabled"
        $btn_unaryNtimesA['state'] = "disabled"
        $btn_unaryPowerA['state'] = "disabled"
    elsif (input == 'B')
        $btn_unaryBtoI['state'] = "disabled"
        $btn_unaryBT['state'] = "disabled"
        $btn_unaryInvB['state'] = "disabled"
        $btn_unaryDetB['state'] = "disabled"
        $btn_unaryNtimesB['state'] = "disabled"
        $btn_unaryPowerB['state'] = "disabled"
    end
end

# gathering input from csv file functions
require 'pathname'
require 'csv'
def btn_loadMatrixA_click
    if ($matrixAFileName == nil)
        insert_MatrixOut_ERROR("No file selected for MatrixA..")
    else
        # file is selected path
        row, col = 0, 0
        matrixAtmp = Array.new(row){Array.new(col)}
        CSV.foreach($matrixAFileName) do |row|
            matrixAtmp.push(row.to_a)   # add rows to temp matrix
        end
        # go through a series of checks on this temp matrix
        if (!matrixIsComplete(matrixAtmp))
            insert_MatrixOut_ERROR("Empty values not allowed in .csv file..")
        elsif (!matrixOnlyDigits(matrixAtmp))
                insert_MatrixOut_ERROR("Letters not allowed in .csv file..")
        elsif (!matrixSizeIsCorrect(matrixAtmp))
            insert_MatrixOut_ERROR("Matrix size must be at most 10x10..")
        else
            # if passed all checks, insert into MatrixA in GUI
            enableAllBtns('A')
            $matrixA = matrixAtmp
            insert_MatrixA($matrixA)
            # updating filename to GUI
            file = Pathname.new($matrixAFileName).basename
            $label_MatrixA['textvariable'] = $label_MatrixAText
            $label_MatrixAText.value = file
        end
    end
end

def btn_loadMatrixB_click
    if ($matrixBFileName == nil)
        insert_MatrixOut_ERROR("No file selected for MatrixB..")
    else
        # file is selected path
        row, col = 0, 0
        matrixBtmp = Array.new(row){Array.new(col)}
        CSV.foreach($matrixBFileName) do |row|
            matrixBtmp.push(row.to_a)   # add rows to temp matrix
        end
        # go through a series of checks on this temp matrix
        if (!matrixIsComplete(matrixBtmp))
            insert_MatrixOut_ERROR("Empty values not allowed in .csv file..")
        elsif (!matrixOnlyDigits(matrixBtmp))
                insert_MatrixOut_ERROR("Letters not allowed in .csv file..")
        elsif (!matrixSizeIsCorrect(matrixBtmp))
            insert_MatrixOut_ERROR("Matrix size must be at most 10x10..")
        else
            # if passed all checks, insert into MatrixB in GUI
            enableAllBtns('B')
            $matrixB = matrixBtmp
            insert_MatrixB($matrixB)
            # updating filename to GUI
            file = Pathname.new($matrixBFileName).basename
            $label_MatrixB['textvariable'] = $label_MatrixBText
            $label_MatrixBText.value = file
        end
    end
end

# function handles placing input into MatrixA textbox
def insert_MatrixA (matrix)
    enableAllBtns('A')
    $text_MatrixA['state'] = 'normal'
    $text_MatrixA.delete(1.0, 10.40)
    i = 1
    j = 0
    col = findCol(matrix)
    matrix.each do |row|
        count = 0
        row.each do |element|
            index = i.to_s + "." + j.to_s           # keeps track of placement in text box
            $text_MatrixA.insert(index , element)   # insert value
            if (count != col-1)
                j = j + 10
                index = i.to_s + "." + j.to_s
                $text_MatrixA.insert(index , ",")   # insert , between each value
            end
            j = j + 10
            count += 1
        end
        index = i.to_s + "." + j.to_s
        $text_MatrixA.insert(index, "\n")           # new line when done with row
        i = i + 1
    end
    $text_MatrixA['state'] = 'disabled'
end

# function handles input to place into the MatrixB text box
def insert_MatrixB (matrix)
    enableAllBtns('B')
    $text_MatrixB['state'] = 'normal'
    $text_MatrixB.delete(1.0, 10.40)
    i = 1
    j = 0
    col = findCol(matrix)
    matrix.each do |row|
        count = 0
        row.each do |element|
            index = i.to_s + "." + j.to_s           # keeps track of placement in text box
            $text_MatrixB.insert(index , element)   # insert value
            if (count != col-1)
                j = j + 10
                index = i.to_s + "." + j.to_s
                $text_MatrixB.insert(index , ",")   # insert , between each value
            end
            j = j + 10
            count += 1
        end
        index = i.to_s + "." + j.to_s
        $text_MatrixB.insert(index, "\n")           # new line when done with row
        i = i + 1
    end
    $text_MatrixB['state'] = 'disabled'
end

# function handles placing an input into the OUTPUT textbox
def insert_MatrixOut (matrix)
    $matrixOut = matrix
    $text_MatrixOut['state'] = 'normal'
    $text_MatrixOut.delete(1.0, 10.40)
    i = 1
    j = 0
    if (matrix.is_a? Integer)       # check if is determinant being outputted to text box
        index = i.to_s + "." + j.to_s
        $text_MatrixOut.insert(index , matrix)
    else
        # if is matrix, and not determinant, continue
        col = findCol(matrix)
        matrix.each do |row|
            count = 0
            row.each do |element|
                index = i.to_s + "." + j.to_s           # keeps track of placement in text box
                $text_MatrixOut.insert(index , element) # insert value
                if (count != col-1)
                    j = j + 10
                    index = i.to_s + "." + j.to_s
                    $text_MatrixOut.insert(index , ",") # place , between values
                end
                j = j + 10
                count += 1
            end
            index = i.to_s + "." + j.to_s
            $text_MatrixOut.insert(index, "\n")         # new line once row ends
            i = i + 1
        end
    end
    $text_MatrixOut['state'] = 'disabled'
end

# function handles error messages to the OUTPUT textbox
def insert_MatrixOut_ERROR(message)
    $text_MatrixOut['state'] = 'normal'
    $text_MatrixOut.delete(1.0, 10.40)
    $text_MatrixOut.insert(1.0, message)
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
    for i in 0..row-1
        for j in 0..col-1
            matrixNew[i][j] = matrix[i][j].to_i
        end
    end
    return matrixNew
end

# utlized for the Power(A/B) button
def exponent(matrixTmp, input)
  # the double splat operator returns exponent of matrix
  input = input.to_i
  return *matrixTmp**input #splat operator make "Matrix" go away
end

#scaler function used for nA/nB buttons
def scaler(matrix, mat_height, mat_width, input)
  row, col = mat_height, mat_width
  matrixC = Array.new(row){Array.new(col)}
  for i in 0..row-1
    for j in 0..col-1
      #multiply by input and store in different matrix
      matrixC[i][j] = matrix[i][j] * input
    end
  end
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

# function checks if matrix inputted is only digits, no letters
def matrixOnlyDigits(matrix)
    row = findRow(matrix)
    col = findCol(matrix)
    for i in 0..row-1
        for j in 0..col-1
            if (is_letter?(matrix[i][j]))
                return false
            end
        end
    end
    return true
end

# function checks if matrix inputted is correct size 10x10 or less
def matrixSizeIsCorrect(matrix)
    row = findRow(matrix)
    col = findCol(matrix)
    if (row > 9 || row < 0 || col > 9 || col < 0)
        return false
    end
    return true
end

# function checks if there are no empty values within the csv file inputted
def matrixIsComplete(matrix)
    mat_height = findRow(matrix)
    mat_width = findCol(matrix)
    for i in 0..mat_height-1
        for j in 0..mat_width-1
            if matrix[i][j] == nil
                return false
            end
        end
    end
    return true
end

# regex is letter check for string inputted
def is_letter?(str)
    # Use 'str[/[a-zA-Z]*/] == str' to let all_letters
    # yield true for the empty string
    if (str[/[a-zA-Z]+/]  == str)
        return true
    end
    return false
end

# function adds 2 matrices
def add(matrixA, matrixB, row, col)
  #take matrix size and store into row & col
  #declare 3rd matrix with size of matrix width and height
  matrixC = Array.new(row){Array.new(col)}
  for i in 0..row-1
    for j in 0..col-1
      #add and store into 3rd matrix
      matrixC[i][j] = matrixA[i][j].to_i + matrixB[i][j].to_i
    end
  end
  return matrixC
end

# function subtracts 2 matrices
def subtract(matrixA, matrixB, row, col) #A and B must be same size
  #take matrix size and store into row & col
  #declare 3rd matrix with size of matrix width and height
  matrixC = Array.new(row){Array.new(col)}
  for i in 0..row-1
    for j in 0..col-1
      #subtract and store into 3rd matrix
      matrixC[i][j] = matrixA[i][j].to_i - matrixB[i][j].to_i
    end
  end
  return matrixC
end

# fuction for matrix multiplication
def multiply(matrix1, matrix2, row1, col1, row2, col2) #A's columns must equal B's rows
      #create a 3rd matrix
      #3rd matrix will have size of matrix A's column
      # and matrix B's row.
  matrix = Array.new(row1){Array.new(col2)}

  for i in 0..matrix.length - 1
    for j in 0..matrix[0].length - 1
      matrix[i][j] = 0  #set all to 0 initially
    end
  end

  for i in 0..matrix.length - 1
    for j in 0..matrix[0].length - 1
      for k in 0..matrix1[0].length - 1
        #multiplication of matrices is added to 3rd matrix
        matrix[i][j] += matrix1[i][k].to_i * matrix2[k][j].to_i
      end
    end
  end
  return matrix
end

# Identity matrix function
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
  return matrixC
end

# function for A^T and B^T buttons
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
  return matrixC
end
