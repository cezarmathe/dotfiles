# Terminal configuration

_TERMINAL_SOURCE_MODULES=("autostart" "env" "extra" "functions" "alias")

for terminal_source_module in "${_TERMINAL_SOURCE_MODULES[@]}"
do
    for module_source_file in "${HOME}"/.config/termconf/"${terminal_source_module}"/*.sh
    do
        source "${module_source_file}"
    done
done
