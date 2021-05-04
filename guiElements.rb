root = TkRoot.new { title "Matrix Calculator" }
TkLabel.new(root) do
    text 'Matrix Calculator'
    pack { padx 15 ; pady 15; side 'left' }
end
root.geometry('700x700-5+40')

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
# entry boxes for unary operations
entry_unaryDetA = TkEntry.new(root) {}
entry_unaryDetB = TkEntry.new(root) {}
entry_unaryNtimesA = TkEntry.new(root) {}
entry_unaryNtimesB = TkEntry.new(root) {}

# Text boxes
$text_MatrixA = TkText.new(root) {width 40; height 15; state 'disabled'}
$text_MatrixB = TkText.new(root) {width 40; height 15; state 'disabled'}
$text_MatrixOut = TkText.new(root) {width 40; height 15; state 'disabled'}

# Labels
label_Output = TkLabel.new(root) {width 10; height 1; text 'OUTPUT'; borderwidth 3; relief 'groove'}

# -- PLACING WIDGETS in window --
# matrix widgets
btn_openMatrixA.place('height' => 25, 'width' => 120, 'x' => 20, 'y' => 20)
btn_loadMatrixA.place('height' => 25, 'width' => 120, 'x' => 20, 'y' => 40)
$text_MatrixA.place('x' => 20, 'y' => 70)
btn_openMatrixB.place('height' => 25, 'width' => 120, 'x' => 350, 'y' => 20)
btn_loadMatrixB.place('height' => 25, 'width' => 120, 'x' => 350, 'y' => 40)
$text_MatrixB.place('x' => 350, 'y' => 70)
$text_MatrixOut.place('x' => 20, 'y' => 350)
label_Output.place('x' => 20, 'y' => 325)
# unary operation widgets
btn_unaryAtoI.place('height' => 25, 'width' => 40, 'x' => 350, 'y' => 350)
btn_unaryBtoI.place('height' => 25, 'width' => 40, 'x' => 390, 'y' => 350)
btn_unaryAT.place('height' => 25, 'width' => 40, 'x' => 430, 'y' => 350)
btn_unaryBT.place('height' => 25, 'width' => 40, 'x' => 470, 'y' => 350)
btn_unaryInvA.place('height' => 25, 'width' => 40, 'x' => 510, 'y' => 350)
btn_unaryInvB.place('height' => 25, 'width' => 40, 'x' => 550, 'y' => 350)
btn_unaryDetA.place('height' => 25, 'width' => 60, 'x' => 350, 'y' => 390)
entry_unaryDetA.place('height' => 25, 'width' => 40, 'x' => 405, 'y' => 390)
btn_unaryDetB.place('height' => 25, 'width' => 60, 'x' => 450, 'y' => 390)
entry_unaryDetB.place('height' => 25, 'width' => 40, 'x' => 505, 'y' => 390)
btn_unaryNtimesA.place('height' => 25, 'width' => 40, 'x' => 350, 'y' => 420)
entry_unaryNtimesA.place('height' => 25, 'width' => 40, 'x' => 385, 'y' => 420)
btn_unaryNtimesB.place('height' => 25, 'width' => 40, 'x' => 430, 'y' => 420)
entry_unaryNtimesB.place('height' => 25, 'width' => 40, 'x' => 465, 'y' => 420)
# binary operation widgets 
