VAL_ARGS="--leak-check=full --track-fds=yes --show-reachable=yes"

valgrind $VAL_ARGS ../pipex empty "grep h" "wc -w" outfile && cat outfile
valgrind $VAL_ARGS ../pipex does_not_exist "grep h" "wc -w" outfile && cat outfile
valgrind $VAL_ARGS ../pipex infile "grep h" "wc -w" does_not_exist && cat does_not_exist
valgrind $VAL_ARGS ../pipex infile "grep h" "wc -w" outfile && cat outfile
valgrind $VAL_ARGS ../pipex infile "bla" "wc -w" outfile && cat outfile
valgrind $VAL_ARGS ../pipex infile "grep h" "bla" outfile && cat outfile
valgrind $VAL_ARGS ../pipex infile "grep h" "wc -w" outfile and more args && cat outfile
valgrind $VAL_ARGS ../pipex "" "" "" ""
valgrind $VAL_ARGS ../pipex infile "grep h -v" "wc -w" outfile && cat outfile
valgrind $VAL_ARGS ../pipex infile "grep h -bla" "wc -w" outfile && cat outfile
valgrind $VAL_ARGS ../pipex a "grep a" "wc -w" outfile && cat outfile
valgrind $VAL_ARGS ../pipex

rm does_not_exist
