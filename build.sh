brew unlink ffmpeg 

brew install pkg-config readline sqlite gdbm freetype libpng eigen libyaml fftw libsamplerate libtag tensorflow

brew install ffmpeg@2.8 
export PKG_CONFIG_PATH="/opt/homebrew/opt/ffmpeg@2.8/lib/pkgconfig"

python3.9 -m pip install numpy matplotlib pyyaml

#CC=clang CXX=clang++ python3 waf configure --cross-compile-ios --lightweight= --fft=ACCELERATE --build-static --with-tensorflow
#CC=clang CXX=clang++ python3 waf configure --cross-compile-ios-sim --lightweight= --fft=ACCELERATE --build-static --with-tensorflow --include-algos=TensorflowPredict
#export PKG_CONFIG_PATH="/Users/SX/FFmpeg-iOS-build-script/thin/arm64/lib/pkgconfig"
CC=clang CXX=clang++ python3 waf configure --build-static --with-tensorflow --with-python \
--include-algos="FFT,TriangularBands,Spectrum,Windowing,MelBands,Magnitude,NoiseAdder,UnaryOperator,TensorflowInputMusiCNN,TensorflowPredictEffnetDiscogs,TensorflowPredict,PoolToTensor,FileOutputProxy,FrameCutter"

python3 waf
python3 waf install

#ranlib build/src/libessentia.a