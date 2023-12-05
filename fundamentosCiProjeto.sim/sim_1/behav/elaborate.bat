@echo off
set xv_path=D:\\Xilinx\\Vivado\\2016.1\\bin
call %xv_path%/xelab  -wto ab8c4e7a6b554ec690ef470769032ab2 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot teste_behav xil_defaultlib.teste -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
