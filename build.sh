cd `dirname $0`

python="python3.9"
algo=\
"Resample,FFT,TriangularBands,Spectrum,Windowing,MelBands,Magnitude,NoiseAdder,\
UnaryOperator,TensorflowInputMusiCNN,TensorToPool,TensorToVectorReal,\
TensorflowPredictEffnetDiscogs,TensorflowPredict,PoolToTensor,\
FileOutputProxy,FrameCutter,VectorRealToTensor"

brew unlink ffmpeg 
brew install pkg-config readline sqlite gdbm freetype libpng eigen libyaml fftw libsamplerate libtag tensorflow
brew install ffmpeg@2.8 
export PKG_CONFIG_PATH="/opt/homebrew/opt/ffmpeg@2.8/lib/pkgconfig"
$python -m pip install numpy matplotlib pyyaml
CC=clang CXX=clang++ $python waf configure --build-static --with-tensorflow --with-python --include-algos=$algos
$python waf
sudo $python waf install