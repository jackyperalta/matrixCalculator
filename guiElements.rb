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

# Text boxes
$text_MatrixA = TkText.new(root) {width 40; height 15; state 'disabled'}
$text_MatrixB = TkText.new(root) {width 40; height 15; state 'disabled'}
$text_MatrixOut = TkText.new(root) {width 40; height 15; state 'disabled'}

# Labels
label_Output = TkLabel.new(root) {width 10; height 1; text 'OUTPUT'; borderwidth 3; relief 'groove'}

# -- PLACING ELEMENTS --
# Place widgets in GUI window
btn_openMatrixA.place('height' => 25, 'width' => 120, 'x' => 20, 'y' => 20)
btn_loadMatrixA.place('height' => 25, 'width' => 120, 'x' => 20, 'y' => 40)
$text_MatrixA.place('x' => 20, 'y' => 70)
btn_openMatrixB.place('height' => 25, 'width' => 120, 'x' => 350, 'y' => 20)
btn_loadMatrixB.place('height' => 25, 'width' => 120, 'x' => 350, 'y' => 40)
$text_MatrixB.place('x' => 350, 'y' => 70)
$text_MatrixOut.place('x' => 20, 'y' => 350)
label_Output.place('x' => 20, 'y' => 325)
