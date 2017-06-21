#!/bin/bash
export PYTHONPATH=${BUILDER_TOP_DIR}/Editor/PyQtBEmacs:${BUILDER_TOP_DIR}/Editor/exe-pybemacs
export BEMACS_EMACS_LIBRARY=${BUILDER_TOP_DIR}/Kits/Linux/ROOT/usr/local/lib/bemacs

if [ "$1" = "--gdb" ]
then
    shift 1
    echo
    echo >.gdbinit
    if [ -e init.gdb ]
    then
        cat init.gdb >>.gdbinit
    fi
    echo "run -u be_main.py " "$@" >>.gdbinit
    echo
    gdb python${PYTHON_VERSION}

elif [ "$1" = "--valgrind" ]
then
    shift 1

    rm -f .gdbinit


    if [ "$1" = "--gdb" ]
    then
        shift 1
        valgrind \
            --db-attach=yes \
            ${TMPDIR:-/tmp}/python -u be_main.py "$@"

    else
        valgrind \
            --log-file=bemacs-memcheck.log \
            ${TMPDIR:-/tmp}p/python -u be_main.py "$@"
    fi

else
    python${PYTHON_VERSION} -u be_main.py "$@"
fi
