# 
# Report generation script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config  -ruleid {1}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design ZeroFiller has unconnected port IR[14]}}  -suppress 
set_msg_config  -ruleid {10}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design ZeroFiller has unconnected port IR[5]}}  -suppress 
set_msg_config  -ruleid {11}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design ZeroFiller has unconnected port IR[4]}}  -suppress 
set_msg_config  -ruleid {12}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design ZeroFiller has unconnected port IR[3]}}  -suppress 
set_msg_config  -ruleid {13}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design SignExtender has unconnected port IR[15]}}  -suppress 
set_msg_config  -ruleid {14}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design SignExtender has unconnected port IR[14]}}  -suppress 
set_msg_config  -ruleid {15}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design SignExtender has unconnected port IR[13]}}  -suppress 
set_msg_config  -ruleid {16}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design SignExtender has unconnected port IR[12]}}  -suppress 
set_msg_config  -ruleid {17}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design SignExtender has unconnected port IR[11]}}  -suppress 
set_msg_config  -ruleid {18}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design SignExtender has unconnected port IR[10]}}  -suppress 
set_msg_config  -ruleid {19}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design SignExtender has unconnected port IR[9]}}  -suppress 
set_msg_config  -ruleid {2}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design ZeroFiller has unconnected port IR[13]}}  -suppress 
set_msg_config  -ruleid {20}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design SignExtender has unconnected port IR[5]}}  -suppress 
set_msg_config  -ruleid {21}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design SignExtender has unconnected port IR[4]}}  -suppress 
set_msg_config  -ruleid {22}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design SignExtender has unconnected port IR[3]}}  -suppress 
set_msg_config  -ruleid {3}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design ZeroFiller has unconnected port IR[12]}}  -suppress 
set_msg_config  -ruleid {4}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design ZeroFiller has unconnected port IR[11]}}  -suppress 
set_msg_config  -ruleid {5}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design ZeroFiller has unconnected port IR[10]}}  -suppress 
set_msg_config  -ruleid {6}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design ZeroFiller has unconnected port IR[9]}}  -suppress 
set_msg_config  -ruleid {7}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design ZeroFiller has unconnected port IR[8]}}  -suppress 
set_msg_config  -ruleid {8}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design ZeroFiller has unconnected port IR[7]}}  -suppress 
set_msg_config  -ruleid {9}  -id {Synth 8-3331}  -string {{WARNING: [Synth 8-3331] design ZeroFiller has unconnected port IR[6]}}  -suppress 

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set_param xicom.use_bs_reader 1
  open_checkpoint PWF_routed.dcp
  set_property webtalk.parent_dir {C:/Users/Oliver/Desktop/Digitale systemer/digital_systems/PWF/PWF.cache/wt} [current_project]
  catch { write_mem_info -force PWF.mmi }
  write_bitstream -force PWF.bit 
  catch {write_debug_probes -quiet -force PWF}
  catch {file copy -force PWF.ltx debug_nets.ltx}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

