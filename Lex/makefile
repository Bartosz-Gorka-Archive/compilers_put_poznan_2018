# Makefile - flex projects @Bartosz Górka

# COPY FROM THIS PLACE
# SCANNER_DESC_FILE=scan.l
# SCANNER_EXEC_FILE=scan.x
#
# all: $(SCANNER_EXEC_FILE)
#
# $(SCANNER_EXEC_FILE): lex.yy.c
# 	gcc -o $(SCANNER_EXEC_FILE) lex.yy.c
#
# lex.yy.c: $(SCANNER_DESC_FILE)
# 	flex -l $(SCANNER_DESC_FILE)
# TO THIS - copy this block when you want prepare single makefile in every directory

all: all_dir

all_dir:
	@for dir in */; do \
		echo "Make" $$dir ;\
		cd $$(pwd)/$$dir ;\
		flex -l *\.l ;\
		gcc -o scan.x lex.yy.c ;\
		rm lex.yy.c ;\
		cd .. ;\
	done
