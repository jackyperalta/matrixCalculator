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
$label_MatrixA      # labels
$label_MatrixB
$entry_unaryNtimesA_Var = TkVariable.new # entry box variables
$entry_unaryNtimesB_Var = TkVariable.new
$entry_unaryPowerA_Var = TkVariable.new
$entry_unaryPowerB_Var = TkVariable.new
$label_MatrixAText = TkVariable.new
$label_MatrixBText = TkVariable.new

load 'guiElements.rb'
load 'guiFunctions.rb'

# disable all buttons for error detection
disableAllBtns('A')
disableAllBtns('B')

Tk.mainloop
