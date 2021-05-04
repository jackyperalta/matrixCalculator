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
$matrixAFileName
$matrixBFileName
$row
$column
$matrixA            # matrix variables
$matrixB
$matrixOut
$matrixTemp
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
