DEVICE="FaceTime HD カメラ（ディスプレイ）"

while :
do
    imagesnap -d "$DEVICE" $(gdate +"%y%m%d_%H").gif
    sleep $((60*60))
done
