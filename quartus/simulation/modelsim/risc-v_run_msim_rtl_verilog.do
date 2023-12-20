transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Study/UIT/HDL/project/verilog/ALU {D:/Study/UIT/HDL/project/verilog/ALU/alu.v}
vlog -vlog01compat -work work +incdir+D:/Study/UIT/HDL/project/quartus {D:/Study/UIT/HDL/project/quartus/register_file.v}
vlog -vlog01compat -work work +incdir+D:/Study/UIT/HDL/project/quartus {D:/Study/UIT/HDL/project/quartus/data_memory.v}
vlog -vlog01compat -work work +incdir+D:/Study/UIT/HDL/project/quartus {D:/Study/UIT/HDL/project/quartus/mux2to1_32bit.v}
vlog -vlog01compat -work work +incdir+D:/Study/UIT/HDL/project/quartus {D:/Study/UIT/HDL/project/quartus/mux4to1_32bit.v}
vlog -vlog01compat -work work +incdir+D:/Study/UIT/HDL/project/quartus {D:/Study/UIT/HDL/project/quartus/sign_extend.v}
vlog -vlog01compat -work work +incdir+D:/Study/UIT/HDL/project/quartus {D:/Study/UIT/HDL/project/quartus/control_unit_ver1.v}
vlog -vlog01compat -work work +incdir+D:/Study/UIT/HDL/project/quartus {D:/Study/UIT/HDL/project/quartus/adder.v}
vlog -vlog01compat -work work +incdir+D:/Study/UIT/HDL/project/quartus {D:/Study/UIT/HDL/project/quartus/if_cache.v}
vlog -vlog01compat -work work +incdir+D:/Study/UIT/HDL/project/quartus {D:/Study/UIT/HDL/project/quartus/id_cache.v}
vlog -vlog01compat -work work +incdir+D:/Study/UIT/HDL/project/quartus {D:/Study/UIT/HDL/project/quartus/program_counter_ver2.v}
vlog -vlog01compat -work work +incdir+D:/Study/UIT/HDL/project/quartus {D:/Study/UIT/HDL/project/quartus/alu_cache.v}
vlog -vlog01compat -work work +incdir+D:/Study/UIT/HDL/project/quartus {D:/Study/UIT/HDL/project/quartus/memory_cache.v}
vlog -vlog01compat -work work +incdir+D:/Study/UIT/HDL/project/quartus {D:/Study/UIT/HDL/project/quartus/forwarding_unit.v}
vlog -vlog01compat -work work +incdir+D:/Study/UIT/HDL/project/quartus {D:/Study/UIT/HDL/project/quartus/riscv_cpu_ver3.v}
vlog -vlog01compat -work work +incdir+D:/Study/UIT/HDL/project/quartus {D:/Study/UIT/HDL/project/quartus/mux3to1_32bit.v}
vlog -vlog01compat -work work +incdir+D:/Study/UIT/HDL/project/quartus {D:/Study/UIT/HDL/project/quartus/branch_hazard_control_unit.v}
vlog -vlog01compat -work work +incdir+D:/Study/UIT/HDL/project/quartus {D:/Study/UIT/HDL/project/quartus/instruction_mem.v}

vlog -vlog01compat -work work +incdir+D:/Study/UIT/HDL/project/quartus {D:/Study/UIT/HDL/project/quartus/riscv_cpu_ver3_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneii_ver -L rtl_work -L work -voptargs="+acc"  riscv_cpu_ver3_tb

add wave *
view structure
view signals
run -all
