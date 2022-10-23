
export PKG_CONFIG_PATH="/opt/homebrew/opt/ffmpeg@2.8/lib/pkgconfig"
AVCODEC=`pkg-config --libs libavcodec`
AVFORMAT=`pkg-config --libs libavformat`
AVUTIL=`pkg-config --libs libavutil`
SWRESAMPLE=`pkg-config --libs libswresample`
SWSCALE=`pkg-config --libs libswscale`

FLAGS=""
clang++ src/examples/streaming_simon.cpp $FLAGS \
-Isrc/ -I/opt/homebrew/lib/python3.9/site-packages/tensorflow/include \
-L./build/src -lessentia \
$AVCODEC $AVFORMAT $AVUTIL $SWRESAMPLE $SWSCALE \
-L/opt/homebrew/lib -lyaml -lsamplerate -ltag -lfftw3f -ltensorflow \
-o simon_test
