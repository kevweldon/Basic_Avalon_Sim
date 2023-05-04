onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group AVMM_BFM /top_tb/dut/mm_master_bfm_0/clk
add wave -noupdate -expand -group AVMM_BFM /top_tb/dut/mm_master_bfm_0/reset
add wave -noupdate -expand -group AVMM_BFM /top_tb/dut/mm_master_bfm_0/avm_address
add wave -noupdate -expand -group AVMM_BFM /top_tb/dut/mm_master_bfm_0/avm_readdata
add wave -noupdate -expand -group AVMM_BFM /top_tb/dut/mm_master_bfm_0/avm_writedata
add wave -noupdate -expand -group AVMM_BFM /top_tb/dut/mm_master_bfm_0/avm_write
add wave -noupdate -expand -group AVMM_BFM /top_tb/dut/mm_master_bfm_0/avm_read
add wave -noupdate -expand -group AVMM_BFM /top_tb/dut/mm_master_bfm_0/avm_byteenable
add wave -noupdate -expand -group onchip_ram /top_tb/dut/onchip_memory2_0/clk
add wave -noupdate -expand -group onchip_ram -radix unsigned /top_tb/dut/onchip_memory2_0/address
add wave -noupdate -expand -group onchip_ram /top_tb/dut/onchip_memory2_0/clken
add wave -noupdate -expand -group onchip_ram /top_tb/dut/onchip_memory2_0/chipselect
add wave -noupdate -expand -group onchip_ram /top_tb/dut/onchip_memory2_0/write
add wave -noupdate -expand -group onchip_ram -radix unsigned /top_tb/dut/onchip_memory2_0/readdata
add wave -noupdate -expand -group onchip_ram /top_tb/dut/onchip_memory2_0/writedata
add wave -noupdate -expand -group onchip_ram /top_tb/dut/onchip_memory2_0/byteenable
add wave -noupdate -expand -group onchip_ram /top_tb/dut/onchip_memory2_0/reset
add wave -noupdate -expand -group onchip_ram /top_tb/dut/onchip_memory2_0/reset_req
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {614208 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 189
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {2040864 ps}
