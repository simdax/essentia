cd `dirname $0`

python="python3.9"
algos=\
"FFT,TriangularBands,Spectrum,Windowing,MelBands,Magnitude,NoiseAdder,\
UnaryOperator,TensorflowInputMusiCNN,TensorToPool,TensorToVectorReal,\
Resample,\
TensorflowPredictEffnetDiscogs,\
TensorflowInputVGGish,TensorflowPredictVGGish,\
TensorflowPredict,PoolToTensor,\
FileOutputProxy,FrameCutter,VectorRealToTensor"

brew unlink ffmpeg 
brew install pkg-config readline sqlite gdbm freetype libpng eigen libyaml fftw libsamplerate libtag tensorflow
brew install ffmpeg@2.8 
export PKG_CONFIG_PATH="/opt/homebrew/opt/ffmpeg@2.8/lib/pkgconfig"
$python -m pip install numpy matplotlib pyyaml
CC=clang CXX=clang++ $python waf configure --build-static --with-tensorflow --with-python --include-algos="$algos"
sudo $python waf install

CC=clang CXX=clang++ $python waf configure --cross-compile-ios-sim --build-static --include-algos="$algos" -o build_ios_sim
$python waf
CC=clang CXX=clang++ $python waf configure --cross-compile-ios --build-static --include-algos="$algos" -o build_ios
$python waf