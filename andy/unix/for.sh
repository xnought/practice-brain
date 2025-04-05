for i in 1 2 3
do
  echo "Number: $i"
done

echo "---------------------"

for i in {1..5}
do
  echo "Number: $i"
done

echo "---------------------"

for i in {1..5}
do 
  printf "sub-%02d\n" $i
done
