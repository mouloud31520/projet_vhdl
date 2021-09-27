# TCL File Generated by Component Editor 18.1
# Thu Sep 16 11:56:43 CEST 2021
# DO NOT MODIFY


# 
# AvalonSlave "AvalonSlave" v1.0
#  2021.09.16.11:56:43
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module AvalonSlave
# 
set_module_property DESCRIPTION ""
set_module_property NAME AvalonSlave
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME AvalonSlave
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL AvalonSlave
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file AvalonSlave.vhd VHDL PATH ../src/AvalonSlave.vhd TOP_LEVEL_FILE


# 
# parameters
# 


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock Clk clk Input 1


# 
# connection point avalon_slave_0_1
# 
add_interface avalon_slave_0_1 avalon end
set_interface_property avalon_slave_0_1 addressUnits WORDS
set_interface_property avalon_slave_0_1 associatedClock clock
set_interface_property avalon_slave_0_1 associatedReset reset_1
set_interface_property avalon_slave_0_1 bitsPerSymbol 8
set_interface_property avalon_slave_0_1 burstOnBurstBoundariesOnly false
set_interface_property avalon_slave_0_1 burstcountUnits WORDS
set_interface_property avalon_slave_0_1 explicitAddressSpan 0
set_interface_property avalon_slave_0_1 holdTime 0
set_interface_property avalon_slave_0_1 linewrapBursts false
set_interface_property avalon_slave_0_1 maximumPendingReadTransactions 0
set_interface_property avalon_slave_0_1 maximumPendingWriteTransactions 0
set_interface_property avalon_slave_0_1 readLatency 0
set_interface_property avalon_slave_0_1 readWaitTime 1
set_interface_property avalon_slave_0_1 setupTime 0
set_interface_property avalon_slave_0_1 timingUnits Cycles
set_interface_property avalon_slave_0_1 writeWaitTime 0
set_interface_property avalon_slave_0_1 ENABLED true
set_interface_property avalon_slave_0_1 EXPORT_OF ""
set_interface_property avalon_slave_0_1 PORT_NAME_MAP ""
set_interface_property avalon_slave_0_1 CMSIS_SVD_VARIABLES ""
set_interface_property avalon_slave_0_1 SVD_ADDRESS_GROUP ""

add_interface_port avalon_slave_0_1 Address address Input 2
add_interface_port avalon_slave_0_1 Write write Input 1
add_interface_port avalon_slave_0_1 WriteData writedata Input 32
add_interface_port avalon_slave_0_1 Read read Input 1
add_interface_port avalon_slave_0_1 ReadData readdata Output 32
add_interface_port avalon_slave_0_1 ByteEnable byteenable Input 4
add_interface_port avalon_slave_0_1 WaitRequest waitrequest Output 1
set_interface_assignment avalon_slave_0_1 embeddedsw.configuration.isFlash 0
set_interface_assignment avalon_slave_0_1 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment avalon_slave_0_1 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment avalon_slave_0_1 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point reset_1
# 
add_interface reset_1 reset end
set_interface_property reset_1 associatedClock ""
set_interface_property reset_1 synchronousEdges NONE
set_interface_property reset_1 ENABLED true
set_interface_property reset_1 EXPORT_OF ""
set_interface_property reset_1 PORT_NAME_MAP ""
set_interface_property reset_1 CMSIS_SVD_VARIABLES ""
set_interface_property reset_1 SVD_ADDRESS_GROUP ""

add_interface_port reset_1 Reset reset Input 1

