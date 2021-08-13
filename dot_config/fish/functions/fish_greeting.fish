function fish_greeting
  set Fishers_of_Men \
  "Then He said to them, “Follow Me, and I will make you fishers of men.”\n\t-Matthew 4:19" \
  "And Jesus said to them, “Follow me, and I will make you become fishers of men.”\n\t-Mark 1:17" \
  "And Jesus said to Simon, “Do not be afraid; from now on you will be catching men.”\n\t -Luke 5:10"
  echo -e (random choice $Fishers_of_Men) "><>"
end
