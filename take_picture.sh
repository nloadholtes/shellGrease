#
# Take a picture with the webcam (this needs lots of work)
# 
# Nick Loadholtes <nick@ironboundsoftware.com>
#
# if linux
if [[ $(uname) == 'Linux' ]]; then
  mplayer -vo png -frames 1 tv://
else
  # if osx
  # to do
  echo "Running on a mac?"
fi
