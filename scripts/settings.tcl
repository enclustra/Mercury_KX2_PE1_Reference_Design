# ----------------------------------------------------------------------------------
# Copyright (c) 2020 by Enclustra GmbH, Switzerland.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this hardware, software, firmware, and associated documentation files (the
# "Product"), to deal in the Product without restriction, including without
# limitation the rights to use, copy, modify, merge, publish, distribute,
# sublicense, and/or sell copies of the Product, and to permit persons to whom the
# Product is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Product.
#
# THE PRODUCT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# PRODUCT OR THE USE OR OTHER DEALINGS IN THE PRODUCT.
# ----------------------------------------------------------------------------------

# Project settings for Mercury KX2 Reference Design
# Valid module codes
# ME-KX2-160-1C-D10
# ME-KX2-160-2I-D11-P
# ME-KX2-325-2I-D11-P
# ME-KX2-410-2I-D11-P
# ME-KX2-160-1C-D10-ETH
# ME-KX2-160-2I-D11-P-ETH
# ME-KX2-325-2I-D11-P-ETH
# ME-KX2-410-2I-D11-P-ETH

# ----------------------------------------------------------------------------------
# Modify this variable to select your module
if {![info exists module_name]} {set module_name ME-KX2-160-1C-D10}
if {![info exists baseboard]}   {set baseboard PE1}
# ----------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------
# Don't modify anything beyond this line
# ----------------------------------------------------------------------------------

#if any file argument are present, use this value
if {[lindex $argv 0] != ""} { set module_name [lindex $argv 0] }

set module Mercury_KX2

switch $module_name {
  ME-KX2-160-1C-D10 {
    set part xc7k160tfbg676-1 
    set PL_DDR PL_DDR_FBG160
    set ETH None
  }
  ME-KX2-160-2I-D11-P {
    set part xc7k160tffg676-2 
    set PL_DDR PL_DDR_FFG160
    set ETH None
  }
  ME-KX2-325-2I-D11-P {
    set part xc7k325tffg676-2 
    set PL_DDR PL_DDR_FFG325
    set ETH None
  }
  ME-KX2-410-2I-D11-P {
    set part xc7k410tffg676-2 
    set PL_DDR PL_DDR_FFG410
    set ETH None
  }
  ME-KX2-160-1C-D10-ETH {
    set part xc7k160tfbg676-1 
    set PL_DDR PL_DDR_FBG160
    set ETH ETH
  }
  ME-KX2-160-2I-D11-P-ETH {
    set part xc7k160tffg676-2 
    set PL_DDR PL_DDR_FFG160
    set ETH ETH
  }
  ME-KX2-325-2I-D11-P-ETH {
    set part xc7k325tffg676-2 
    set PL_DDR PL_DDR_FFG325
    set ETH ETH
  }
  ME-KX2-410-2I-D11-P-ETH {
    set part xc7k410tffg676-2 
    set PL_DDR PL_DDR_FFG410
    set ETH ETH
  }
  default {
    puts "$module_name not available"
    break
  }
}

#create project name for design
if {![info exists project_name]} {
  set project_name ${module}
  if {[info exists baseboard]} {
    lappend project_name ${baseboard}
    puts $project_name
  }
  set project_name [string map {" " "_"} "${project_name}"]
}

puts "INFO: settings.tcl file loaded."
