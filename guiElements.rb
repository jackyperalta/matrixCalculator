root = TkRoot.new { title "Matrix Calculator" }
TkLabel.new(root) do
    text 'Matrix Calculator'
    pack { padx 15 ; pady 15; side 'left' }
end
root.geometry('1010x700-5+40')

# Open file buttons
btn_openMatrixA = TkButton.new(root) do
    text " OPEN MatrixA file "
    borderwidth 5
    underline 0
    state "normal"
    cursor "hand2"
    relief "groove"
    activebackground "blue"
    command {btn_openMatrixA_click}
end
btn_openMatrixB = TkButton.new(root) do
    text " OPEN MatrixB file "
    borderwidth 5
    underline 0
    state "normal"
    cursor "hand2"
    relief "groove"
    activebackground "blue"
    command {btn_openMatrixB_click}
end

# Load file buttons
btn_loadMatrixA = TkButton.new(root) do
    text " LOAD "
    borderwidth 5
    underline 0
    state "normal"
    cursor "hand2"
    relief "groove"
    activebackground "blue"
    command {btn_loadMatrixA_click}
end
btn_loadMatrixB = TkButton.new(root) do
    text " LOAD "
    borderwidth 5
    underline 0
    state "normal"
    cursor "hand2"
    relief "groove"
    activebackground "blue"
    command {btn_loadMatrixB_click}
end

# buttons for unary operations
btn_unaryAtoI = TkButton.new(root) {
    borderwidth 5
    relief 'groove'
    text 'A=I'
    state 'normal'
    cursor 'hand2'
    activebackground 'blue'
    command {btn_unaryAtoI_click}
}
btn_unaryBtoI = TkButton.new(root) {
    borderwidth 5
    text 'B=I'
    relief 'groove'
    state 'normal'
    cursor 'hand2'
    activebackground 'blue'
    command {btn_unaryBtoI_click}
}
btn_unaryAT = TkButton.new(root) {
    borderwidth 5
    relief 'groove'
    text 'A^T'
    state 'normal'
    cursor 'hand2'
    activebackground 'blue'
    command {btn_unaryAT_click}
}
btn_unaryBT = TkButton.new(root) {
    borderwidth 5
    relief 'groove'
    text 'B^T'
    state 'normal'
    cursor 'hand2'
    activebackground 'blue'
    command {btn_unaryBT_click}
}
btn_unaryInvA = TkButton.new(root) {
    borderwidth 5
    relief 'groove'
    text 'A^-1'
    state 'normal'
    cursor 'hand2'
    activebackground 'blue'
    command {btn_unaryInvA_click}
}
btn_unaryInvB = TkButton.new(root) {
    borderwidth 5
    relief 'groove'
    text 'B^-1'
    state 'normal'
    cursor 'hand2'
    activebackground 'blue'
    command {btn_unaryInvB_click}
}
btn_unaryDetA = TkButton.new(root) {
    borderwidth 5
    relief 'groove'
    text 'det(A)'
    state 'normal'
    cursor 'hand2'
    activebackground 'blue'
    command {btn_unaryDetA_click}
}
btn_unaryDetB = TkButton.new(root) {
    borderwidth 5
    relief 'groove'
    text 'det(B)'
    state 'normal'
    cursor 'hand2'
    activebackground 'blue'
    command {btn_unaryDetB_click}
}
btn_unaryNtimesA = TkButton.new(root) {
    borderwidth 5
    relief 'groove'
    text 'nA'
    state 'normal'
    cursor 'hand2'
    activebackground 'blue'
    command {btn_unaryNtimesA_click}
}
btn_unaryNtimesB = TkButton.new(root) {
    borderwidth 5
    relief 'groove'
    text 'nB'
    state 'normal'
    cursor 'hand2'
    activebackground 'blue'
    command {btn_unaryNtimesB_click}
}
btn_unaryPowerA = TkButton.new(root) {
    borderwidth 5
    relief 'groove'
    text 'power(A)'
    state 'normal'
    cursor 'hand2'
    activebackground 'blue'
    command {btn_unaryPowerA_click}
}
btn_unaryPowerB = TkButton.new(root) {
    borderwidth 5
    relief 'groove'
    text 'power(B)'
    state 'normal'
    cursor 'hand2'
    activebackground 'blue'
    command {btn_unaryPowerB_click}
}

# buttons for binary operations
btn_binaryAplusB = TkButton.new(root) {
    borderwidth 5
    relief 'groove'
    text 'A+B'
    state 'normal'
    cursor 'hand2'
    activebackground 'blue'
    command {btn_binaryAplusB_click}
}
btn_binaryAminusB = TkButton.new(root) {
    borderwidth 5
    relief 'groove'
    text 'A-B'
    state 'normal'
    cursor 'hand2'
    activebackground 'blue'
    command {btn_binaryAminusB_click}
}
btn_binaryBminusA = TkButton.new(root) {
    borderwidth 5
    relief 'groove'
    text 'B-A'
    state 'normal'
    cursor 'hand2'
    activebackground 'blue'
    command {btn_binaryBminusA_click}
}
btn_binaryAtimesB = TkButton.new(root) {
    borderwidth 5
    relief 'groove'
    text 'AB'
    state 'normal'
    cursor 'hand2'
    activebackground 'blue'
    command {btn_binaryAtimesB_click}
}
btn_binaryBtimesA = TkButton.new(root) {
    borderwidth 5
    relief 'groove'
    text 'BA'
    state 'normal'
    cursor 'hand2'
    activebackground 'blue'
    command {btn_binaryBtimesA_click}
}
btn_binaryAcopytoB = TkButton.new(root) {
    borderwidth 5
    relief 'groove'
    text 'Copy A to B'
    state 'normal'
    cursor 'hand2'
    activebackground 'blue'
    command {btn_binaryAcopytoB_click}
}
btn_binaryBcopytoA = TkButton.new(root) {
    borderwidth 5
    relief 'groove'
    text 'Copy B to A'
    state 'normal'
    cursor 'hand2'
    activebackground 'blue'
    command {btn_binaryBcopytoA_click}
}
btn_binaryAswaptoB = TkButton.new(root) {
    borderwidth 5
    relief 'groove'
    text 'Swap A to B'
    state 'normal'
    cursor 'hand2'
    activebackground 'blue'
    command {btn_binaryAswaptoB_click}
}

