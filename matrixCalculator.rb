   # course: cmps3500
   # CLASS Project
   # RUBY IMPLEMENTATION OF A CUSTOM MATRIX CALCULATION
   # date: 4/24/2021
   # Student 1: Jacqueline Peralta
   # Student 2: Angel Lopez
   # Student 3:
   # description: Implementation of a matrix calculator

require 'tk'

# global variables
$matrix1FileName
$matrix2FileName
$matrixA
$matrixB
$text_Matrix1
$text_Matrix2

root = TkRoot.new { title "Matrix Calculator" }
TkLabel.new(root) do
    text 'Matrix Calculator'
    pack { padx 15 ; pady 15; side 'left' }
end
root.geometry('600x600-5+40')

btn_openMatrix1 = TkButton.new(root) do
    text " OPEN Matrix1 file "
    borderwidth 5
    underline 0
    state "normal"
    cursor "hand2"
    relief "groove"
    activebackground "blue"
    command {btn_openMatrix1_click}
end
btn_openMatrix2 = TkButton.new(root) do
    text " OPEN Matrix2 file "
    borderwidth 5
    underline 0
    state "normal"
    cursor "hand2"
    relief "groove"
    activebackground "blue"
    command {btn_openMatrix2_click}
end
btn_loadMatrix1 = TkButton.new(root) do
    text " LOAD "
    borderwidth 5
    underline 0
    state "normal"
    cursor "hand2"
    relief "groove"
    activebackground "blue"
    command {btn_loadMatrix1_click}
end
btn_loadMatrix2 = TkButton.new(root) do
    text " LOAD "
    borderwidth 5
    underline 0
    state "normal"
    cursor "hand2"
    relief "groove"
    activebackground "blue"
    command {btn_loadMatrix2_click}
end

$text_Matrix1 = TkText.new(root) {width 40; height 10}
#text_Matrix1['state'] = 'disabled'
$text_Matrix2 = TkText.new(root) {width 40; height 10}
#$text_Matrix2['state'] = 'disabled'

# Place widgets in GUI window
btn_openMatrix1.place('height' => 25, 'width' => 120, 'x' => 20, 'y' => 20)
btn_openMatrix2.place('height' => 25, 'width' => 120, 'x' => 160, 'y' => 20)
btn_loadMatrix1.place('height' => 25, 'width' => 120, 'x' => 20, 'y' => 40)
btn_loadMatrix2.place('height' => 25, 'width' => 120, 'x' => 160, 'y' => 40)
$text_Matrix1.place('x' => 20, 'y' => 200)
$text_Matrix2.place('x' => 20, 'y' => 400)

# FUNCTION DECLARATIONS -------
# button click funciton
def btn_openMatrix1_click
    $matrix1FileName = Tk.getOpenFile
end

def btn_openMatrix2_click
    $matrix2FileName = Tk.getOpenFile
end

require 'csv'
def btn_loadMatrix1_click
    row, col = 8, 8
    index = 0
    matrixAtmp = Array.new(row){Array.new(col)}
    CSV.foreach($matrix1FileName) do |row|
        matrixAtmp[index] = row
        index = index + 1
    end
    $matrixA = matrixAtmp
    insert_Matrix1()
end

def btn_loadMatrix2_click
    row, col = 8, 8
    index = 0
    matrixBtmp = Array.new(row){Array.new(col)}
    CSV.foreach($matrix2FileName) do |row|
        matrixBtmp[index] = row
        index = index + 1
    end
    $matrixB = matrixBtmp
    insert_Matrix2()
end

def insert_Matrix1
    i = 1
    j = 0
    $matrixA.each do |row|
        row.each do |element|
            index = i.to_s + "." + j.to_s
            $text_Matrix1.insert(index , element)
            j = j + 4
            index = i.to_s + "." + j.to_s
            $text_Matrix1.insert(index , " ")
            j = j + 4
        end
        index = i.to_s + "." + j.to_s
        $text_Matrix1.insert(index, "\n")
        i = i + 1
    end
end

def insert_Matrix2
    i = 1
    j = 0
    $matrixB.each do |row|
        row.each do |element|
            index = i.to_s + "." + j.to_s
            $text_Matrix2.insert(index , element)
            j = j + 4
            index = i.to_s + "." + j.to_s
            $text_Matrix2.insert(index , " ")
            j = j + 4
        end
        index = i.to_s + "." + j.to_s
        $text_Matrix2.insert(index, "\n")
        i = i + 1
    end
end

Tk.mainloop
