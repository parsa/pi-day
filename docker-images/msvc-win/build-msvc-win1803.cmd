docker build -t prsam/pi-day:msvc-win1803 . -f msvc-win.dockerfile --build-arg FROM_IMAGE=4.7.2-sdk-windowsservercore-1803
docker push prsam/pi-day:msvc-win1803