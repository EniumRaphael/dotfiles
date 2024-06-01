# function vg -d "Run valgrind with all flags"
# 	if test -z "$argv[1]" 
# 		echo "Usage: vg <program>"
# 	else
# 		valgrind --leak-check=full --show-leak-kinds=all --trace-children=yes --track-fds=yes --track-origins=yes --show-reachable=yes $argv
# end
#
# function vgs -d "Run valgrind with all flags and suppressions (readline)"
# 	if test -z "$argv[1]"
# 		echo "Usage: vg <program>"
# 	if test -z ./valgrind_readline_leaks_ignore.txt
# 		vg argv
# 	else
# 		valgrind --leak-check=full --show-leak-kinds=all --trace-children=yes --track-fds=yes --track-origins=yes --show-reachable=yes --suppressions=./valgrind_readline_leaks_ignore.txt $argv
# end

function vg -d "Run valgrind with all flags"
    if test -z "$argv[1]"
        echo "Usage: vg <program>"
    else
        valgrind --leak-check=full --show-leak-kinds=all --trace-children=yes --track-fds=yes --track-origins=yes --show-reachable=yes $argv
    end
end

function vgs -d "Run valgrind with all flags and suppressions (readline)"
    if test -z "$argv[1]"
        echo "Usage: vgs <program>"
    else
        if test -f ./valgrind_readline_leaks_ignore.txt
            valgrind --leak-check=full --show-leak-kinds=all --trace-children=yes --track-fds=yes --track-origins=yes --show-reachable=yes --suppressions=./valgrind_readline_leaks_ignore.txt $argv
        else
            vg $argv
        end
    end
end

