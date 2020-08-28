for VARIABLE in {1..10}
do
  echo "THREADS:" $VARIABLE
	./list_mutex $VARIABLE
#	./list_rwlock $VARIABLE
#	./list_rcu $VARIABLE
done