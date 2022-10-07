transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/ProgramasCEFET/quartus/AOC\ II/pratica2 {C:/ProgramasCEFET/quartus/AOC II/pratica2/rom.v}
vlog -vlog01compat -work work +incdir+C:/ProgramasCEFET/quartus/AOC\ II/pratica2 {C:/ProgramasCEFET/quartus/AOC II/pratica2/ram.v}
vlog -vlog01compat -work work +incdir+C:/ProgramasCEFET/quartus/AOC\ II/pratica2 {C:/ProgramasCEFET/quartus/AOC II/pratica2/pratica2.v}

vlog -vlog01compat -work work +incdir+C:/ProgramasCEFET/quartus/AOC\ II/pratica2 {C:/ProgramasCEFET/quartus/AOC II/pratica2/testbench.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run -all
