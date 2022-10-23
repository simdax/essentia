#! /bin/sh

audioFile="audio.wav"
part=1
usage() {
   echo "Usage: $(basename $0) [-a] audiofile [-p] part "
   exit 1
}

while getopts 'a:p:h' opt; do
   case $opt in
   a)
      echo setting audio
      audioFile="$OPTARG"
      ;;
   p)
      echo setting part
      part="$OPTARG"
      ;;
   h)
      usage
      shift;;
   :)
      echo option requires an argument.
      usage
      shift;;
   ?)
      usage
   esac
done

#./build/src/examples/essentia_streaming_simon "test/models/effnetdiscogs/effnetdiscogs-bs64-1.pb" $audioFile $part
./simon_test "test/models/effnetdiscogs/effnetdiscogs-bs64-1.pb" $audioFile $part
