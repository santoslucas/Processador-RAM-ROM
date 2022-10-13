onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color {Orange Red} -itemcolor Orange -radix unsigned /testbench/Resetn
add wave -noupdate -color Green -itemcolor Green -radix unsigned /testbench/Clock
add wave -noupdate -color Yellow -itemcolor Yellow -radix unsigned /testbench/Run
add wave -noupdate -color Red -itemcolor Red -radix unsigned /testbench/Done
add wave -noupdate -color White -radix unsigned /testbench/Tstep_Q
add wave -noupdate -divider {Mem de Instrucoes}
add wave -noupdate -color Khaki -itemcolor Khaki /testbench/DIN
add wave -noupdate -divider Registradores
add wave -noupdate -color Magenta -itemcolor White -radix hexadecimal /testbench/r0
add wave -noupdate -color Magenta -itemcolor White -radix hexadecimal /testbench/r1
add wave -noupdate -color Magenta -itemcolor White -radix hexadecimal /testbench/r2
add wave -noupdate -color Magenta -itemcolor White -radix hexadecimal /testbench/r3
add wave -noupdate -color Magenta -itemcolor White -radix hexadecimal /testbench/r4
add wave -noupdate -color Magenta -itemcolor White -radix hexadecimal /testbench/r5
add wave -noupdate -color Magenta -itemcolor White -radix hexadecimal /testbench/r6
add wave -noupdate -color Green -itemcolor Green -radix hexadecimal /testbench/pc
add wave -noupdate -color Cyan -itemcolor Cyan -radix hexadecimal /testbench/a
add wave -noupdate -color Cyan -itemcolor Cyan -radix hexadecimal /testbench/g
add wave -noupdate -color Cyan -itemcolor Cyan -radix unsigned /testbench/f
add wave -noupdate -divider {Condicao Branch}
add wave -noupdate -color Red -itemcolor Red -radix unsigned /testbench/zero
add wave -noupdate -divider {Mem de Dados}
add wave -noupdate -color Yellow -itemcolor Yellow -radix hexadecimal /testbench/addr
add wave -noupdate -color Yellow -itemcolor Yellow -radix hexadecimal /testbench/dout
add wave -noupdate -color Yellow -itemcolor Yellow -radix hexadecimal /testbench/DATA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {48 ps} 0}
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
WaveRestoreZoom {0 ps} {101 ps}
