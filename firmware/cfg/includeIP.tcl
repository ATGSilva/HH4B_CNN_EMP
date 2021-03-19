set algo "myproject"
set version 1.0

set dir ../../src
set algo_modname ${algo}_0

set ipRepoDir user_ip_repo
file mkdir $ipRepoDir
set_property ip_repo_paths $ipRepoDir [current_project]

update_ip_catalog -rebuild

update_ip_catalog -add_ip "/storage1/ag17009/IPBB_TestBuilds/cnn_emp/src/cnn-algo-repo/cnn-algo/firmware/ip/xilinx_com_hls_myproject_1_0.zip" -repo_path $ipRepoDir

create_ip -name ${algo} -library hls -module_name ${algo_modname}

generate_target {instantiation_template} [get_files cnn-algo/cnn-algo.srcs/sources_1/ip/${algo_modname}/${algo_modname}.xci]
generate_target all [get_files cnn-algo/cnn-algo.srcs/sources_1/ip/${algo_modname}/${algo_modname}.xci] 

export_ip_user_files -of_objects [get_files cnn-algo/cnn-algo.srcs/sources_1/ip/${algo_modname}/${algo_modname}.xci] -no_script -force -quiet

create_ip_run [get_files -of_objects [get_fileset sources_1] cnn-algo/cnn-algo.srcs/sources_1/ip/${algo_modname}/${algo_modname}.xci]

