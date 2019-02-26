docker build -t prsam/pi-day:msvc-win1709 . -f msvc-win.dockerfile --build-arg FROM_IMAGE=3.5-sdk-windowsservercore-1709
docker push prsam/pi-day:msvc-win1709