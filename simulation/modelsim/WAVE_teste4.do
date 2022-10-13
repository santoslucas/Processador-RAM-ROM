onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color {Orange Red} -itemcolor Gold -radix unsigned /testbench4/Resetn
add wave -noupdate -color Green -itemcolor Green -radix unsigned /testbench4/Clock
add wave -noupdate -color Yellow -itemcolor Yellow -radix unsigned /testbench4/Run
add wave -noupdate -color Red -itemcolor Red -radix unsigned /testbench4/Done
add wave -noupdate -color White -radix unsigned /testbench4/Tstep_Q
add wave -noupdate -color Cyan -itemcolor Cyan /testbench4/DIN
add wave -noupdate -color Magenta -radix hexadecimal /testbench4/r0
add wave -noupdate -color Magenta -radix hexadecimal /testbench4/r1
add wave -noupdate -color Magenta -radix hexadecimal /testbench4/r2
add wave -noupdate -color Magenta -radix hexadecimal /testbench4/r3
add wave -noupdate -color Magenta -radix hexadecimal /testbench4/r4
add wave -noupdate -color Magenta -radix hexadecimal /testbench4/r5
add wave -noupdate -color Magenta -radix hexadecimal /testbench4/r6
add wave -noupdate -color Green -itemcolor Green -radix hexadecimal /testbench4/pc
add wave -noupdate -color Cyan -itemcolor Cyan -radix hexadecimal /testbench4/a
add wave -noupdate -color Cyan -itemcolor Cyan -radix hexadecimal /testbench4/g
add wave -noupdate -color Cyan -itemcolor Cyan -radix unsigned /testbench4/f
add wave -noupdate -color Red -itemcolor Red -radix unsigned /testbench4/zero
add wave -noupdate -color Yellow -itemcolor Yellow -radix hexadecimal /testbench4/addr
add wave -noupdate -color Yellow -itemcolor Yellow -radix hexadecimal /testbench4/dout
add wave -noupdate -color Yellow -itemcolor Yellow -radix hexadecimal /testbench4/DATA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {96 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {4 ps} {110 ps}
