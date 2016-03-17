[ -z "$CHPL_HOME" ] && echo "Need to set $CHPL_HOME" && exit 1;
$CHPL_HOME/util/start_test -compopts -M -compopts $PWD/ -compopts --print-search-dirs ./test 
