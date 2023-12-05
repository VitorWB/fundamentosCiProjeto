@echo off
set xv_path=D:\\Xilinx\\Vivado\\2016.1\\bin
call %xv_path%/xsim teste_behav -key {Behavioral:sim_1:Functional:teste} -tclbatch teste.tcl -view D:/projetos/fundamentosCiProjeto/teste_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
