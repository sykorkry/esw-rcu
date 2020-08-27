for VARIABLE in {1..10}
do
  echo "THREADS:" $VARIABLE
	./list_rwlock $VARIABLE
done