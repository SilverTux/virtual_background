# Virtual background and effect for v4l2loopback device

This repo is based on Benjamin Elder's work
https://elder.dev/posts/open-source-virtual-background/

The main difference is that this solution uses CPU power instead GPU
so there is no nvidia dependecy, but this solution is much slower (~5-20 FPS based on your CPU).
Before start using this you will need to load the v4l2loopback kernel module (and don't
forget to close every application before this which could use your webcam)
with this command:

```
sudo modprobe v4l2loopback devices=1 video_nr=20 card_label="v4l2loopback" exclusive_caps=1
```

You need also provide a background.jpg which will be included in the container.

```
cp /some/path/to/mybackground.jpg .
```

Another difference is that only one Docker container used so you only
need to run like the following:

```
./start.sh
```

This will build the container and run it with the necessary parameters.

## License

https://creativecommons.org/licenses/by-sa/4.0/

## Additional information
https://github.com/tensorflow/tfjs-models/tree/master/body-pix
