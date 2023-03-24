# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lwidmer <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/24 10:51:58 by lwidmer           #+#    #+#              #
#    Updated: 2023/03/24 11:00:31 by lwidmer          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

outfile:
	touch outfile

test: outfile
	rm outfile
	../pipex infile "grep a" "wc -w" outfile
	cat outfile

test2: outfile
	rm outfile
	../pipex infile "grep h -v" "wc -w" outfile
	cat outfile

test3: outfile
	rm outfile
	../pipex infile "grep a" "grep d" outfile
	cat outfile


test_output: test test2 test3

test_memory:
	bash pipex_memory_tester.sh
	
