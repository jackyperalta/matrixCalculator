# button click funcitons
def btn_openMatrixA_click
    $matrixAFileName = Tk.getOpenFile
end

def btn_openMatrixB_click
    $matrixBFileName = Tk.getOpenFile
end
# start of unary button functions
def btn_unaryAtoI_click

end

def btn_unaryBtoI_click

end

def btn_unaryAT_click

end

def btn_unaryBT_click

end

def btn_unaryInvA_click

end

def btn_unaryInvB_click

end

def btn_unaryDetA_click
    # gather input from entry box
    puts $entry_unaryDetA_Var
end

def btn_unaryDetB_click
    # gather input from entry box
    puts $entry_unaryDetB_Var
end

def btn_unaryNtimesA_click
    # gather input from entry box
    puts $entry_unaryNtimesA_Var
end

def btn_unaryNtimesB_click
    # gather input from entry box
    puts $entry_unaryNtimesB_Var
end

def btn_unaryPowerA_click
    # gather input from entry box
    puts $entry_unaryPowerA_Var
end

def btn_unaryPowerB_click
    # gather input from entry box
    puts $entry_unaryPowerB_Var
end
# start of binary function buttons
def btn_binaryAplusB_click

end

def btn_binaryAminusB_click

end

def btn_binaryBminusA_click

end

def btn_binaryAtimesB_click

end

def btn_binaryBtimesA_click

end

def btn_binaryAcopytoB_click
    $matrixB = $matrixA
    insert_MatrixB()
end

def btn_binaryBcopytoA_click
    $matrixA = $matrixB
    insert_MatrixA()
end

def btn_binaryAswaptoB_click
    matrixtmp = $matrixA
    $matrixA = $matrixB
    $matrixB = matrixtmp
    insert_MatrixA()
    insert_MatrixB()
end

# gathering input from csv file functions
require 'csv'
def btn_loadMatrixA_click
    row, col = 8, 8
    index = 0
    matrixAtmp = Array.new(row){Array.new(col)}
    CSV.foreach($matrixAFileName) do |row|
        matrixAtmp[index] = row
        index = index + 1
    end
    $matrixA = matrixAtmp
    insert_MatrixA()
end

def btn_loadMatrixB_click
    row, col = 8, 8
    index = 0
    matrixBtmp = Array.new(row){Array.new(col)}
    CSV.foreach($matrixBFileName) do |row|
        matrixBtmp[index] = row
        index = index + 1
    end
    $matrixB = matrixBtmp
    insert_MatrixB()
end

# insert Matrix's into their text boxes
def insert_MatrixA
    $text_MatrixA['state'] = 'normal'
    $text_MatrixA.delete(1.0, 10.40)
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

def insert_MatrixB
    $text_MatrixB['state'] = 'normal'
    $text_MatrixB.delete(1.0, 10.40)
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

def insert_MatrixOut
    $text_MatrixOut['state'] = 'normal'
    $text_MatrixOut.delete(1.0, 10.40)
    i = 1
    j = 0
    $matrixB.each do |row|
        row.each do |element|
            index = i.to_s + "." + j.to_s
            $text_MatrixOut.insert(index , element)
            j = j + 4
            index = i.to_s + "." + j.to_s
            $text_MatrixOut.insert(index , " ")
            j = j + 4
        end
        index = i.to_s + "." + j.to_s
        $text_MatrixOut.insert(index, "\n")
        i = i + 1
    end
    $text_MatrixOut['state'] = 'disabled'
end
