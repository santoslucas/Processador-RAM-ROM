onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color {Orange Red} -itemcolor Gold -radix unsigned /testbench3/Resetn
add wave -noupdate -color Green -itemcolor Green -radix unsigned /testbench3/Clock
add wave -noupdate -color Yellow -itemcolor Yellow -radix unsigned /testbench3/Run
add wave -noupdate -color Red -itemcolor Red -radix unsigned /testbench3/Done
add wave -noupdate -color White -radix unsigned /testbench3/Tstep_Q
add wave -noupdate -divider {Mem de instrucoes}
add wave -noupdate -color Khaki -itemcolor Khaki /testbench3/DIN
add wave -noupdate -divider Registradores
add wave -noupdate -color Magenta -radix hexadecimal /testbench3/r0
add wave -noupdate -color Magenta -radix hexadecimal /testbench3/r1
add wave -noupdate -color Magenta -radix hexadecimal /testbench3/r2
add wave -noupdate -color Magenta -radix hexadecimal /testbench3/r3
add wave -noupdate -color Magenta -radix hexadecimal /testbench3/r4
add wave -noupdate -color Magenta -radix hexadecimal /testbench3/r5
add wave -noupdate -color Magenta -radix hexadecimal /testbench3/r6
add wave -noupdate -color Green -itemcolor Green -radix hexadecimal /testbench3/pc
add wave -noupdate -color Cyan -itemcolor Cyan -radix hexadecimal /testbench3/a
add wave -noupdate -color Cyan -itemcolor Cyan -radix hexadecimal /testbench3/g
add wave -noupdate -color Cyan -itemcolor Cyan -radix unsigned /testbench3/f
add wave -noupdate -divider {Condicao Branch}
add wave -noupdate -color Red -itemcolor Red -radix unsigned /testbench3/zero
add wave -noupdate -divider {Mem de dados}
add wave -noupdate -color Yellow -itemcolor Yellow -radix hexadecimal /testbench3/addr
add wave -noupdate -color Yellow -itemcolor Yellow -radix hexadecimal /testbench3/dout
add wave -noupdate -color Yellow -itemcolor Yellow -radix hexadecimal /testbench3/DATA
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {32 ps} 0}
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
WaveRestoreZoom {0 ps} {82 ps}
