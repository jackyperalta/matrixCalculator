# button click funciton
def btn_openMatrix1_click
    $matrixAFileName = Tk.getOpenFile
end

def btn_openMatrix2_click
    $matrixBFileName = Tk.getOpenFile
end


# gathering input from csv file functions
require 'csv'
def btn_loadMatrix1_click
    row, col = 8, 8
    index = 0
    matrixAtmp = Array.new(row){Array.new(col)}
    CSV.foreach($matrixAFileName) do |row|
        matrixAtmp[index] = row
        index = index + 1
    end
    $matrixA = matrixAtmp
    $text_MatrixA['state'] = 'normal'
    $text_MatrixA.delete(1.0, 10.40)
    insert_Matrix1()
end

def btn_loadMatrix2_click
    row, col = 8, 8
    index = 0
    matrixBtmp = Array.new(row){Array.new(col)}
    CSV.foreach($matrixBFileName) do |row|
        matrixBtmp[index] = row
        index = index + 1
    end
    $matrixB = matrixBtmp
    $text_MatrixB['state'] = 'normal'
    $text_MatrixB.delete(1.0, 10.40)
    insert_Matrix2()
end

# insert Matrix's into their text boxes
def insert_Matrix1
    i = 1
    j = 0
    $matrixA.each do |row|
        row.each do |element|
            index = i.to_s + "." + j.to_s
            $text_MatrixA.insert(index , element)
            j = j + 4
            index = i.to_s + "." + j.to_s
            $text_MatrixA.insert(index , " ")
            j = j + 4
        end
        index = i.to_s + "." + j.to_s
        $text_MatrixA.insert(index, "\n")
        i = i + 1
    end
    $text_MatrixA['state'] = 'disabled'
end

def insert_Matrix2
    i = 1
    j = 0
    $matrixB.each do |row|
        row.each do |element|
            index = i.to_s + "." + j.to_s
            $text_MatrixB.insert(index , element)
            j = j + 4
            index = i.to_s + "." + j.to_s
            $text_MatrixB.insert(index , " ")
            j = j + 4
        end
        index = i.to_s + "." + j.to_s
        $text_MatrixB.insert(index, "\n")
        i = i + 1
    end
    $text_MatrixB['state'] = 'disabled'
end