# entry boxes for unary operations
entry_unaryNtimesA = TkEntry.new(root) { textvariable $entry_unaryNtimesA_Var }
entry_unaryNtimesB = TkEntry.new(root) { textvariable $entry_unaryNtimesB_Var }
entry_unaryPowerA = TkEntry.new(root) { textvariable $entry_unaryPowerA_Var }
entry_unaryPowerB = TkEntry.new(root) { textvariable $entry_unaryPowerB_Var }

# Text boxes
$text_MatrixA = TkText.new(root) {width 60; height 15; state 'disabled'}
$text_MatrixB = TkText.new(root) {width 60; height 15; state 'disabled'}
$text_MatrixOut = TkText.new(root) {width 80; height 15; state 'disabled'}

# Labels
label_Output = TkLabel.new(root) {width 10; height 1; text 'OUTPUT'; borderwidth 0; relief 'groove'}
label_Unary = TkLabel.new(root) {width 20; height 1; text 'Unary Operations'; borderwidth 0; relief 'groove'}
label_Binary = TkLabel.new(root) {width 20; height 1; text 'Binary Operations'; borderwidth 0; relief 'groove'}

# -- PLACING WIDGETS in window --
# matrix widgets
btn_openMatrixA.place('height' => 25, 'width' => 120, 'x' => 20, 'y' => 20)
btn_loadMatrixA.place('height' => 25, 'width' => 120, 'x' => 20, 'y' => 40)
$text_MatrixA.place('x' => 20, 'y' => 70)
btn_openMatrixB.place('height' => 25, 'width' => 120, 'x' => 510, 'y' => 20)
btn_loadMatrixB.place('height' => 25, 'width' => 120, 'x' => 510, 'y' => 40)
$text_MatrixB.place('x' => 510, 'y' => 70)
$text_MatrixOut.place('x' => 20, 'y' => 350)
label_Output.place('x' => 20, 'y' => 325)

# unary operation widgets
x = 680
y = 340
label_Unary.place('x' => x, 'y' => y)
btn_unaryAtoI.place('height' => 25, 'width' => 40, 'x' => x, 'y' => y+30)
btn_unaryBtoI.place('height' => 25, 'width' => 40, 'x' => x+40, 'y' => y+30)
btn_unaryAT.place('height' => 25, 'width' => 40, 'x' => x+80, 'y' => y+30)
btn_unaryBT.place('height' => 25, 'width' => 40, 'x' => x+120, 'y' => y+30)
btn_unaryInvA.place('height' => 25, 'width' => 40, 'x' => x+160, 'y' => y+30)
btn_unaryInvB.place('height' => 25, 'width' => 40, 'x' => x+200, 'y' => y+30)
btn_unaryDetA.place('height' => 25, 'width' => 60, 'x' => x, 'y' => y+60)
btn_unaryDetB.place('height' => 25, 'width' => 60, 'x' => x+60, 'y' => y+60)
btn_unaryNtimesA.place('height' => 25, 'width' => 40, 'x' => x, 'y' => y+90)
entry_unaryNtimesA.place('height' => 25, 'width' => 40, 'x' => x+35, 'y' => y+90)
btn_unaryNtimesB.place('height' => 25, 'width' => 40, 'x' => x+80, 'y' => y+90)
entry_unaryNtimesB.place('height' => 25, 'width' => 40, 'x' => x+115, 'y' => y+90)
btn_unaryPowerA.place('height' => 25, 'width' => 60, 'x' => x, 'y' => y+120)
entry_unaryPowerA.place('height' => 25, 'width' => 40, 'x' => x+55, 'y' => y+120)
btn_unaryPowerB.place('height' => 25, 'width' => 60, 'x' => x+100, 'y' => y+120)
entry_unaryPowerB.place('height' => 25, 'width' => 40, 'x' => x+155, 'y' => y+120)

# binary operation widgets
x = 680
y = 500
label_Binary.place('x' => x, 'y' => y)
btn_binaryAplusB.place('height' => 25, 'width' => 40, 'x' => x, 'y' => y+30)
btn_binaryAminusB.place('height' => 25, 'width' => 40, 'x' => x+40, 'y' => y+30)
btn_binaryBminusA.place('height' => 25, 'width' => 40, 'x' => x+80, 'y' => y+30)
btn_binaryAtimesB.place('height' => 25, 'width' => 40, 'x' => x+120, 'y' => y+30)
btn_binaryBtimesA.place('height' => 25, 'width' => 40, 'x' => x+160, 'y' => y+30)
btn_binaryAcopytoB.place('height' => 25, 'width' => 80, 'x' => x, 'y' => y+60)
btn_binaryBcopytoA.place('height' => 25, 'width' => 80, 'x' => x+80, 'y' => y+60)
btn_binaryAswaptoB.place('height' => 25, 'width' => 80, 'x' => x+160, 'y' => y+60)
