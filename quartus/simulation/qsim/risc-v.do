onerror {quit -f}
vlib work
vlog -work work risc-v.vo
vlog -work work risc-v.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.mux4to1_32bit_vlg_vec_tst
vcd file -direction risc-v.msim.vcd
vcd add -internal mux4to1_32bit_vlg_vec_tst/*
vcd add -internal mux4to1_32bit_vlg_vec_tst/i1/*
add wave /*
run -all
