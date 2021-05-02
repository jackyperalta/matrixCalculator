root = TkRoot.new { title "Matrix Calculator" }
TkLabel.new(root) do
    text 'Matrix Calculator'
    pack { padx 15 ; pady 15; side 'left' }
end
root.geometry('600x700-5+40')

# Open file buttons
btn_openMatrix1 = TkButton.new(root) do
    text " OPEN MatrixA file "
    borderwidth 5
    underline 0
    state "normal"
    cursor "hand2"
    relief "groove"
    activebackground "blue"
    command {btn_openMatrix1_click}
end
btn_openMatrix2 = TkButton.new(root) do
    text " OPEN MatrixB file "
    borderwidth 5
    underline 0
    state "normal"
    cursor "hand2"
    relief "groove"
    activebackground "blue"
    command {btn_openMatrix2_click}
end

# Load file buttons
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

# Text boxes
$text_MatrixA = TkText.new(root) {width 40; height 15; state 'disabled'}
$text_MatrixB = TkText.new(root) {width 40; height 15; state 'disabled'}

# -- PLACING ELEMENTS --
# Place widgets in GUI window
btn_openMatrix1.place('height' => 25, 'width' => 120, 'x' => 20, 'y' => 20)
btn_openMatrix2.place('height' => 25, 'width' => 120, 'x' => 20, 'y' => 350)
btn_loadMatrix1.place('height' => 25, 'width' => 120, 'x' => 20, 'y' => 40)
btn_loadMatrix2.place('height' => 25, 'width' => 120, 'x' => 20, 'y' => 370)
$text_MatrixA.place('x' => 20, 'y' => 70)
$text_MatrixB.place('x' => 20, 'y' => 400)
