#
# Take a picture with the webcam (this needs lots of work)
# 
# Nick Loadholtes <nick@ironboundsoftware.com>
#
# if linux
if [[ $(uname) == 'Linux' ]]; then
  streamer -q -s 2560x1440 -o ~/commit_pics/nick-$(date +%Y_%m_%d-%H_%M_%S).jpeg
else
  # if osx
  echo "Running on a mac?"
  imagesnap
fi
