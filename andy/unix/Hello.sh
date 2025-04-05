for i in Bob Andy Jasmine; do
  cat name.sh | sed "s/Donny/$i/g" | bash
done